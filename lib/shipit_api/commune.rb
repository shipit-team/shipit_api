module ShipitAPI
  class Commune
    def self.find(opts = {})
      new().find(opts)
    end

    def self.all(opts = {})
      new(opts).all
    end

    def self.find_by_name(opts = {})
      new().find_by_name(opts)
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

    def find_by_name(opts = {})
      opts = opts.empty? ? StandarError : opts
      commune = URI.encode(opts[:name])
      response = @api_call.get("by_name/#{commune}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
