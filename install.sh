#!/usr/bin/env bash

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

ansible-playbook -i local setup.yml
