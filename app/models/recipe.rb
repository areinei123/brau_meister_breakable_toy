class Recipe < ActiveRecord::Base
  has_many :lists
  has_many :ingredients, through: :lists

  validates :name, presence: true
  validates :batch_size, presence: true, numericality: { greater_than: 0 }
  belongs_to :user

  accepts_nested_attributes_for :lists

  def total_gravity
    @total_gravity = 0
    lists.each do |list|
      if list.ingredient.is_a_grain?
        @total_gravity += list.individual_gravity
      end
    end
    (@total_gravity / 1000) + 1
  end

  def total_ibu
    @total_ibu = 0
    lists.each do |list|
      if list.ingredient.is_a_hop?
        @total_ibu += list.individual_ibu_level(@total_gravity)
      end
    end
    @total_ibu
  end

  def total_abv
    @total_abv = 0
    lists.each do |list|
      if list.ingredient.is_a_yeast?
        @total_abv = list.og_to_abv(@total_gravity)
      end
    end
    @total_abv
  end
end
