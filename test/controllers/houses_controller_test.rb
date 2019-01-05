require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @password = "password"
    @user = User.create(email: "#{rand(50000)}@example.com",
                                  password: @password)
    sign_in(user: @user, password: @password)

  end

  test "successful login of confirmed user" do
    get houses_interest_list_url
    assert_response :success


  end

  test "should get index" do
    get houses_url
    assert_response :success
  end

  test "should get new" do
    get new_house_url
    assert_response :success
  end


  test "should create house" do

    house = House.new(:location=>'avery')
    post '/houses', params: { house: { location: 'avery' } }

    assert_response :success

  end

  test "should get create and get house " do

    house = House.new(:location=>'avery')
    post '/houses', params: { house: { location: 'avery' } }

    assert_response :success

    h = House.first
    get '/houses', params: {:house=>h}

    assert_response :success

  end

  test "should get create and then update house " do

    house = House.new(:location=>'avery')
    post '/houses', params: { house: { location: 'avery' } }

    assert_response :success

    # how to call update ?
    #house.location="champions"
    #patch '/houses', params: {:id=>house.id}

    #assert_response :success

  end


  # test "should get create and then delete house " do
  #
  #   house = House.new(:location=>'avery')
  #   post '/houses', params: { house: { location: 'avery' } }
  #
  #   assert_response :success
  #
  #
  #   delete '/houses', params: {:house=>house}
  #
  #   assert_response :success
  #
  # end


end
