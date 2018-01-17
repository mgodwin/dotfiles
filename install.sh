#!/usr/bin/env bash
if [ "$(uname)" == "Darwin" ]; then
  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  which -s ansible-playbook
  if [[ $? != 0 ]] ; then
    # Install ansible
    brew install ansible
  fi

  ansible-playbook --inventory=localhost, --connection=local $@ setup.yml
else
  echo "Unsupported OS, please run from a Mac - you can use SSH to setup linux from mac"
fi
