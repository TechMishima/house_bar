class AddAlcoholIdToCocktails < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :alcohol_id, :integer
  end
end
