class Ingredient < ActiveRecord::Base
  has_many :lists
  has_many :recipes, through: :lists

  def extract_potential_to_gu
   (extract_potential - 1) * 1000
  end

  def method_missing(method_sym)
    if method_sym.to_s =~ /^is_a_(.*)?$/
      test = $1.chomp("?").capitalize
      main_class == test
    end
  end
end
