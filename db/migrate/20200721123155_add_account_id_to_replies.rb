class AddAccountIdToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :account_id, :integer
  end
end
