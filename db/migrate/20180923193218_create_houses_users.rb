class CreateHousesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :houses_users, :id => false do |t|
      t.integer :house_id
      t.integer :user_id
    end

  end
end
