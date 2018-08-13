Shipit API :dolphin:
===========

The Shipit API gem allows Ruby developers to access to admin information of Shipit client account.

The API is implemented as JSON over HTTP using all four verbs (GET/POST/PUT/DELETE(. Each resource like Package, SKU or Quotation has
its own URL and is manipulated in isolation. In other words, we've tried to make the API follow the REST principles as much as possible.

## Usage
### Requirements

* Create an account into https://shipit.cl
* Sign in into https://clientes.shipit.cl/accounts/sign_in
* Get the email and token from section: Inicio -> API

### Sandbox

By default sandbox is false. If you need to active sandbox contact us. (integraciones@shipit.cl)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shipit_api', '~> 0.1.1'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shipit_api

After that create a file with name `shipit.rb` inside `initializer` directory with the next code:

```ruby
 ShipitAPI::Config.setup do |config|
    config.x_shipit_email = 'YOUR_ACCOUNT_EMAIL'
    config.x_shipit_token = 'YOUR_ACCESS_TOKEN'
 end
```

Well done, You can use `ShipitAPI` in your application :D

## Getting Started

ShipitAPI gem has the next methods to use API's Shipit:

1. Commune: Get communes by: all, id or name
2. Quotation: Get prices from our calculator
3. Setting: Get your current settings
4. Package: Create and get packages into your account.
5. SKU (Only fulfillment accounts!): Get your skus



### 1. Commune
In this class you can use the next methods:

a. `all` method
Return all communes from API
```ruby
ShipitAPI::Commune.all

# Response
# [{"id"=>46, "region_id"=>6, "name"=>"CASABLANCA", "code"=>"05102", "is_starken"=>nil, "is_chilexpress"=>nil, "is_generic"=>true, "is_reachable"=>true, "created_at"=>"2016-12-16T03:12:23.714-03:00", "updated_at"=>"2018-07-03T11:10:24.674-04:00", "couriers_availables"=>{"dhl"=>"CASABLANCA", "starken"=>"CASABLANCA", "chilexpress"=>"CASABLANCA", "correoschile"=>"CASABLANCA"}, "is_available"=>false}, {"id"=>4, "region_id"=>1, "name"=>"GENERAL LAGOS", "code"=>"15202", "is_starken"=>nil, "is_chilexpress"=>nil, "is_generic"=>true, "is_reachable"=>true, "created_at"=>"2016-12-16T03:12:23.398-03:00", "updated_at"=>"2018-05-04T12:31:14.176-03:00", "couriers_availables"=>{"dhl"=>"", "starken"=>"GENERAL LAGOS", "chilexpress"=>"", "correoschile"=>""}, "is_available"=>false},...]

```
b. `find` method
Return commune by `commune ID`

```ruby
ShipitAPI::Commune.find({ id: 12 })

# Response
# {:id=>12, :region_id=>3, :name=>"ANTOFAGASTA", :code=>"02101", :is_starken=>nil, :is_chilexpress=>nil, :is_generic=>true, :is_reachable=>true, :created_at=>"2016-12-16T03:12:23.458-03:00", :updated_at=>"2018-07-05T21:35:21.128-04:00", :couriers_availables=>{:dhl=>"", :starken=>"ANTOFAGASTA", :chilexpress=>"ANTOFAGASTA", :correoschile=>"ANTOFAGASTA"}, :is_available=>false}
```

c. `find_by_name` method
Return commune by `commune name`

```ruby
ShipitAPI::Commune.find_by_name({ name: 'LAS CONDES' })

# Response
# {:id=>308, :region_id=>7, :name=>"LAS CONDES", :code=>"13114", :is_starken=>nil, :is_chilexpress=>nil, :is_generic=>true, :is_reachable=>true, :created_at=>"2016-12-16T03:12:25.619-03:00", :updated_at=>"2018-07-03T11:10:28.388-04:00", :couriers_availables=>{:dhl=>"LAS CONDES", :starken=>"LAS CONDES", :chilexpress=>"LAS CONDES", :correoschile=>"LAS CONDES"}, :is_available=>true}
```

### 2. Quotation
In this class you can use the next methods:

a. `get_prices` method

Return a hash of prices for your package. It is necessary to specify `width`, `height`, `length`, `weight` and `commune_name` to calculate price.

```ruby
package = { width: 10, height: 10, length: 10, weight: 0.5, commune_name: 'LAS CONDES' }
ShipitAPI::Quotation.get_prices(package)

# Response
# {:prices=>[{:courier=>{:name=>"correos_de_chile", :packet_from=>"LAS CONDES", :packet_to=>"LAS CONDES"}, :name=>"Domicilio", :price=>2660, :cost=>2660, :days=>1, :available_to_shipping=>false, :original_courier=>"correos_de_chile", :volumetric_weight=>0.5, :is_payable=>false}, {:courier=>{:name=>"chilexpress", :packet_from=>"LAS CONDES", :packet_to=>"LAS CONDES"}, :name=>"DIA HABIL SIGUIENTE", :price=>3410, :cost=>2046, :days=>1, :available_to_shipping=>true, :original_courier=>"chilexpress", :volumetric_weight=>0.5, :is_payable=>false}, {:courier=>{:name=>"starken", :packet_from=>"LAS CONDES", :packet_to=>"LAS CONDES"}, :name=>"DOMICILIO", :price=>3720, :cost=>2992, :days=>1, :available_to_shipping=>true, :original_courier=>"starken", :volumetric_weight=>0.5, :is_payable=>false}], :lower_price=>{:courier=>{:name=>"chilexpress", :packet_from=>"LAS CONDES", :packet_to=>"LAS CONDES"}, :name=>"Domicilio", :price=>2660, :cost=>2046, :days=>1, :available_to_shipping=>true, :original_courier=>"correos_de_chile", :volumetric_weight=>0.5}, :higesth_price=>{:courier=>{:name=>"starken", :packet_from=>"LAS CONDES", :packet_to=>"LAS CONDES"}, :name=>"DOMICILIO", :price=>3720, :cost=>2992, :days=>1, :available_to_shipping=>true, :original_courier=>"starken", :volumetric_weight=>0.5, :is_payable=>false}}
```

Shipit by default use `:lower_price` to send packages :fire:

### 3. Setting
In this class you can use the next methods:

a. `info` method

Return your current setting information

```ruby
ShipitAPI::Setting.info

# Response
#  {:id=>99999999, :email_alert=>nil, :email_notification=>nil, :service_id=>3, :company_id=>999999, :is_default_price=>true, :default_courier=>"cxp", :created_at=>"2018-04-20T10:03:25.142-03:00", :updated_at=>"2018-04-20T10:03:25.142-03:00", :configuration=>{:pp=>{:key=>"", :secret_key=>"", :price=>"", :sandbox=>true}}}
```

### 4. Package
In this class you can use the next methods:

a. `find` method
Return package by `Package ID`
```ruby
ShipitAPI::Package.find({ id: 19823773})

# Response
# [{:id=>19823773, :reference=>"test-19ci2", :full_name=>"Nelson Jimenez", :email=>"nelson@shipit.cl", :items_count=>1, :cellphone=>"+569905021", :is_payable=>false, :packing=>"Sin Empaque", :shipping_type=>"Normal", :destiny=>"Domicilio", :courier_for_client=>"chilexpress", :tracking_number=>"99716543522", :approx_size=>nil, :status=>"in_preparation", :courier_status=>"Pieza en poder del remitente", :length=>10.0, :width=>10.0, :height=>10.0, :weight=>1.0,...]
```

b. `all` method
Return all your packages
```ruby
ShipitAPI::Package.all

# Response
# [{:id=>19823773, :reference=>"test-19ci2", :full_name=>"Nelson Jimenez", :email=>"nelson@shipit.cl", :items_count=>1, :cellphone=>"+569905021", :is_payable=>false, :packing=>"Sin Empaque", :shipping_type=>"Normal", :destiny=>"Domicilio", :courier_for_client=>"chilexpress", :tracking_number=>"99716543522", :approx_size=>nil, :status=>"in_preparation", :courier_status=>"Pieza en poder del remitente", :length=>10.0, :width=>10.0, :height=>10.0, :weight=>1.0,...]
```

c. `latest` method
Return latest package created.
```ruby
ShipitAPI::Package.latest

# Response
# {:id=>12389723, :reference=>"test-1prcf", :full_name=>"Nelson Jimenez", :email=>"nelson@shipit.cl", :items_count=>1, :cellphone=>"+569905021", :is_payable=>false, :packing=>"Sin Empaque", :shipping_type=>"Normal", :destiny=>"Domicilio", ...}
```

d. `save` method
Create a new package in your account
```ruby
    array_hash = [{
      reference: "test-1#{rand(36**4).to_s(36)}",
      full_name: "Nelson Jimenez",
      email: "nelson@shipit.cl",
      items_count: 1,
      cellphone: "+569905021",
      is_payable: false,
      packing: "Sin Empaque",
      shipping_type: "Normal",
      destiny: "Domicilio",
      courier_for_client: nil,
      address_attributes: {
        commune_id: 308,
        street: "Nuestra señora de los angeles",
        number: "185",
        complement: "Oficina E"
      },
      with_purchase_insurance: false
    }]

    package = ShipitAPI::Package.new(array_hash)
    @package = package.save
```

### 5. Sku
In this class you can use the next methods:
a. `find` method
b. `all` method


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shipit-team/shipit_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ShipitApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/patojimenez/shipit_api/blob/master/CODE_OF_CONDUCT.md).
