class ModifyAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :is_active
    remove_column :addresses, :priority
    add_column :addresses, :priority, :string
  end
end
