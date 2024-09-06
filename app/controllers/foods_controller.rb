class FoodsController < ApplicationController
  def index
    ingredient_search = params[:q]
    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.usda[:key]
  end
  
    response = conn.get("/fdc/v1/foods/search?query=#{ingredient_search}&pageSize=10")
    
    json = JSON.parse(response.body, symbolize_names: true)
    @total_hits = json[:totalHits]
    @all_foods = json[:foods].map do |food_data|
      Food.new(food_data)
    end
  end
end