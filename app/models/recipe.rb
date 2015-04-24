class Recipe < ActiveRecord::Base
  has_many :lists
  has_many :ingredients, through: :lists

  validates :name, presence: true
  validates :batch_size, presence: true, numericality: { greater_than: 0 }
  belongs_to :user

  accepts_nested_attributes_for :lists

  def individual_gravity
    ((extract_potential_to_gu * self.amount) * 0.72) / self.recipe.batch_size
  end

  def total_gravity
    @total_gravity = 0
    self.lists.each do |list|
      if list.ingredient.is_a_grain?
        @total_gravity += list.ingredient.individual_gravity
        binding.pry
      end
    end
    @total_gravity
  end

  def extract_potential_to_gu
    ((Ingredient.find(self.ingredient_id).extract_potential) - 1) * 1000
  end

  def gu_to_og(value)
    (value / 1000) + 1
  end

  def individual_ibu_level(gravity)
    (self.amount * (0.30 * self.boil_time) * (Ingredient.find(self.ingredient_id).alpha_acid / 100) * 7490) / (Recipe.find(self.recipe_id).batch_size * (1 + (gravity / 0.5)))
  end

  def total_ibu
    @total_ibu = 0
    self.each do |list|
      if list.ingredient_id > 71  && list.ingredient_id < 119
        @total_ibu += list.individual_ibu_level(@total_gravity)
      end
    end
  end

  def og_to_abv(gravity)
    (gu_to_og(gravity) - gu_to_og(gravity * ((100 - Ingredient.find(self.ingredient_id).attenuation ) / 100))) * 131
  end

  def total_abv
    @total_abv = 0
    @recipe.lists.each do |list|
      if list.ingredient_id > 118
        @total_abv = list.og_to_abv(@total_gravity)
      end
    end
  end
end
