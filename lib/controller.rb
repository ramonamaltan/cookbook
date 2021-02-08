require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
require_relative 'scraper'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # list all recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    # create a new recipe
    name = @view.ask_for('name')
    description = @view.ask_for('description')
    rating = @view.ask_for('rating')
    recipe = Recipe.new(name, description, rating)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    # destroy an existing recipe
    recipe_index = @view.ask_for('index')
    @cookbook.remove_recipe(recipe_index.to_i)
  end

  def import
    keyword = @view.keyword
    recipes = scrape(keyword)
    @view.display(recipes)
    index = @view.ask_for('index')
    recipe = recipes[index.to_i]
    @cookbook.add_recipe(recipe)
    list
  end

  def mark_as_done
    list
    index = @view.ask_for('index')
    @cookbook.mark_done(index.to_i)
  end
end
