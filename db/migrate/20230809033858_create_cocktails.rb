class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :name, null: false
      t.text :description
      t.integer :base_id, null: false
      t.integer :type_id, null: false
      t.text :ingredient
      t.text :tool
      t.text :recipe
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
