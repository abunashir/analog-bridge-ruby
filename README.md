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

## Usage

### Listing Product

To retrieve the `products` simply use the following interface

```ruby
Analog::Product.all
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/analogbridge/analog-bridge-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
