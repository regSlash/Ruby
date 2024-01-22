require_relative 'main_application'
require_relative 'item'
require_relative 'cart'
require_relative 'parser'

# Створення об'єкту MainApplication з вказанням даних користувача та шляху для збереження даних
app = MainApplication.new(user_data: { username: 'ed.koshman@gmail.com', email: 'ed.koshman@gmail.com' }, data_path: 'data')

# Створення об'єкту Cart та додавання товарів
cart = Cart.new
item1 = Item.new('Product 1', 20.0, 'Category A', 'Description A', true)
item2 = Item.new('Product 2', 30.0, 'Category B', 'Description B', false)

cart.add_item(item1)
cart.add_item(item2)

# Збереження кошика у різних форматах
cart.save_to_file('txt')
cart.save_to_json
cart.save_to_csv

# Демонстрація використання модулів ItemContainer
puts "Items in the cart: #{cart.show_all_items}"

# Парсинг елементу з сайту за допомогою Nokogiri
html_data = "<div class='product'><h2>Product 3</h2><span class='price'>25.0</span></div>"
parsed_item = Parser.parse_item(html_data)

# Виведення інформації про парсерований елемент
parsed_item.info do |item|
  puts "Parsed Item Info: #{item.name}, #{item.price}, #{item.category}"
end