class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name, null:false
      t.belongs_to :recipes

    end
  end
end
