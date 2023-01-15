# Install

- Download this repository
- Add `$REPOSITORY_PATH/bin` to your path
- Add `source "$REPOSITORY_PATH/completion.sh"` to your shell startup file

## Usage

CLI commands;

- `git defaults` - Check out & pull the default branch of the local repository
- `gcd <owner> <repo>` - Change directory to that of a GitHub repository, clone if necessary

Note that `gcd` is an alias for `source github-cd` to allow changing directory

## Autocompletion

This project contains the autocompletion for the `gcd` command;

- `gcd <prefix><TAB>` - List of both the user and all GitHub organizations the local user is a member of.
- `gcd <owner> <query><TAB>` - List all matching repositories for a GitHub repository owner. Use`+` to combine multiple queries.
