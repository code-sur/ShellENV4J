#!/usr/bin/env bats

ENV='ENV.sh'

UNDERLINE='\e[4m'
NO_UNDERLINE='\e[24m'
RED='\e[31m'
LIGHT_RED='\e[91m'


assert_success() {
  if [ "$status" -ne 0 ]; then
    echo -e "${UNDERLINE}command failed with exit status $status"
    return 1
  fi
}


assert_output() {
  expected=$1
  actual=$output
  if [ "$actual" != "$expected" ]; then
    echo -e "${UNDERLINE}expected:${NO_UNDERLINE} $expected"
    echo -e "${UNDERLINE}actual:${NO_UNDERLINE} $actual"
    return 1
  fi
}


assert_file_exists() {
  file_=$1
  if [[ ! -f $file_ ]]; then
    echo -e "${UNDERLINE}file: ${LIGHT_RED}$file_${RED} does not exist"
    return 1
  fi
}
