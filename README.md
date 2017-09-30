[![Gem Version](https://badge.fury.io/rb/gvive.svg)](https://badge.fury.io/rb/gvive) [![Code Climate](https://codeclimate.com/github/nukturnal/gvive/badges/gpa.svg)](https://codeclimate.com/github/nukturnal/gvive) [![Build Status](https://travis-ci.org/nukturnal/gvive.svg?branch=master)](https://travis-ci.org/nukturnal/gvive) [![Test Coverage](https://codeclimate.com/github/nukturnal/gvive/badges/coverage.svg)](https://codeclimate.com/github/nukturnal/gvive/coverage) [![Issue Count](https://codeclimate.com/github/nukturnal/gvive/badges/issue_count.svg)](https://codeclimate.com/github/nukturnal/gvive) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/7425ac54e6484723a5482a92fc7f35ef)](https://www.codacy.com/app/nukturnal/gvive?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nukturnal/gvive&amp;utm_campaign=Badge_Grade) [![codebeat badge](https://codebeat.co/badges/33b4fac4-6c7b-4176-95e0-f6fd56f74d59)](https://codebeat.co/projects/github-com-nukturnal-gvive-master)

# GVIVE Ruby SDK

This gem is a wrapper around GVIVE Identity Verification API offered at https://gvivegh.com/ by Bsystems Limited Ghana. The SDK currently supports Voter ID, Passport & Driver License verifications.

This gem was extracted from a private project I was working on for reuse in other projects, hope it saves u some code time :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gvive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gvive

## Usage

### Environment Variables
You can simply set `GVIVE_API_KEY` & `GVIVE_USERNAME` environment variables and gem should work flawlessly. You may check your OS documentations on how to set environment variables.

On Mac OS X & Linux Systems you can set these variables in your `~/.profile`

```sh
export GVIVE_API_KEY=some_api_key
export GVIVE_USERNAME=some_username
```

### Initializer Setup (Optional)
If you do not prefer or want to override the environment variable option you can simply initialize a config setting. If you using Rails you can put this in your `initializers` directory eg `initializers/gvive.rb`

```ruby
GVIVE.configure do |config|
  config.api_key = 'some_api_key' # Provided by GVIVE
  config.username = 'some_username' # Provided by GVIVE
end
```

### Voter ID Verification
You are required to provide the Voter ID number

```ruby
voter = GVIVE::Identity::Voter.new('6580676543')
if voter.valid?
   p voter.data.fullname
   p voter.data.polling_station
   p voter.data.residential_address
  # ...
 else
   p voter.data.message
 end
```

### Passport ID Verification
You are required to provide the Passport ID number

```ruby
passport = GVIVE::Identity::Passport.new('G00827283')
if passport.valid?
   p passport.data.first_name
   p passport.data.last_name
   p passport.data.gender
   p passport.data.expiry_date
   # ...
 else
   p passport.data.message
 end
```

### Driver License Verification
You are required to provide the Certificate of Competence Number & the full name as printed exactly on the card.

```ruby
driver = GVIVE::Identity::Driver.new('COO92930','Alfred Rowe')
if driver.valid?
   p driver.data.first_name
   p driver.data.last_name
   p driver.data.class_of_licence
   p driver.data.date_of_issue
   # ...
 else
   p driver.data.message
 end
```

## Testing
In order to protect valid identity information, all valid IDs have been moved to environment variables. You will need to set them up before tests can pass for valid ID specs.

```sh
export GVIVE_VALID_VID=VOTER_ID_NUMBER
export GVIVE_VALID_PID=PASSPORT_ID_NUMBER
export GVIVE_VALID_DCOC=DRIVER_CERTIFICATE_OF_COMPETENCE_NUMBER
export GVIVE_VALID_DNAME=⁠⁠⁠⁠⁠"Full name as printed exactly on ID card"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gvive. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gvive project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nukturnal/gvive/blob/master/CODE_OF_CONDUCT.md).
