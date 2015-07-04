class AddPhoneAndEmailToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :email, :string
    add_column :addresses, :phone, :integer
    remove_column :stations, :description, :string
    remove_column :addresses, :url, :string
  end
end
