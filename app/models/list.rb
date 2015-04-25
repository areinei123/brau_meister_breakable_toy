class List < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :ingredient_id, presence: true
 
  def individual_gravity
    ((ingredient.extract_potential_to_gu * amount) * 0.72) / recipe.batch_size
  end

  def individual_ibu_level(gravity)
    (amount * (0.30 * boil_time) * (ingredient.alpha_acid / 100) * 7490) / (recipe.batch_size * (1 + (gravity / 0.5)))
  end

  def og_to_abv(gravity)
    (gu_to_og(gravity) - gu_to_og(gravity * ((100 - ingredient.attenuation ) / 100))) * 131
  end

  def gu_to_og(value)
    (value / 1000) + 1
  end
end
