module BooBox
  class Product
    attr_reader :name, :image, :url

    def initialize item
      @name  = item['_name'].strip
      @image = item['img'].strip
      @url   = item['url'].strip
    end
  end
end
