class AddAddressToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :address, :string
  end
end
