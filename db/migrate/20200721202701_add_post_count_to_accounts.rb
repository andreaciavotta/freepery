class AddPostCountToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :posts_count, :integer, default: 0
  end
end
