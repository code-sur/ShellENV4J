#!/usr/bin/env bats
load test_helper
IT='ENV'

JDK="$BATS_TEST_DIRNAME/jdk_mock"
MAVEN_HOME="$BATS_TEST_DIRNAME/maven_mock"

setup() {
  enter_into_tmpdir

  cp $BASEDIR/ENV.sh $WORKDIR

  JDK_LINK="$WORKDIR/jdk"
  ln -s $JDK $JDK_LINK

  MAVEN_LINK="$WORKDIR/maven"
  ln -s $MAVEN_HOME $MAVEN_LINK
}

teardown() {
  rm -f $JDK_LINK
  rm -f $MAVEN_LINK
  rm -rf $WORKDIR
}


@test "$IT should set java" {
  . ENV.sh
  run java -version

  assert_success
  assert_output 'java version "mock"'
}

@test "$IT should set maven" {
  . ENV.sh
  run mvn -version

  assert_success
  assert_output "maven mock"
}


@test "$IT should fail without jdk" {
  rm -f $JDK_LINK
  ENV_stderr_only() {
    . ENV.sh > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}


@test "$IT should fail without maven" {
  rm -f $MAVEN_LINK
  ENV_stderr_only() {
    . ENV.sh > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}


@test "$IT should allow running maven after changing dir" {
  . ENV.sh
  cd $BATS_TMPDIR
  run mvn -version
  assert_success
  assert_output "maven mock"
}


@test "$IT should set ShellENV4J in PS1" {
  PS1='user@mockPS1:~/$'
  ORIGINAL_PS1=$PS1
  . ENV.sh
  assert_contains "$PS1" "$ORIGINAL_PS1"
  assert_contains "$PS1" "(ShellENV4J)"
}

@test "$IT should source .envrc" {
  cp $BASEDIR/.envrc $WORKDIR
  run . ENV.sh
  assert_output "envrc mock"
}
