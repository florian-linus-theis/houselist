class ChangeStatusFromTodo < ActiveRecord::Migration[7.0]
  def change
    change_column_default :todos, :status, "active"
  end
end
