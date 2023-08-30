class AddColumnsToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :read, :boolean, default: false
    add_reference :notifications, :todo, null: false, foreign_key: true
  end
end
