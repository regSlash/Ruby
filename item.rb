class Item
    attr_accessor :name, :price, :category, :description, :availability
  
    def initialize(name, price, category, description, availability)
      @name = name
      @price = price
      @category = category
      @description = description
      @availability = availability
    end
  
    def info(&block)
      block.call(self)
    end
  
    def to_s
      "#{name}, #{price}, #{category}, #{description}, #{availability}"
    end
  
    def to_h
      {
        name: name,
        price: price,
        category: category,
        description: description,
        availability: availability
      }
    end
  end