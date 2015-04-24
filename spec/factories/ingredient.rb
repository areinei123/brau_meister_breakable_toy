FactoryGirl.define do
  factory :ingredient do
    name 'Vienna Malt'
    type_class 'Grain'
    extract_potential 1.036
    alpha_acid nil
    attenuation nil
  end
end


 # # # write factories for each of these types:
 # 'Extract'
 # 'Adjunct'
 # 'Sugar'
 # 'Sour
