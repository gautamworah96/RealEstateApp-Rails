class CreateRealEstateCompaniesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estate_companies_users, :id => false do |t|
      t.integer :real_estate_company_id
      t.integer :user_id
    end
  end
end
