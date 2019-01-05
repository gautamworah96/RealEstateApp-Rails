class AddRealtorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :realtor, :boolean, {:default=>false}
    add_column :users, :house_hunter, :boolean, {:default=>false}
  end
end
