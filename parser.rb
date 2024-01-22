require 'nokogiri'

class Parser
  def self.parse_item(html_data)
    doc = Nokogiri::HTML(html_data)
    name = doc.at('h2').text
    price = doc.at('.price').text.to_f

    # Додаткові селектори та логіка парсингу для інших властивостей елементу
    category = doc.at('.category').text
    description = doc.at('.description').text
    availability = doc.at('.availability').text.downcase == 'available'

    Item.new(name, price, category, description, availability)
  end
end