{ writeScriptBin }:

writeScriptBin "protect-master" ''#!/usr/bin/env bash
  protected_branch='master'
  if read local_ref local_sha remote_ref remote_sha; then
    if [[ "$remote_ref" == *"$protected_branch ]]; then
      echo -en "\033[1;33mYou're about to push to master, this is not correct for Kasiopea!\033[0m"
      echo -en "\033[1;33mIs that what you really intended? [y|n] \033[0m"
      echo -en "\033[1m"
      read -n 1 -r < /dev/tty
      echo -en "\033[0m"

      echo
      if echo $REPLY | grep -E '^[Yy]$' > /dev/null; then
          exit 0 # push will execute
      fi
      exit 1 # push will not execute
    fi
  fi
''

