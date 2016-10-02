#!/usr/bin/env bats
load test_helper

JDK="$BATS_TEST_DIRNAME/mock_jdk"


setup() {
  ln -s $JDK jdk
}


teardown() {
  rm -f jdk
}


@test "it should set java" {
  . $ENV
  run java -version

  assert_success
  assert_output "java mock"
}
