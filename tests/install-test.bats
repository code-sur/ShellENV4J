#!/usr/bin/env bats
load test_helper


@test "it should install ENV.sh" {
  cd `mktemp -d`

  run wget https://goo.gl/kYnxxZ -o ENV.sh  # Sync with README.md

  [[ $status -eq 0 ]]
  [[ -f ENV.sh ]]
}
