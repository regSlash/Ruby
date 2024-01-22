require_relative 'item_container'
require 'json'
require 'csv'

class Cart
  include ItemContainer

  def initialize
    @items = []
  end

  def save_to_file(format)
    case format
    when 'txt'
      save_to_txt
    when 'json'
      save_to_json
    when 'csv'
      save_to_csv
    else
      puts "Unsupported format: #{format}"
    end
  end

  def save_to_txt
    File.open("#{data_path}/cart.txt", 'w') do |file|
      @items.each do |item|
        file.puts "#{item.name}, #{item.price}, #{item.category}, #{item.description}, #{item.availability}"
      end
    end
    puts 'Cart saved to TXT file.'
  end

  def save_to_json
    File.open("#{data_path}/cart.json", 'w') do |file|
      file.puts JSON.pretty_generate(@items.map(&:to_h))
    end
    puts 'Cart saved to JSON file.'
  end

  def save_to_csv
    CSV.open("#{data_path}/cart.csv", 'w') do |csv|
      csv << ['Name', 'Price', 'Category', 'Description', 'Availability']
      @items.each do |item|
        csv << [item.name, item.price, item.category, item.description, item.availability]
      end
    end
    puts 'Cart saved to CSV file.'
  end

  def show_all_items
    @items.map(&:to_s).join("\n")
  end
end