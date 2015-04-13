class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, index:true, null:false
      t.boolean :visibility, default:false
      t.integer :batch_size, null:false       
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
