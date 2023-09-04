class AddBelongingStatusToTodo < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :belonging_status, :integer
  end
end
