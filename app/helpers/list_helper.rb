module ListHelper

  def calculate_gravity

   @recipe.lists.each do |list|
     if list.ingredient_id < 72
       @total_gravity += list.individual_gravity
     end
   end
     ((@total_gravity/1000) + 1).round(3)
  end

end
