# frozen_string_literal: true

require_relative './router'
require_relative './app/controllers/meals_controller'
require_relative './app/repositories/meal_repository'
require_relative './app/repositories/customer_repository'
require_relative './app/controllers/customers_controller'
require_relative './app/repositories/employee_repository'
require_relative './app/repositories/order_repository'
require_relative './app/controllers/sessions_controller'
require_relative './app/controllers/orders_controller'

meal_csv_file_path = File.join(__dir__, '/data/meals.csv')
customer_csv_file_path = File.join(__dir__, '/data/customers.csv')
orders_csv_path = File.join(__dir__, '/data/orders.csv')

meal_repository = MealRepository.new(meal_csv_file_path)
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(customer_csv_file_path)
customers_controller = CustomersController.new(customer_repository)

employee_csv_file_path = File.join(__dir__, '/data/employees.csv')
employee_repository = EmployeeRepository.new(employee_csv_file_path)
sessions_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(orders_csv_path, meal_repository, customer_repository, employee_repository)

orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

router.run
