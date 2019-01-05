class AddUserToRealEstateCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estate_companies, :user_id, :integer
  end
end
