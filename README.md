# Ror
#### Finally a gem that add zero value for your project! Read on to find out how.

A CLI tool that displays required and optional parameters for rails methods. This is not a replacement for actual Rails documentation, but rather to make it more convenient a for quick look up of method syntax & parameters along with some general/important info, and a link to the Rails method documentation!

You may be wondering how this is possible? Well after many white papers and proof of concepts along with thousands of scientists all over the world verifying the work not done here we can say with 100% confidence that you should absolutely not depend on the information expelled here and that the links are included so that PR's can be created stating how wrong we are.

Why is this needed? If your a full-time rails developer you may not need this, but individuals who develop as a hobby or newcomers to the language might find this CLI fast and easy to use so that they can get on coding and spend less time navigating a browser! or [dash](https://kapeli.com/dash) or [devdocs](https://devdocs.io/) which are great tools! and come highly recommended.

Currently the ror CLI contains very few methods as method information is not pulled from any online resource since it is 100% manual entry. It is this way for one main reason, and that is so that any individual who wishes to contribute (including yours truly) can learn about rails methods while contributing to a gem.

I feel the most can be gained when the user tries to recall the syntax/parameters for a method, before using this tool. The more that is done the sooner the brain will believe the information is important.

Please visit and dive deep into the [Rails guide and documentation](http://guides.rubyonrails.org/). If you find this useful and would like to contribute please see [Contributing](#contributing).

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'ror'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ror

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## <a name="contributing"></a>Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/NickSchimek/ror.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
