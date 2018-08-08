module ShipitAPI
  class Sku
    def self.find(opts = {})
      new().find(opts)
    end

    def self.all(opts = {})
      new(opts).all
    end

    def initialize(opts = {})
      @opts = opts
      @api_call = ShipitAPI::Session.connection(self.class.name)
    end

    def all
      response = @api_call.get('', @opts)
      JSON.parse(response.body)
    end

    def find(opts = {})
      opts = opts.empty? ? StandardError : opts
      response = @api_call.get("#{opts[:id]}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
