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

  --file "FILE" # Uses FILE as the desired file path for the storage. Defaults to `./shashi__db.json`.
  --setup # Creates the storage file with an empty set.
  --path "PATH" # `PATH := List<KEY>[separator:.]`. Address the document's item by chaining a list of keys. For example: `key1.key2.key3`.

  # Common options

  --no-echo # When prompted for a value, doesn't show it while typing.
  --force # Doesn't ask for confirmation.

  # Set commands

  --create-set "NAME" # Creates an empty set. Asks for confirmation if the key NAME already exists.
  --set "KEY:VALUE" # Sets the KEY to VALUE. Asks for confirmation if the key NAME already exists.
  --set "KEY" # Prompts for a value and sets KEY accordingly. Asks for confirmation if the key NAME already exists.
  --show "KEYS" # `KEYS := List<KEY>[separator:,]`. Shows the values associated with keys but not the content of sets/lists. For example: `name,e-mail`.
    --deep # Shows the values associated with KEYS (recursively) even if they contain sets or lists.
  --delete "KEY" # Deletes the item. Asks for confirmation if it's a non-empty set or list.

  # List commands

  --create-list "NAME" # Creates an empty list. Asks for confirmation if the key NAME already exists.
  --index "INDEX" # `INDEX := (Integer >= 0)`. References the n-th element of a list. Defaults to the size of the list (ie: the last element).
    --list-push "VALUES" # `VALUES := List<VALUE>[separator:,]`. Push VALUES into a list.
    --list-show # Shows the n-th element of a list.
    --list-delete # Deletes the n-th element of a list.
```

## TODO

- [X] Implement `--delete`.
- [X] Implement `--create-list`.
- [ ] Implement `--list-push` with `--index`.
- [ ] Implement `--list-show` with `--index`.
- [ ] Implement `--list-delete` with `--index`.
- [ ] Persist and modify default values.
- [ ] Apply a partial matching when specifying `--path` and raise an error in case of more than one match.
- [ ] Allow the nesting of sets within lists (this should require an update in the way we handle the item's PATH).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olistik/shashi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
