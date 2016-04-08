# Itamae::Plugin::Recipe::RtnGit

[![wercker status](https://app.wercker.com/status/bf1e43ebb1d530cebc4f5f04806612de/s "wercker status")](https://app.wercker.com/project/bykey/bf1e43ebb1d530cebc4f5f04806612de)

[Itamae](https://github.com/itamae-kitchen/itamae) recipe plugin for git (from source).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-rtn_git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-rtn_git

## Usage

### Add your recipe or role
```ruby
include_recipe 'rtn_git::system'
```

### node.json
```json
{
  "rtn_git": {
    "version": "2.3.0"
  }
}
```

## Contributing

1. Fork it ( https://github.com/rutan/itamae-plugin-recipe-rtn_git/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
