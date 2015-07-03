class AddStationId < ActiveRecord::Migration
  def change
    add_column :addresses, :station_id, :integer
  end
end
