# Flaggable
A Rails engine for automatically flagging profane content so that it can be reviewed by a human.

The profane word list is based on [facebook's list of profane words](https://www.freewebheaders.com/bad-words-list-and-page-moderation-words-list-for-facebook/).

## Usage
1. Install the gem
2. Install and run the migrations
3. Add `include Flaggable::ActsAsFlaggable` to any model that you want to track

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'flaggable'
```

And then execute:
```bash
$ bundle
```

And the install the migrations:
```bash
$ rails flaggable:install:migrations
```

And run migrations:
```bash
$ rails db:migrate
```

## Contributing
There is plenty of opportunity to build on this:
- Mountable controllers for reviewing content
- Increase the number of things that it checks for
- Extend the checking behavior to an optional background job
- Reports, Alerts, and Slack Notifications

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
