class ChangeIngredientsMainClassSubType < ActiveRecord::Migration
  def change
    remove_column :ingredients, :type_class, :string
    add_column :ingredients, :main_class, :string
    add_column :ingredients, :sub_type, :string
  end
end
