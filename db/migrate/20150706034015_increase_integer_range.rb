class IncreaseIntegerRange < ActiveRecord::Migration
  def change
    remove_column :addresses, :phone
    add_column :addresses, :phone,  :integer, :limit => 8
  end
end
