# Adobe Experience Manager Mobile SDK for Ruby

[![Dependency Status](https://gemnasium.com/wavetronix/aemmobile-sdk-ruby.svg)](https://gemnasium.com/wavetronix/aemmobile-sdk-ruby) [![Code Climate](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby) [![Test Coverage](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby/badges/coverage.svg)](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby/coverage) [![Issue Count](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby/badges/issue_count.svg)](https://codeclimate.com/github/wavetronix/aemmobile-sdk-ruby) [![Build Status](https://travis-ci.org/wavetronix/aemmobile-sdk-ruby.svg?branch=master)](https://travis-ci.org/wavetronix/aemmobile-sdk-ruby)

Use this SDK to interface with the Adobe Experience Manager Mobile (AEM Mobile) Content Producer Service APIs from your Ruby app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aemmobile-sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aemmobile-sdk

## Prerequisites

### API Key

To access the Content Producer Service API you need to request an API key. To request the API key, complete the PDF form that is part of the [Content Producer Service API .zip file][api-zip]. Send the completed form to Adobe Developer Support: [wwds@adobe.com](mailto:wwds@adobe.com).

[api-zip]: https://helpx.adobe.com/content/help/en/digital-publishing-solution/help/integrating-dps/_jcr_content/main-pars/download_1/file.res/20160222-Adobe%20Experience%20Manager%20Mobile%20Content%20Producer%20Service%20API.zip "20160222-Adobe Experience Manager Mobile Content Producer Service API.zip"

### Generate the `device_id` and `device_token`

Once you receive your API key, generate the device_id and device_token. Go to https://aex.aemmobile.adobe.com and do the following:

- Provide the API key
- Sign in with an AdobeID that you requested to whitelist (on the request form)

If all conditions are met, a device_id and device_token will be generated.

## Configuration

Once you have all the necessary information, you can configure the gem to communicate with the API:

``` ruby
ContentProducerService.configure do |config|
  config.client_id     = 'your-client-id'
  config.client_secret = 'your-client-secret'
  config.device_id     = 'your-device-id'
  config.device_token  = 'your device-token'
end
```

It is highly recommended that you not include your API key and other credentials directly in your source code, but use `ENV` variables, instead—especially in a production environment.

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Resources

- [Adobe Experience Manager Mobile Help](https://helpx.adobe.com/digital-publishing-solution/topics.html)
- [AEM Mobile Content Producer Service API documentation](http://wavetronix.github.io/aemmobile-sdk-ruby/api-docs)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wavetronix/aemmobile-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
