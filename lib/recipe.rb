class Recipe
  attr_reader :name, :description, :rating, :done

  def initialize(name, description, rating)
    @name = name
    @description = description
    @rating = rating
    @done = false
  end

  def done!
    @done = true
  end
end
