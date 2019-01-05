require 'test_helper'

class RealEstateCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate_company = RealEstateCompany.new(name: "wilson", website: "http://www.google.com", address: "ncsu campus", founded:"1950", revenue:2000,synopsis:"oldest real estate")
    @password = "password"
    @user = User.create(email: "#{rand(50000)}@example.com",
                        password: @password)
    sign_in(user: @user, password: @password)
    puts "Running #{self.method_name}"

  end

  test "should get index" do
    get real_estate_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_company_url
    assert_response :success
  end

  test "should create real_estate_company" do


      post real_estate_companies_url, params: { real_estate_company: { address: @real_estate_company.address, founded: @real_estate_company.founded, name: @real_estate_company.name, revenue: @real_estate_company.revenue, synopsis: @real_estate_company.synopsis, website: @real_estate_company.website } }
      r = RealEstateCompany.find_by_name('wilson')
      assert_redirected_to "/real_estate_companies/#{r.id}"
  end

  test "should show real_estate_company" do
    post real_estate_companies_url, params: { real_estate_company:{name:@real_estate_company.name, address:"some addr", website:@real_estate_company.website}}

    r = RealEstateCompany.find_by_name('wilson')
    get real_estate_company_url(r)
    assert_response :success
  end

  test "should get edit and update" do
    post real_estate_companies_url, params: { real_estate_company:{name:@real_estate_company.name, address:"some addr", website:@real_estate_company.website}}

    r = RealEstateCompany.find_by_name('wilson')
    get real_estate_company_path(r.id)

    # puts "==============================="
    # puts r.inspect
    # puts "==============================="

    assert_response :success
    sign_in(user: @user, password: @password)

    r.name='new name'
    put  "/real_estate_companies/#{r.id}", params: {real_estate_company:r.as_json}
    assert_redirected_to

  end

  test "should destroy real_estate_company" do
    post real_estate_companies_url, params: { real_estate_company:{name:@real_estate_company.name, address:"some addr", website:@real_estate_company.website}}

    r = RealEstateCompany.find_by_name('wilson')
    # puts "==============================="
    # puts r.inspect
    # puts "==============================="


    get real_estate_company_url(r.id)

    # puts "==============================="
    # puts r.inspect
    # puts "==============================="

    assert_response :success
    sign_in(user: @user, password: @password)

    delete  "/real_estate_companies/#{r.id}", params: {:id => r.id}

    assert_redirected_to real_estate_companies_path
  end
end

