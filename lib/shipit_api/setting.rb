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
      @opts = opts.empty? ? @opts : opts
      set_hash!
    end

    private

    attr_accessor :data

    def set_hash!
      response[:configuration][:pp][:packages_webhook_url] = @opts[:packages_webhook_url]

    end
  end
end
