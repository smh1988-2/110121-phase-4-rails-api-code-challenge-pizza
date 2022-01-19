class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_does_not_exist

    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        restaurant = Restaurant.find(restaurant_params[:id])
        render json: restaurant, serializer: RestaurantandpizzasSerializer, status: :ok
    end

    def destroy
        restaurant = Restaurant.find(restaurant_params[:id])
        restaurant.destroy
        head :no_content, status: :ok
    end

    private

    def restaurant_params
        params.permit(:id, :name, :address)
    end

    def record_does_not_exist
        render json: { "error" => "Restaurant not found" }, status: :not_found
    end

end
