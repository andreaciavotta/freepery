class AddNameToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :username, :string
    add_column :accounts, :birthday, :datetime
  end
end
