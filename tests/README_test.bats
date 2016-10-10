#!/usr/bin/env bats
load test_helper
IT="README's install"

INSTALL_URL='https://goo.gl/kYnxxZ'
DOWNLOAD_COMMAND="wget $INSTALL_URL -O $ENV"  # Sync with README.md


setup() {
  TMPDIR=`mktemp -d`
  cd $TMPDIR
}


@test "$IT should download ENV.sh" {
  run $DOWNLOAD_COMMAND

  assert_success
  assert_file_exists $ENV
}


@test "$IT should not download 'kYnxxZ'" {
  run $DOWNLOAD_COMMAND

  ! assert_file_exists 'kYnxxZ'
}
