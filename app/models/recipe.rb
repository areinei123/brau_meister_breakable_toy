class Recipe < ActiveRecord::Base
	has_many :ingredients
	has_many :yeasts, through: :ingredients
	has_many :grains, through: :ingredients
	has_many :hops, through: :ingredients
	has_one :category

	belongs_to :users

end
