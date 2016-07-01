# SHASHI (SHApe SHIfter)

Made with <3 by [@olistik](https://olisti.co)

## License

GNU General Public License (GPL) version 3

- [gnu.org](https://www.gnu.org/licenses/gpl-3.0.txt)
- [repository copy](gpl-3.0.txt)

## Usage

```bash
shashi
  --file "FILE" # defaults to ./shashi__db.json
  --path "List<PATH>[separator:.]" # applies a partial matching but raise an error in case of more than one match
    --group "NAME" # defaults to `default`
    --create-group "NAME"
    --delete-group "NAME" # asks for confirmation if the group is not empty
      --force # doesn't ask for confirmation if the group is not empty

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

