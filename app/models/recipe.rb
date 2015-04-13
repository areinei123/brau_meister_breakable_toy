class Recipe < ActiveRecord::Base
	has_many :receipes_ingredients
  has_many :ingredients, through: :receipes_ingredients
	has_one :category

	belongs_to :user

end
