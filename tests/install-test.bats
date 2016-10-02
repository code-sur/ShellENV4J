#!/usr/bin/env bats
load test_helper


@test "it should install ENV.sh" {
  TMPDIR=`mktemp -d`
  cd $TMPDIR

  INSTALL_URL='https://goo.gl/kYnxxZ'
  run wget $INSTALL_URL -o $ENV  # Sync with README.md

  assert_success
  [[ -f $ENV ]]
}
