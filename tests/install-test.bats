#!/usr/bin/env bats


@test "it should install ENV.sh" {
  cd $BATS_TMPDIR

  run wget https://raw.githubusercontent.com/code-sur/setup-java-project/master/ENV.sh

  [[ $status -eq 0 ]]
  [[ -f ENV.sh ]]
}
