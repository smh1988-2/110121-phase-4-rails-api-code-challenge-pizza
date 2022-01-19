class RestaurantPizzasController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        pizza = RestaurantPizza.create!(restaurant_pizzas_params)
        render json: pizza.pizza, status: :created
    end

    private

    def restaurant_pizzas_params
        params.permit(:id, :pizza_id, :restaurant_id, :price)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
