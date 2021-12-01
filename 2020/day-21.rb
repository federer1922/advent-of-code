# Part one

data = []

File.readlines("data_21.txt").each do |line| 
  data << line.strip
end

food_and_allergens = []

data.each do |line|
  food_and_allergens << line.split("(contains").map { |split| split.scan(/\w+/) }
end

ingredients = food_and_allergens.map { |food| food[0] }.flatten
allergens = food_and_allergens.map { |allergen| allergen[1] }.flatten.uniq

allergen_ingredients = {}

allergens.each do |allergen|
  allergen_ingredients[allergen] = ingredients.uniq 
end

food_and_allergens.each do |food, allergens| 
  allergens.map do |allergen| 
    allergen_ingredients[allergen] &= food 
  end 
end

ingredients_with_allergens = allergen_ingredients.values.flatten.uniq
ingredients_without_allergens = ingredients

ingredients_with_allergens.each do |ingredient|
  ingredients.delete(ingredient)    
end

puts "Part one answer: #{ ingredients_without_allergens.size }" 