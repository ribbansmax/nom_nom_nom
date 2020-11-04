require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def test_it_exists_and_has_attributes
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    assert_equal "Mac and Cheese", recipe1.name
    assert_equal ({}), recipe1.ingredients_required
  end

  def test_it_can_add_ingredients
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expected = {
      ingredient1 => 6,
      ingredient2 => 8
    }

    assert_equal expected, recipe1.ingredients_required
  end

  def test_it_can_return_ingredients
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    assert_equal [ingredient1, ingredient2], recipe1.ingredients
  end

  def test_it_can_return_total_calories
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    assert_equal 440, recipe1.total_calories
  end

  def test_it_can_return_ingredient_names
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    assert_equal ["Cheese", "Macaroni"], recipe1.ingredient_names
  end
end