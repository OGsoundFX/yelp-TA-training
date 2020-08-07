class RestaurantsController < ApplicationController
  def home
    @category = ["chinese", "italian", "japanese", "french", "belgian"]
  end
  def index
    @restaurants = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def top
    # @restaurants = Restaurant.joins(:reviews).where(reviews: { rating: 5 })

    @all_restaurants = Restaurant.all
    list_of_top_restaurants = []

    @all_restaurants.each do |restaurant|
      reviews = 0
      restaurant.reviews.each do |review|
        reviews += review.rating
      end
      average_rating = reviews / restaurant.reviews.count
      list_of_top_restaurants << restaurant.id if average_rating >= 3
    end
    @restaurants = Restaurant.where(id: list_of_top_restaurants)
  end

  def category
    @restaurants = Restaurant.where(category: params[:restaurant_id])
  end

end
