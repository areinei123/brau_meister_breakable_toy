class Ingredient < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type_class
      t.float :extract_potential
      t.float :alpha_acid
      t.float :attenuation
      
    end
  end
end
