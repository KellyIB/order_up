require 'rails_helper'

describe "as a visitor" do
  describe "visiting dish show page" do
    it "I can see chef name and dish ingredients" do
      chef_1 = Chef.create!(name: "Bertha")
      fruit_salad = chef_1.dishes.create!(name: "Fruit Salad", description: "Fresh fruit hand-mixed daily")

      orange = Ingredient.create!(name: "Orange", calories: 45)
      apple = Ingredient.create!(name: "Apple", calories: 40)
      grape = Ingredient.create!(name: "Grapes", calories: 50)
      banana = Ingredient.create!(name: "Banana", calories: 90)
      strawberry = Ingredient.create!(name: "Strawberries", calories: 46)

      IngredientDish.create!(dish: fruit_salad, ingredient: orange)
      IngredientDish.create!(ingredient: apple, dish: fruit_salad)
      IngredientDish.create!(ingredient: grape, dish: fruit_salad)
      IngredientDish.create!(ingredient: banana, dish: fruit_salad)
      IngredientDish.create!(ingredient: strawberry, dish: fruit_salad)

      visit dish_path(fruit_salad)

      expect(page).to have_content(fruit_salad.chef.name)

        expect(page).to have_content(orange.name)
        expect(page).to have_content(apple.name)
        expect(page).to have_content(grape.name)
        expect(page).to have_content(banana.name)
        expect(page).to have_content(strawberry.name)
    end
  end
end
