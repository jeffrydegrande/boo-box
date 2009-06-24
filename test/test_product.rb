require File.dirname(__FILE__) + '/helper'

class TestProduct < Test::Unit::TestCase
  def read_json
    File.read(File.dirname(__FILE__) + '/test.json')
  end

  context 'A product' do
    setup do
      @boo = BooBox::Base.new
      stub(@boo).fetch_data do 
        read_json 
      end
      @product = @boo.products[0]
    end

    should "have a valid name" do
      assert @product.respond_to? :name
      assert_equal @product.name, "Livraria da Esquina, A"
    end

    should "have a valid image" do
      assert @product.respond_to? :image
      assert_equal @product.image, "http://i.s8.com.br/images/books/cover_tn/img4/pq1963064.jpk"
    end

    should "have a valid url" do
      assert @product.respond_to? :url
      assert_equal @product.url, "http://boo-box.com/link/uri:www.submarino.com.br%2Fproduto%2F1%2F1963064%2Flivraria%2Bda%2Besquina%2C%2Ba%3Ffranq%3Dcompletelyincorrectandinvalidid?_view_offer_id=e12b383023b693f7e4646edec0d726cfddd8adb0&format=json&_view_id=7c1736f0c20688b4332ee7d46104346e51adffa3"
    end
  end

end
