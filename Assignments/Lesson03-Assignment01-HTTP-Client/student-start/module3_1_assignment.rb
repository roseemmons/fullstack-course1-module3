require 'httparty'

# Visual note: Search
# http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken
# Response:
# {
# "count": 1,
# "recipes": [{
# "publisher": "Allrecipes.com",
# "social_rank": 99.81007979198002,
# "f2f_url": "http://food2fork.com/F2F/recipes/view/29159",
# "publisher_url": "http://allrecipes.com",
# "title": "Slow-Cooker Chicken Tortilla Soup",
# "source_url": "http://allrecipes.com/Recipe/Slow-Cooker-Chicken-Tortilla-Soup/Detail.aspx",
# "page":1}]
# }

class Recipe
  include HTTParty
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for(search_term)
    get("/search", query: { q: search_term })["recipes"]
  end
end
