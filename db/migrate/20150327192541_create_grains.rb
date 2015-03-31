class CreateGrains < ActiveRecord::Migration
  def change
    create_table :grains do |t|
      t.string :name, null:false
      t.string :grain_type, null:false
      t.float :extract_potential, null:false

      t.belongs_to :ingredients

      t.timestamps null: false
    end
  end
end
