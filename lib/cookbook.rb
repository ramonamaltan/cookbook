require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    store_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    store_csv
  end

  def mark_done(index)
    recipe = find(index)
    recipe.done
    store_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
      recipe.done! if row[3] == "true"
    end
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done]
      end
    end
  end
end
