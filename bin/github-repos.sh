#!/usr/bin/env bash
#
# Outputs a list of GitHub repository full_name-s within organizations of which the current GitHub CLI user is a member,
# where both organization and repository can be optionally filtered by name.
#
# $1  : (Optional) GitHub organization name prefix.
# $2+ : (Optional) GitHub repository name query strings.
#
# Example:
#   $ bin/github-repos.sh S example
#   SomeDummyOrganization/action-example
#   SomeDummyOrganization/other-examples
#
#   $ bin/github-repos.sh S example action
#   SomeDummyOrganization/action-example
#

set -e -u -o pipefail

organization_prefix_pattern=$1
shift
repository_query=''
for part in $@; do
  part_encoded=$(echo "$part" | jq --raw-input --raw-output @uri)
  repository_query="+$repository_query+$part_encoded"
done

organizations=$(github-orgs.sh "$organization_prefix_pattern")
for organization in $organizations; do
  gh api --jq '.items[].full_name' "/search/repositories?type=repositories&q=org:$organization$repository_query"
done
