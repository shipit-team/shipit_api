module ShipitAPI
  class Package
    def self.all(opts = {})
      new(opts).all
    end

    def self.create(opts = {})
      new(opts).save
    end

    def self.find(opts = {})
      new().find(opts)
    end

    def self.latest
      new().latest
    end

    def initialize(opts = {})
      @opts = opts
      @api_call = ShipitAPI::Session.connection(self.class.name)
      build!
    end

    def attrs
      { reference: "", full_name: "", email: "", items_count: 1, cellphone: "", is_payable: false, packing: "Sin Empaque",
        shipping_type: "Normal", destiny: "Domicilio", courier_for_client: nil, address_attributes: address_attrs, with_purchase_insurance: false, purchase: purchase_attrs,
        inventory_activity: fulfillment_attrs }
    end

    def address_attrs
      { commune_id: nil, street: "", number: "", complement: "" }
    end

    def purchase_attrs
      { detail: "Ropa", ticket_number: 11111111, amount: 0, extra_insurance: false }
    end

    def fulfillment_attrs
      { inventory_activity_orders_attributes: [] }
    end

    def sku_attrs
      { sku_id: nil, amount: 1 }
    end

    def build!
      @opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end

    def all
      @opts = @opts.empty? ? { year: Time.now.year, month: Time.now.month } : @opts
      response = @api_call.get('', @opts)
      JSON.parse(response.body)
    end

    def find(opts = opts)
      opts = opts.empty? ? StandardError : opts
      response = @api_call.get("#{opts[:id]}")
      JSON.parse(response.body)
    end

    def save
      @opts = @opts.empty? ? StandardError : @opts
      response = @api_call.post('',@opts.to_json)
      JSON.parse(response.body)
    end

    def destroy
    end

    def latest
      @opts = @opts.empty? ? { year: Time.now.year, month: Time.now.month } : @opts
      response = @api_call.get('', @opts)
      JSON.parse(response.body).last
    end
  end
end
