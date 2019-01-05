class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :real_estate_company, foreign_key: true
      t.string :location
      t.string :square_footage
      t.string :year_built
      t.string :style
      t.integer :list_price
      t.integer :num_floors
      t.boolean :has_basement
      t.string :current_house_owner
      t.references :realtor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
