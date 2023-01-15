#!/usr/bin/env bash

_gcd_completion() {
  COMPREPLY=()

  # complete owners
  if [ $COMP_CWORD -eq 1 ]; then
    p1="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(complete-gh-owners "${p1}"))
    return 0
  fi

  # complete repositories
  if [ $COMP_CWORD -eq 2 ]; then
    p1="${COMP_WORDS[COMP_CWORD - 1]}"
    p2="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(complete-gh-repos "${p1}" "${p2}"))
    return 0
  fi

  return 0
}

alias "gcd=source github-cd"

complete -F _gcd_completion "gcd"
