#!/usr/bin/env bats


@test "it should install ENV.sh" {
  cd $BATS_TMPDIR

  run wget https://goo.gl/kYnxxZ

  [[ $status -eq 0 ]]
  [[ -f ENV.sh ]]
}
