#!/bin/zsh
#
# Commands that help support Homer's CLI.

# Render an error.
homer_error() {
  message=$1
  echo "ERROR: $message"
}

# Save a file to Git.
homer_add() {
  file=$1
  message=$2

  if [[ -z $message ]]; then
    echo "You must enter a message."
    exit 1
  fi

  pushd $HOMER_HOME
  git add -f $file && git commit $file -m "${message}"
  popd
}

# Remove a file from Git.
homer_remove() {
  file=$1
  message=$2

  if [[ -z $message ]]; then
    echo "You must enter a message."
    exit 1
  fi

  pushd $HOMER_HOME
  git rm -rf $file && git commit -m "${message}"
  popd
}

# Commit all untracked files to Git.
homer_add_all() {
  message=$1
  pushd $HOMER_HOME
  git add -f . && git commit -m "${message}"
  popd
}

# Add an empty commit
homer_add_empty() {
  message=$1
  pushd $HOMER_HOME
  git commit --allow-empty -m "${message}"
  popd
}

# Make a commit of already added files (if any)
homer_commit_added() {
  message=$1
  pushd $HOMER_HOME
  git commit --allow-empty -m "${message}"
  popd
}

# Update the git repo in the home directory with the latest changes from
# GitHub.
homer_update_repo() {
  pushd $HOMER_HOME
  git stash save
  git fetch
  git diff ..origin/master --numstat
  git diff ..origin/master
  vared -p 'Proceed with update? [Y/n] ' -c tmp
  if [[ $tmp == 'y' || $tmp == '' ]]; then
    git pull --rebase origin master
    git push origin master
  else
    echo 'Skipping update and restoring stash...'
  fi
  git stash pop
  popd
}
