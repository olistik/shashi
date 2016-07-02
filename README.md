# SHASHI (SHApe SHIfter)

Store and fetch data from a JSON file using the command line.

Made with <3 by [@olistik](https://olisti.co)

## License

GNU General Public License (GPL) version 3

- [gnu.org](https://www.gnu.org/licenses/gpl-3.0.txt)
- [repository copy](gpl-3.0.txt)

## Installation

```shell
gem install shashi
```

## Usage

```bash
shashi
  --file "FILE" # defaults to ./shashi__db.json
  --path "List<PATH>[separator:.]" # applies a partial matching but raise an error in case of more than one match
    # --group "NAME" # defaults to `default`
    # --create-group "NAME"
    # --delete-group "NAME" # asks for confirmation if the group is not empty
    #   --force # doesn't ask for confirmation if the group is not empty

    --create-set "NAME"
    --set "KEY:VALUE"
    --set "KEY" # prompt for value
    --secure-set "KEY" # prompt for value but doesn't echo the entered value
    --show "List<KEY>[separator:,]" # shows the values associated with keys but not the content of sets/lists
      --deep # shows the values associated with keys AND the content of sets/lists
    --delete-set "NAME" # asks for confirmation if the set is not empty
      --force # doesn't ask for confirmation if the set is not empty


    --create-list "NAME"
    --index "INDEX" # default the size of the queue
    --push "List<VALUE>[separator:,]"
    --secure-push # prompts for values but doesn't echo the entered values
    --delete # asks for confirmation
      --force # doesn't ask for confirmation
```

## TODO

1. Persist and modify default values

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olistik/shashi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
