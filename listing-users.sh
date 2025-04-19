#!/bin/bash

##########################################################################
# Script to list users with read access to a GitHub repository
# Usage: ./list--users.sh <repository_owner> <repository_name>
#
# NOTE : MAKE SURE TO SET THE FOLLOWING ENVIRONMENT VARIABLES using export command
# username : GitHub username
# token : GitHub personal access token
# Example: export username="your_username" token="your_token"
# Requirements: jq (for JSON parsing)
#
# Owner : Munish Thakur
# Date : 2023-10-01
###############################################################################

helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

function helper() {
    if [$# -ne $expected_cmd_args ]; then
        echo "Please provide required arguments"
        echo " ./list--users.sh <repository_owner> <repository_name>"
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
