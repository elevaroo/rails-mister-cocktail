require 'json'
require 'open-uri'

Ingredient.destroy_all
puts 'database is clean'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

user['drinks'].each do |ingredient|
  p Ingredient.create!(name: ingredient['strIngredient1'])
end
