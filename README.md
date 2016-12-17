# Analog Bridge

[![Build
Status](https://travis-ci.org/analogbridge/analog-bridge-ruby.svg?branch=master)](https://travis-ci.org/analogbridge/analog-bridge-ruby)

Analog Bridge is comprised of a JavaScript client and REST API which enables
your users to import analog media directly into your app or website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "analogbridge", github: "analogbridge/analog-bridge-ruby"
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install analogbridge
```

## Configure

Once you have your API Secret keys from Analog Bridge, then you can add an
initializer to set up your `secret_key` as

```ruby
AnalogBridge.configure do |config|
  config.secret_key = "YOUR_SECRET_KEY"
end
```

Or

```ruby
AnalogBridge.configuration.secret_key = "YOUR_SECRET_KEY"
```

## Usage

### Customer

#### Create Customer

To create a new customer using the API, usage

```ruby
AnalogBridge::Customer.create(
  email: "demo@analogbridge.io",
  shipping: {
    first_name: "John",
    last_name: "Smith",
    address1: "3336 Commercial Ave",
    city: "Northbrook",
    state: "IL",
    zip: "60062",
    phone: "800-557-3508",
    email: "demo@analogbridge.io"
  },
  metadata: {
    user_id: "123456",
  }
)
```

#### Retrieve a Customer

We can easily retrieve a customer details using their `customer_id`, for
example to find a customer with details with id `cus_12345678`

```ruby
AnalogBridge::Customer.find("cus_12345678")
```

### Retrieve all customers

Analog Bridge provides an interface to retrieve all your customers very easily,
to retrieve all of your customers, you can use

```ruby
AnalogBridge::Customer.list(limit: 20, offset: 100)
```

#### Update a customer

Update an existing customer's information by using the `cus_id` from customer
creation. Any unprovided parameters will have no effect on the customer object.
The arguments for this call are mainly the same as for the customer creation
call.

```ruby
AnalogBridge::Customer.update(
  "cus_123456789",
  email: "newemail@analogbridge.io"
)
```

#### Delete a customer

If we need to delete a customer for some reason, then the API got us covered,
for example if we want to delete a customer with id `cus_123456789` then we can
use

```ruby
AnalogBridge::Customer.delete("cus_123456789")
```

### Order

#### List all orders

The Analog Bridge API allow us to retrieve all orders by specific `customer`.
For example we want to retrieve all the `order` by a customer id `cus_12345678`
then we can use

```ruby
AnalogBridge::Order.where(customer_id: "cus_12345678")
```

#### List a order details

If we need to retrieve the details for a specific order then we can use

```ruby
AnalogBridge::Order.where(
  order_id: "order_12345678",
  customer_id: "cus_12345678"
)
```

### Listing Product

To retrieve the `products` simply use the following interface

```ruby
AnalogBridge::Product.all
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/analogbridge/analog-bridge-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
