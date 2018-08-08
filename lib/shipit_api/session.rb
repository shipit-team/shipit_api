module ShipitAPI
  class Session
    def self.connection(name, version=2)
      name = name.split("::").last.pluralize.downcase
      endpoint = "#{Config.settings.base_url}#{name}"
      connection = Faraday.new(endpoint)
      connection.headers = Config.settings(version).headers
      connection
    end
  end
end
