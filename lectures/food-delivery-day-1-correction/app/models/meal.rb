class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attr={})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end
end

# new_meal = Meal.new(name: "soup", price: 16)
# new_meal.name