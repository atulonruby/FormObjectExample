class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :person_id
      t.string :station_id

      t.timestamps null: false
    end
  end
end
