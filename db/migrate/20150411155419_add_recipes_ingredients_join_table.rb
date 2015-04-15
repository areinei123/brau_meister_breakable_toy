class AddRecipesIngredientsJoinTable < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false
      t.float :amount, default: 1, null: false

      t.timestamps
    end
      add_index :lists, [:recipe_id, :ingredient_id], unique: true
  end
end
