require "application_system_test_case"

class HousesTest < ApplicationSystemTestCase
  setup do
    @house = houses(:one)
  end

  test "visiting the index" do
    visit houses_url
    assert_selector "h1", text: "Houses"
  end

  test "creating a House" do
    visit houses_url
    click_on "New House"

    fill_in "Current House Owner", with: @house.current_house_owner
    fill_in "Has Basement", with: @house.has_basement
    fill_in "List Price", with: @house.list_price
    fill_in "Location", with: @house.location
    fill_in "Num Floors", with: @house.num_floors
    fill_in "Real Estate Company", with: @house.real_estate_company_id
    fill_in "Realtor", with: @house.realtor_id
    fill_in "Square Footage", with: @house.square_footage
    fill_in "Style", with: @house.style
    fill_in "Year Built", with: @house.year_built
    click_on "Create House"

    assert_text "House was successfully created"
    click_on "Back"
  end

  test "updating a House" do
    visit houses_url
    click_on "Edit", match: :first

    fill_in "Current House Owner", with: @house.current_house_owner
    fill_in "Has Basement", with: @house.has_basement
    fill_in "List Price", with: @house.list_price
    fill_in "Location", with: @house.location
    fill_in "Num Floors", with: @house.num_floors
    fill_in "Real Estate Company", with: @house.real_estate_company_id
    fill_in "Realtor", with: @house.realtor_id
    fill_in "Square Footage", with: @house.square_footage
    fill_in "Style", with: @house.style
    fill_in "Year Built", with: @house.year_built
    click_on "Update House"

    assert_text "House was successfully updated"
    click_on "Back"
  end

  test "destroying a House" do
    visit houses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "House was successfully destroyed"
  end
end
