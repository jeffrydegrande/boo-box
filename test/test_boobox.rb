require File.dirname(__FILE__) + '/helper'

class TestBoobox < Test::Unit::TestCase
  context 'Boo-Box' do
    setup do
      @boo = BooBox::Base.new
      @boo.aff = 'submarinoid'
      @boo.uid = '173091'
      @boo.tags << "ruby on rails"

    end

    should "initialize with empty arguments" do
      assert !@boo.nil?
      assert_equal @boo.endpoint, 'http://boo-box.com/api'
      assert_equal @boo.format, :json
    end

    should "generate correct uri" do
      assert_equal @boo.uri, "http://boo-box.com/api/format:json/aff:submarinoid/uid:173091/tags:ruby+on+rails/limit:6"
    end

    should "return a list of products" do
      products = @boo.products
      assert products.is_a?(Array)
      assert products.length <= @boo.limit && products.length > 0
      products.each { |product| assert product.is_a?(BooBox::Product) }
    end

    should "throw an error on invalid affiliate id" do
      @boo.aff = 'foobar'
      assert_raises(RuntimeError) do
        @boo.products
      end
    end
  end
end
