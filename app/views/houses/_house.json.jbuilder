json.extract! house, :id, :real_estate_company_id, :location, :square_footage, :year_built, :style, :list_price, :num_floors, :has_basement, :current_house_owner, :realtor_id, :created_at, :updated_at
json.url house_url(house, format: :json)
