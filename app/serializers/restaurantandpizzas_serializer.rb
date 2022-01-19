class RestaurantandpizzasSerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  has_many :pizzas, through: :restaurant_pizzas
end
