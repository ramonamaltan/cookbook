class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      x = recipe.done ? "x" : " "
      puts "#{index + 1}. [#{x}] #{recipe.name} (#{recipe.rating} / 5)"
    end
  end

  def ask_for(something)
    puts "What's the #{something} of the recipe?"
    gets.chomp
  end

  def keyword
    puts 'What ingredient would you like a recipe for?'
    keyword = gets.chomp
    puts "Looking for #{keyword} recipes on the Internet..."
  end
end
