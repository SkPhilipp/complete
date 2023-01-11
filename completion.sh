#!/usr/bin/env bash

_github_repos() {
  COMPREPLY=()

  # when completing the first argument, complete organizations
  if [ $COMP_CWORD -eq 1 ]; then
    current="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(github-repos "${current}"))
    return 0
  fi

  # when completing the second argument, complete repositories
  if [ $COMP_CWORD -eq 2 ]; then
    organization="${COMP_WORDS[COMP_CWORD - 1]}"
    current="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(github-repos "${organization}" "${current}"))
    return 0
  fi

  return 0
}

complete -F _github_repos "github-repos"
