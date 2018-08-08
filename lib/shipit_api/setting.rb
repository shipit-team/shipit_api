module ShipitAPI
  class Setting

    def self.info(opts = {})
    end

    def self.save(opts = {})
      new(opts).save
    end

    def initialize(opts = {})
      @opts = opts
      @api_call = ShipitAPI::Session.connection(self.class.name)
    end

    def info
      response = @api_call.get('', @opts)
      JSON.parse(response.body, symbolize_names: true)
    end

    def save(opts = {})
      set_hash!
      @opts = @opts.empty? ? StandarError : @opts
    end

    private

    attr_accessor :data

    def set_hash!
      response = info
      data = response["configuration"]["pp"]["packages_webhook_url"] =
      binding.pry
    end
  end
end
