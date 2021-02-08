require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

def scrape(keyword)
  url = "https://www.allrecipes.com/search/results/?wt=#{keyword}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  recipes = []

  html_doc.search('.fixed-recipe-card').first(5).each do |element|
    name = element.search('.fixed-recipe-card__title-link').first.text.strip
    description = element.search('.fixed-recipe-card__description').text.strip
    exact_rating = element.search('.stars')[0]["data-ratingstars"]
    rating = exact_rating.to_f.round()

    recipe = Recipe.new(name, description, rating)
    recipes << recipe
  end
  return recipes
end
