class Ingredient < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|

      t.belongs_to :recipes

    end
  end
end
