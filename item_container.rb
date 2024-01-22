module ItemContainer
  module ClassMethods
    def class_method_example
      # Методи класу
    end
  end

  module InstanceMethods
    def add_item(item)
      @items << item
    end

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items
      @items = []
    end

    def method_missing(method_name, *args, &block)
      if method_name.to_s.start_with?('show_all_items')
        category = extract_category_from_method(method_name)
        show_items_by_category(category)
      else
        super
      end
    end

    private

    def extract_category_from_method(method_name)
      method_name.to_s.split('_').last.capitalize
    end

    def show_items_by_category(category)
      filtered_items = @items.select { |item| item.category == category }
      filtered_items.map(&:to_s).join("\n")
    end
  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.include(InstanceMethods)
  end
end