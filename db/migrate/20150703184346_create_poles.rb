class CreatePoles < ActiveRecord::Migration
  def change
    create_table :poles do |t|
      t.string :vote

      t.timestamps null: false
    end
  end
end
