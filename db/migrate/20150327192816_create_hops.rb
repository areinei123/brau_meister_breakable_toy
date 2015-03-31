class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.string :name, null:false
      t.float :alpha_acid, null:false
      t.string :origin, null:false

      t.belongs_to :ingredients

      t.timestamps null: false
    end
  end
end
