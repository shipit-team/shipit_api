module ShipitAPI
  class Package
    def self.all(opts = {})
      new(opts).all
    end

    def self.latest
      new().latest
    end

    def initialize(opts = {})
      @opts = opts
      @api_call = ShipitAPI::Session.connection(self.class.name)
    end

    def all
      @opts = @opts.empty? ? { year: Time.now.year, month: Time.now.month } : @opts
      response = @api_call.get('', @opts)
      JSON.parse(response.body)
    end

    def latest
      @opts = @opts.empty? ? { year: Time.now.year, month: Time.now.month } : @opts
      response = @api_call.get('', @opts)
      JSON.parse(response.body).last
    end
  end
end
