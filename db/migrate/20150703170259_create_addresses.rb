class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :url
      t.integer :priority
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
