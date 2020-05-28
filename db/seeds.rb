recipe_list = [
  [ "Oatmeal", "oats, milk, butter", "add hot water" ],
  [ "Spagetti", "noodles, sauce", "boil and add sauce" ],
  [ "Toast", "bread, butter", "Put in toaster (not together)" ],

]

recipe_list.each do |name, ingredient, instruction|
  Recipe.create( name: name, ingredient: ingredient, instruction: instruction )
end
