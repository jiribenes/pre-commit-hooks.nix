{ writeScriptBin }:

writeScriptBin "protect-master" ''#!/usr/bin/env bash
  protected_branch='master'
  current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

  if [ $current_branch = $protected_branch ]; then
    echo -en "\033[1;33mYou tried to commit/push to master, this is not a correct approach!\033[0m\n"
    echo -en "\033[1;33mIf you want to contribute code, please open a Pull Request!\033[0m\n"

    exit 1 # push will not execute
  fi
''
