# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

Recipe.destroy_all
Ingredient.destroy_all
Dose.destroy_all

app_id = ENV['RECIPE_ID']
app_key = ENV['RECIPE_KEY']
url = "https://api.edamam.com/api/recipes/v2?type=public&q=chocolate&app_id=#{app_id}&app_key=#{app_key}&random=true"
response = JSON.parse(URI.open(url).read)
recipes = response["hits"]

Ingredient.create!({ name: "FAT", full_name: "Fat" })
Ingredient.create!({ name: "ENERC_KCAL", full_name: "Energy" })
Ingredient.create!({ name: "CHOCDF", full_name: "Carbs" })
Ingredient.create!({ name: "SUGAR", full_name: "Sugar" })
Ingredient.create!({ name: "PROCNT", full_name: "Protein" })

recipes.each do |recipe|
  name = recipe['recipe']['label']
  img_url = recipe['recipe']['image']
  instruction = recipe['recipe']["ingredientLines"].join(",")
  new_recipe = Recipe.create!({ name: name, img_url: img_url, instruction: instruction })
  Ingredient.all.each do |ingredient|
    amount = recipe['recipe']["totalNutrients"][ingredient.name]["quantity"]
    Dose.create!({ recipe_id: new_recipe.id, ingredient_id: ingredient.id, amount: amount.round() })
  end
end

p "done"
