#!/usr/bin/env bats

BASEDIR="$BATS_TEST_DIRNAME/.."
ENV="$BASEDIR/ENV.sh"

INVERT='\e[7m'


enter_into_tmpdir() {
  RETURN_TMPDIR=`mktemp -d`
  cd $RETURN_TMPDIR
  echo $RETURN_TMPDIR  # bash is so ugly
}


underline_echo() {
  echo -e "${INVERT}" "$@"
}


assert_success() {
  if [ "$status" -ne 0 ]; then
    underline_echo "command failed with exit status $status"
    return 1
  fi
}


assert_output() {
  expected=$1
  actual=$output
  if [ "$actual" != "$expected" ]; then
    underline_echo "'$actual' not equal to '$expected'"
    return 1
  fi
}


assert_file_exists() {
  file_=$1
  if [[ ! -f $file_ ]]; then
    underline_echo "file: '$file_' does not exist"
    return 1
  fi
}


assert_fail() {
  SUCCESS=0
  if [ "$status" -eq $SUCCESS ]; then
    underline_echo "command successed, but should fail"
    return 1
  fi
}


assert_output_contains() {
  expected=$1
  actual=$output
  if [[ "$actual" != *"$expected"* ]]; then
    underline_echo "'$actual' does not contain '$expected'"
    return 1
  fi
}


assert_equals() {
  actual=$1
  expected=$2
  if [[ "$actual" != "$expected" ]]; then
    underline_echo "'$actual' not equal to '$expected'"
    return 1
  fi
}


assert_contains() {
  actual=$1
  expected=$2
  if [[ "$actual" != *"$expected"* ]]; then
    underline_echo "'$actual' does not contain '$expected'"
    return 1
  fi
}
