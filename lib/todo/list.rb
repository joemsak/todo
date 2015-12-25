module Todo
  class List
    attr_reader :items

    def initialize
      @items = []
    end

    def add_item(text)
      item = Item.new(text)
      @items << item
      item
    end

    def todo
      @items.reject(&:completed?)
    end

    def completed
      @items.select(&:completed?)
    end
  end

  class Item < Struct.new(:text)
    def completed?
      @completed ||= false
    end

    def complete!
      @completed = true
    end
  end
end
