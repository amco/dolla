# Dolla

Dolla is a payment gateway module developed by AMCO.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dolla'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dolla

## Usage

After install, run `rake dolla:install` command to create an initializer file, adding the config variables to modify in your application `config/initializers/dolla.rb`:

```ruby
Dolla.configure do |config|
  config.business_unit = 'BUSINESS_UNIT'
  config.payment_gateway_code = 'PAYMENT_GATEWAY_CODE'
  config.cancel_gateway_code = 'CANCEL_GATEWAY_CODE'
  config.currency = 'CURRENCY'
  config.client_id = 'CLIENT_ID'
  config.admin_email = 'ADMIN_EMAIL'
  config.transaction_type = 'TRANSACTION_TYPE'
  config.platform = 'PLATFORM'
  config.payment = 'PAYMENT'
  config.cancellation = 'CANCELLATION'
  config.rijndael_key = 'RIJNDAEL_KEY'
  config.hmac_key = 'HMAC_KEY'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amco/dolla. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dolla project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dolla/blob/master/CODE_OF_CONDUCT.md).
