class Ingredient < ActiveRecord::Base
  has_many :lists
  has_many :recipes, through: :lists

  def method_missing(method_sym)
    if method_sym.to_s =~ /^is_a_(.*)?$/
      self.main_class == $1.chomp("?")
    else
      super
    end
  end
end
