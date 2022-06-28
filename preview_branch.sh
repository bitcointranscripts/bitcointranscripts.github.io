#!/bin/bash

# This script allows you to preview how the changes in your branch will be displayed in the website.

# By giving as arguments your GitHub username and the branch you want to preview, Hugo will locally
# build the website using your branch as the content submodule.
# Usage example: ./preview_branch.sh <your-github-account> <your-branch-name>

# You can see the preview at http://localhost:1313 and after you close the preview, the script will
# handle the reset back to using the original submodule

GITHUB_ACCOUNT=$1
REPOSITORY_FORK="https://github.com/${GITHUB_ACCOUNT}/bitcointranscripts.git"
BRANCH=${2:-"master"}

# On exit always reset back to using the original submodule and revert any changes done in preview-mode
trap 'git restore .gitmodules; git submodule update -f' EXIT

# Preview mode
echo "Previewing branch '${BRANCH}' of '${REPOSITORY_FORK}':"
(git submodule set-url content "$REPOSITORY_FORK" &&       # change the submodule url
    git submodule set-branch --branch "$BRANCH" content && # change the submodule branch
    git submodule update --remote) &&                      # fetch the updated submodule content
    hugo server                                            # build the website with the updated content
