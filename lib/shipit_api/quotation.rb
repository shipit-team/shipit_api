module ShipitAPI
  class Quotation
    def self.get_prices(opts = {})
      new(opts).get_prices
    end

    def initialize(opts = {})
      @opts = opts
      @api_call = ShipitAPI::Session.connection('prices', 3)
      build!
    end

    def get_prices
      package = { package: @opts }
      binding.pry
      response = @api_call.post('', package.to_json)
      JSON.parse(response.body, symbolize_names: true)
    end

    def quotaiton_attrs
      { width: 10, length: 10, height: 10, weight: 1, destinty: 'Domicilio' }
    end

    def build!
      @opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
