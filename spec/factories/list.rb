FactoryGirl.define do
  factory :list do
    association :recipe, factory: :recipie
    ingredient :ingredient, factory: :ingredient
    amount         1.0
    boil_time     0
  end
end
