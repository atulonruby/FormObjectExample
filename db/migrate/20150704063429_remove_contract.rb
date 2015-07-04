class RemoveContract < ActiveRecord::Migration
  def change
    drop_table :contracts
    drop_table :people
  end
end
