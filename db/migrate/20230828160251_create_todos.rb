class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :description
      t.integer :status
      t.references :belonging, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
