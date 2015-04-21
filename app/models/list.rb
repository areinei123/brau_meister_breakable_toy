class List < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :ingredient_id, presence: true

  def individual_gravity
    ((extract_potential_to_gu * self.amount) * 0.72) / Recipe.find(self.recipe_id).batch_size
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

  def og_to_abv(gravity)
    (gu_to_og(gravity) - gu_to_og(gravity * ((100 - Ingredient.find(self.ingredient_id).attenuation ) / 100))) * 131
  end
end
