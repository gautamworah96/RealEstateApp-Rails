class AddRealEstateCompanyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :real_estate_company_id, :integer
  end
end
