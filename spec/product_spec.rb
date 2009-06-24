require File.dirname(__FILE__) + '/spec_helper'

describe BooBox::Product do
  before do
    @boo = BooBox::Base.new
    @boo.should_receive(:fetch_data).with().once.and_return(File.read(File.join(File.dirname(__FILE__),'../test/test.json')))
    @product = @boo.products[0]
  end

  it 'should have a valid name' do
      @product.name.should == "Livraria da Esquina, A"
  end

  it "should have a valid image" do
    @product.image.should == "http://i.s8.com.br/images/books/cover_tn/img4/pq1963064.jpg"
  end

  it "have a valid url" do
    @product.url.should == "http://boo-box.com/link/uri:www.submarino.com.br%2Fproduto%2F1%2F1963064%2Flivraria%2Bda%2Besquina%2C%2Ba%3Ffranq%3Dcompletelyincorrectandinvalidid?_view_offer_id=e12b383023b693f7e4646edec0d726cfddd8adb0&format=json&_view_id=7c1736f0c20688b4332ee7d46104346e51adffa3"
  end
end
