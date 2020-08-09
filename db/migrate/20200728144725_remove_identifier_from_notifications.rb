class RemoveIdentifierFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :identifier, :integer
  end
end
