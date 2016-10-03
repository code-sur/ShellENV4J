#!/usr/bin/env bats
load test_helper
IT='ENV'

JDK="$BATS_TEST_DIRNAME/mock_jdk"

setup() {
  ln -s $JDK jdk
}

teardown() {
  rm -f jdk
}


@test "$IT should set java" {
  . $ENV
  run java -version

  assert_success
  assert_output "java mock"
}


@test "$IT should fail without jdk" {
  rm -f jdk
  ENV_stderr_only() {
    . $ENV > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}
