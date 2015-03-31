class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.string :name, null:false
      t.string :yeast_type, null:false
      t.float :attenuation, null:false

      t.belongs_to :ingredients

      t.timestamps null: false
    end
  end
end
