# Install

- Download this repository
- Add `$REPOSITORY_PATH/bin` to your path
- Add `source "$REPOSITORY_PATH/completion.sh"` to your shell startup file

## Usage

CLI commands;

- `git defaults` - Check out & pull the default branch of the local repository
- `gcd <org> <repo>` - Change directory to that of a GitHub repository, clone if necessary

Note that `gcd` is an alias for `source github-cd` to allow changing directory

## Autocompletion

This project contains the autocompletion for the `gcd` command;

- `gcd <prefix><TAB>` - List all GitHub organizations the local GitHub CLI user is member of.
- `gcd <org> <query><TAB>` - List all matching repositories in a GitHub organization. Use`+` to combine multiple queries.
