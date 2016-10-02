#!/usr/bin/env bats
load test_helper


@test "it should download ENV.sh" {
  TMPDIR=`mktemp -d`
  cd $TMPDIR

  INSTALL_URL='https://goo.gl/kYnxxZ'
  run wget $INSTALL_URL -O $ENV  # Sync with README.md

  assert_success
  assert_file_exists $ENV
  [[ ! -f 'kYnxxZ' ]]
}
