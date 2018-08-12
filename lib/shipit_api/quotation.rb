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
      if !@opts[:commune_name].nil?
        commune = get_commune
        @opts.merge!({ to_commune_id: commune[:id]})
      end

      package = { package: @opts }
      response = @api_call.post('', package.to_json)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_commune
      ShipitAPI::Commune.find_by_name({ name: @opts[:commune_name] })
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
