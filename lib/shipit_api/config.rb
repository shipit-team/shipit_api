module ShipitAPI
  class Config
    BASE_URL = 'https://api.shipit.cl/v/'.freeze
    EXTENSION = '.json'.freeze
    CONTENT_TYPE = 'application/json'.freeze
    ACCEPT = 'application/vnd.shipit.v'.freeze

    attr_accessor :x_shipit_email, :x_shipit_access_token, :content_type, :version,
                  :base_url, :accept, :headers

    def self.settings(version = 2)
      puts "VERSION: #{version}"
      @settings ||= Config.new(version)
      @settings.set_version!(version)
    end

    def self.setup(&block)
      yield(settings) if block_given?
    end

    def initialize(version)
      @extension = EXTENSION
      @content_type = CONTENT_TYPE
      @version = version
      @base_url = BASE_URL
      @accept = "#{ACCEPT}#{version}"
    end

    def set_version!(version)
      self.version = version
      self.accept = "#{ACCEPT}#{version}"
      self
    end

    def headers
      { 'X-Shipit-Email' => @x_shipit_email, 'X-Shipit-Access-Token' => @x_shipit_access_token, 'Content-Type' => @content_type, 'Accept' => @accept }
    end
  end
end
