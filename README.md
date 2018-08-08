Shipit API
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
gem 'shipit_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shipit_api

## Getting Started

Shipit API uses




## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/patojimenez/shipit_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ShipitApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/patojimenez/shipit_api/blob/master/CODE_OF_CONDUCT.md).
