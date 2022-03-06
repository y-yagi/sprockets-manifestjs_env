# Sprockets::ManifestjsEnv

[![Build Status](https://github.com/y-yagi/sprockets-manifestjs_env/actions/workflows/main.yml/badge.svg)](https://github.com/y-yagi/sprockets-manifestjs_env/actions)

Allow to switch `manifest.js` of `Sprockets` per environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sprockets-manifestjs_env'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sprockets-manifestjs_env

## Usage

If your application have a `app/assets/config/manifest_#{::Rails.env}.js`,  this gem switch to use it instead of `app/assets/config/manifest.js`.

So if want to use customized `manifest.js` for test, please create a `app/assets/config/manifest_test.js`.

For example: https://github.com/y-yagi/sprockets-manifestjs_env/blob/main/test/dummy/app/assets/config/manifest_test.js

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y-yagi/sprockets-manifestjs_env.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
