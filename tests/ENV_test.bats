#!/usr/bin/env bats
load test_helper
IT='ENV'

JDK="$BATS_TEST_DIRNAME/jdk_mock"
JDK_LINK="$BASEDIR/jdk"
MAVEN_HOME="$BATS_TEST_DIRNAME/maven_mock"
MAVEN_LINK="$BASEDIR/maven"

setup() {
  enter_into_tmpdir
  ln -s $JDK $JDK_LINK
  ln -s $MAVEN_HOME $MAVEN_LINK
}

teardown() {
  rm -f $JDK_LINK
  rm -f $MAVEN_LINK
  rm -rf $RETURN_TMPDIR
}


@test "$IT should set java" {
  . $ENV
  run java -version

  assert_success
  assert_output 'java version "mock"'
}

@test "$IT should set maven" {
  . $ENV
  run mvn -version

  assert_success
  assert_output "maven mock"
}


@test "$IT should fail without jdk" {
  rm -f $JDK_LINK
  ENV_stderr_only() {
    . $ENV > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}


@test "$IT should fail without maven" {
  rm -f $MAVEN_LINK
  ENV_stderr_only() {
    . $ENV > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}


@test "$IT should set maven to run when sourcing from basedir and changing dir" {
  cd $BASEDIR
  . ENV.sh
  cd $BATS_TMPDIR
  run mvn -version
  assert_success
}


@test "$IT should set java version in PS1" {
  PS1='PS1'
  ORIGINAL_PS1=$PS1
  . $ENV
  assert_equals "$PS1" "jdk: mock $ORIGINAL_PS1"
}
