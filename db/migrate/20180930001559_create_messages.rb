class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :content
      t.integer :sender
      t.integer :receiver

      t.timestamps
    end
  end
end
