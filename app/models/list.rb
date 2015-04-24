class List < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :ingredient_id, presence: true
 
end
