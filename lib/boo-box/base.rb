module BooBox
  class InvalidAffiliate < StandardError; end
  class Base
    class << self
      def affiliate_program symbol
        ({
          :americanas   => "americanasid",
          :amazon       => "amazonid",
          :amazonuk     => "amazonukid",
          :amazonjp     => "amazonjpid",
          :amazonfr     => "amazonfrid",
          :amazonde     => "amazondeid",
          :buscape      => "buscapeid",
          :ebay         => "ebayid",
          :jacotei      => "jacoteiid",
          :mercadolivre => "mercadolivreid",
          :submarino    => "submarinoid"
        }[symbol.to_sym]) or raise InvalidAffiliate.new 
      end
    end

    attr_reader :endpoint, :format
    attr_accessor :uid, :affiliate, :tags, :limit

    def initialize
      @endpoint = 'http://boo-box.com/api'
      @format   = :json
      @limit    = 6
      @tags     = []
    end

    def affiliate=(affiliate)
      @affiliate = Base.affiliate_program affiliate
    end

    def uri
      "#{endpoint}/format:#{format.to_s}/aff:#{affiliate}/uid:#{uid}/tags:#{CGI.escape([tags].flatten.join(','))}/limit:#{limit}"
    end

    def products 
      @products ||= fetch_products 
    end

    protected
    def fetch_products
      body = fetch_data
      raise RunTimeError, "No data retrieved" if body.nil?
      body = body.gsub(/^jsonBooboxApi\(/,'').gsub(/\);$/, '')
      json = JSON.parse(body)
      json['item'].map { |item| Product.new item['_value'] }
    end

    def fetch_data
      begin
        response = (get_http uri)
        response.body
      rescue Net::HTTPFatalError => e 
        raise RuntimeError, "HTTP error occurred: #{e.to_s}"
      end
    end

    def get_http(url, max_retry = 10)
      parsed_url = URI.parse(url)
      response = Net::HTTP.get_response(parsed_url)
      case response
      when Net::HTTPSuccess then response
      when Net::HTTPRedirection then 
        redirect = response['location']
        if not redirect =~ /http(s?)\:\/\//
          redirect = 'http://'+parsed_url.host+redirect
        end
        get_http(redirect, max_retry - 1)
      else
        response.error!
      end
    end
  end
end
