class CreateBelongings < ActiveRecord::Migration[7.0]
  def change
    create_table :belongings do |t|
      t.string :name
      t.integer :status
      t.text :description
      t.references :flat, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
