# Garsh

Garsh is a ruby Google Analytics client to add events that you can track with goals. It aims to be simple and the easiest way to start tracking goals for your Ruby apps.

## WARNING ALPHA!

I just pushed this so I would have access to it everywhere. More development may go into it but it is pretty much feature complete for me at this point.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garsh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garsh

## Usage

You need to set the `GA_CODE` ENV variable which should be the google analytics code for the property you are tracking

```ruby
# set the env var
ENV['GA_CODE'] = "UA-123456789"
cli = Garsh.client

# or just explicitly add it
cli = Garsh.client(my_google_analytics_code)

# the client_id and category are optional
cli.create_event(action: "Test!", category: "Tests", client_id: "555")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pferdefleisch/garsh. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

