#!/usr/bin/env bats
load test_helper


JDK="$BATS_TEST_DIRNAME/mock_jdk"


setup() {
  ln -s $JDK jdk
}


teardown() {
  rm -f jdk
}


assert_success() {
  if [ "$status" -ne 0 ]; then
    echo "command failed with exit status $status"
    return 1
  fi
}


@test "it should set java" {
  . ENV.sh
  run java -version

  assert_success
  [[ $output = "java mock" ]]
}
