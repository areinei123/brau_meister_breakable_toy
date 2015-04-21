class Recipe < ActiveRecord::Base
  has_many :lists
  has_many :ingredients, through: :lists

  validates :name, presence: true
  validates :batch_size, presence: true, numericality: {greater_than: 0}
  belongs_to :user

  accepts_nested_attributes_for :lists

  def extract_potential_to_gu
    gravity_units = (extract_potential - 1) * 1000
  end

  def gu_to_og
    #original_gravity = 
  end

  def target_total_gravity_units(target_gravity, batch_size)
    total_gravity = batch_size * target_gravity.extract_potential_to_gu
  end


end
