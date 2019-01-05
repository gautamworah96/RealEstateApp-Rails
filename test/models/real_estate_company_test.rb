require 'test_helper'

class RealEstateCompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    puts "Running #{self.method_name}"
  end

  test "valid real estate company" do
     r = RealEstateCompany.new(id: 1, name: "company_name_1", website: "https://company_1_website", address: "company_1_address", founded: 1901,
                               revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert r.save

  end

  test "invalid real estate company no name cannot be saved" do
    r = RealEstateCompany.new(id: 1, website: "https://company_1_website", address: "company_1_address", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end

  test "invalid real estate company no address cannot be saved" do
    r = RealEstateCompany.new(id: 1, name:"xyz", website: "https://company_1_website", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end


  test "invalid real estate company no website cannot be saved" do
    r = RealEstateCompany.new(id: 1, name:"xyz", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end



  test "invalid real estate company website length greater than 100 cannot  be saved" do
    r = RealEstateCompany.new(id: 1, name:"http://abcdefghijhklmopqrstuvwxyzabcdefghijhklmopqrstuvwxyzabcdefghijhklmopqrstuvwxyzabcdefghijhklmopqrstuvwxyz", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end

  test "invalid real estate company website not in correct format cannot be saved" do
    r = RealEstateCompany.new(id: 1, name:"xyz", website: "company_1_website", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end


  test "invalid real estate company name greater than 100" do
    r = RealEstateCompany.new(id: 1, name: "abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz", website: "https://company_1_website", address: "company_1_address", founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end


  test "invalid real estate company address greater than 100" do
    r = RealEstateCompany.new(id: 1, name: "company_1_address", address: "abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz:abcdefghijhklmopqrstuvwxyz", website: "https://company_1_website",  founded: 1901,
                              revenue: 10000, synopsis: "company_1_synopsis", created_at: "2018-10-08 17:03:19", updated_at: "2018-10-08 17:03:19", user_id: nil)
    assert_not r.save

  end

end
