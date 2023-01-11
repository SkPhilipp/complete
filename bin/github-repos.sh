#!/usr/bin/env bash
#
# Outputs a list of GitHub repository full_name-s within organizations of which the current GitHub CLI user is a member,
# where both organization and repository can be optionally filtered by name.
#
# $1  : (Optional) GitHub organization name prefix.
# $2+ : (Optional) GitHub repository name query strings.
#                  Note that plus can be used to specify multiple query strings in a single argument.
#
# Example:
#   $ bin/github-repos.sh S example
#   SomeDummyOrganization/action-example
#   SomeDummyOrganization/other-examples
#
#   $ bin/github-repos.sh S example action
#   SomeDummyOrganization/action-example
#
#   $ bin/github-repos.sh S example+action
#   SomeDummyOrganization/action-example
#

set -e -u -o pipefail

organization_prefix_pattern=$1
shift
query=''
for part in $@; do
  # url encode, except for plus
  part_encoded=$(echo "$part" | jq --raw-input --raw-output @uri | sed 's/%2B/+/g')
  query="+$part_encoded$query"
done
unset IFS

organizations=$(github-orgs.sh "$organization_prefix_pattern")
for organization in $organizations; do
  gh api --jq '.items[].full_name' "/search/repositories?type=repositories&q=org:$organization$query"
done
