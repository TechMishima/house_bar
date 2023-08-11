class RemoveBaseIdFromCocktails < ActiveRecord::Migration[7.0]
  def change
    remove_column :cocktails, :base_id, :integer
  end
end
