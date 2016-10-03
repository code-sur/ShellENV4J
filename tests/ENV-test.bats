#!/usr/bin/env bats
load test_helper

JDK="$BATS_TEST_DIRNAME/mock_jdk"


@test "it should set java" {
  ln -s $JDK jdk

  . $ENV
  run java -version

  rm -f jdk


  assert_success
  assert_output "java mock"
}


@test "it should fail without jdk" {
    run . $ENV
    assert_fail
    assert_output_contains "ERROR"
}
