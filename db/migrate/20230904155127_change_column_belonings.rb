class ChangeColumnBelonings < ActiveRecord::Migration[7.0]
  def change
    change_column :belongings, :status, :integer, default: 0
  end
end
