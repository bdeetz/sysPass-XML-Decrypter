#!/usr/bin/env bash

command="$*"

echo "running ./decrypt.php ${command}"

# WARNING!!! COMMAND INJECTION OP
#bash -c "./decrypt.php ${command}"
bash -c "${command}"
