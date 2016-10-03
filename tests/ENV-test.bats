#!/usr/bin/env bats
load test_helper
IT='ENV'

JDK="$BATS_TEST_DIRNAME/mock_jdk"
MAVEN_HOME="$BATS_TEST_DIRNAME/mock_maven"

setup() {
  ln -s $JDK jdk
  ln -s $MAVEN_HOME maven
}

teardown() {
  rm -f jdk
  rm -f maven
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


@test "$IT should fail without maven" {
  rm -f maven
  ENV_stderr_only() {
    . $ENV > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}
