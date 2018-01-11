# Dolla

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dolla`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Finally add a file called `.env.development` in the root path with your credentials to use these like environment variables:
- BUSINESS_UNIT = _number_
- PAYMENT_GATEWAY_CODE = _number_
- CANCEL_GATEWAY_CODE = _number_
- CURRENCY              = _number_
- CLIENT_ID             = _number_
- ADMIN_EMAIL           = _string_
- TRANSACTION_TYPE      = _number_
- PLATFORM              = _number_
- PAYMENT               = _string_
- CANCELLATION          = _string_
- RIJNDAEL = _string_
- HMAC_KEY = _string_

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dolla. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dolla project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dolla/blob/master/CODE_OF_CONDUCT.md).
