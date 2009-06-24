require File.dirname(__FILE__) + '/spec_helper'

describe BooBox::Base do
  before do
    @boo = BooBox::Base.new
    @boo.aff = 'submarinoid'
    @boo.uid = 173091
    @boo.tags = ['ruby on rails']
  end

  it 'should initialize with empty arguments' do
    @boo.should_not be_nil 
    @boo.endpoint.should == 'http://boo-box.com/api'
    @boo.format.should == :json
  end

  it 'should generate correct uri' do
    @boo.uri.should == "http://boo-box.com/api/format:json/aff:submarinoid/uid:173091/tags:ruby+on+rails/limit:6"
  end

  it 'should return a list of products' do
    products = @boo.products
    products.should be_kind_of(Array)
    products.length.should be_between(0, 7) 
    products.each do |product|
      product.should be_kind_of(BooBox::Product)
    end
  end

  it 'should throw an error on invalid affiliate id' do
    @boo.aff = 'foobar'
    lambda{ @boo.products }.should raise_error(RuntimeError)
  end
end
