#!/usr/bin/env bash
#
# Outputs a list of GitHub organizations of which the current GitHub CLI user is a member,
# where organization can be optionally filtered by name.
#
# $1 : (Optional) GitHub organization name prefix.
#
# Example:
#   $ bin/github-orgs.sh S
#   SomeDummyOrganization
#
set -e -u -o pipefail

organization_prefix=$1
gh api /user/orgs --jq '.[].login' | grep "^$organization_prefix"
