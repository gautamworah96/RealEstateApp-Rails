class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy, :delete_image_attachment]

  # GET /houses
  # GET /houses.json
  def index
    if params[:search].blank?
      @houses = House.all
    else

      if params[:min_price].blank?
        min_price = 0
      else
        min_price = params[:min_price]
      end

      if params[:max_price].blank?
        max_price = 10000
      else
        max_price = params[:max_price]
      end

      if params[:min_size].blank?
        min_size = 0
      else
        min_size = params[:min_size]
      end

      if params[:max_size].blank?
        max_size = 10000
      else
        max_size = params[:max_size]
      end


      @houses = House.where(['location LIKE ?', "%#{params[:location]}%"])
                    .where(['list_price > ?',min_price])
                    .where(['list_price < ?', max_price])
                    .order("created_at DESC")
    end
    end


  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params.merge({ realtor_id: current_user.id }))

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /houses/for_realtor
  def for_realtor
    @house = House.new(house_params.merge({
      realtor_id: current_user.id,
      real_estate_company_id: current_user.real_estate_company_id
    }))

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_image_attachment
    @house.images.find_by_id(params[:image_id]).purge
    redirect_to edit_house_path(@house), notice: 'Image was successfully destroyed.'
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def interest_list
    house_ids = current_user.potential_houses.pluck(:id)
    @houses = House.where(id: house_ids)
  end

  def add_potential_buyer
    respond_to do |format|
      @house = House.find(params[:house_id])
      @house.potential_buyers << current_user
      format.html { redirect_to houses_interest_list_path, notice: 'House added to the list.' }
    end
  end

  def delete_potential_buyer
    respond_to do |format|
      @house = House.find(params[:house_id])
      @house.potential_buyers.delete(current_user)
      format.html { redirect_to houses_interest_list_path, notice: 'House removed from the list.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:real_estate_company_id, :location, :square_footage, :year_built, :style, :list_price, :num_floors, :has_basement, :current_house_owner, :realtor_id, images: [])
    end

end
