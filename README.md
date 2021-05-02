# pdf-rendering-srv-ruby

[![Gem Version](https://badge.fury.io/rb/pdf-rendering-srv-ruby.svg)](https://badge.fury.io/rb/pdf-rendering-srv-ruby)
![Ruby](https://github.com/tomasc/pdf-rendering-srv-ruby/workflows/Ruby/badge.svg)

Simple Ruby wrapper for seding requests to [pdf-rendering-srv](https://github.com/restorecommerce/pdf-rendering-srv)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf-rendering-srv-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf-rendering-srv-ruby

## Usage

Configure the gem by specifying URL of the [pdf-rendering-srv](https://github.com/restorecommerce/pdf-rendering-srv) service:

```ruby
PdfRenderingSrv.configure do |config|
  config.pdf_rendering_srv_url = "http://localhost:9000/api/render" # default value
end
```

```ruby
PdfRenderingSrv::FromUrl.call(url: "https://example.com", format: :png, viewport: { width: 800 })
```

```ruby
PdfRenderingSrv::FromHtml.call(html: "<html><head><title>Example</title></head><body>", format: :pdf, pdf: { format: "A4" })
```

The general interface is described in the [Base](/pdf-rendering-srv/base.rb) class.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/pdf-rendering-srv-ruby.
