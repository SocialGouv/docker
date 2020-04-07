load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-file/load.bash'

@test 'assert_file_exist() <file>: returns 0 if <file> exists' {
  local -r file="${BATS_TEST_DIRNAME}/files.bats"
  run assert_file_exist "$file"
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 0 ]
}

@test 'assert_file_exist() <file>: returns 1 and displays path if <file> does not exist' {
  local -r file="${BATS_TEST_DIRNAME}/file.does_not_exist"
  run assert_file_exist "$file"
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" == '-- file does not exist --' ]
  [ "${lines[1]}" == "path : $file" ]
  [ "${lines[2]}" == '--' ]
}
