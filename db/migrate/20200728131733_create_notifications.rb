class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :account, index: true
      t.references :notified_by, index: true
      t.references :post, index: true
      t.integer :identifier
      t.string :notice_type
      t.boolean :read, default: false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :accounts
    add_foreign_key :notifications, :accounts, column: :notified_by_id
    add_foreign_key :notifications, :posts
  end
end
