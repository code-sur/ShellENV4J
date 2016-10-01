#!/usr/bin/env bats

UNDERLINE='\e[4m'
NO_UNDERLINE='\e[24m'


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
