#!/usr/bin/env bash

# colors will be only aviable in interactive shell
if [ -t 1 ]; then
  COLOR_DEF='\033[0;39m'
  COLOR_DIM=''
  COLOR_DGRAY='\033[1;40m'
  COLOR_LBLACK='\033[1;30m'
  COLOR_LRED='\033[1;31m'
  COLOR_LCYAN='\033[1;36m'
  COLOR_LGREEN='\033[1;32m'
  COLOR_LYELLOW='\033[1;33m'
  COLOR_LBLUE='\033[1;34m'
  COLOR_LMAGENTA='\033[1;35m'
fi

ts=$(date +%s)

# print message
log() {
  local new_ts=$(date +%s)
  echo -e "\n$@ ${COLOR_LBLACK}..$((new_ts-ts))s${COLOR_DEF}"
}

# fancy print error message into stderr
err() {
  log "${COLOR_LRED}$@${COLOR_DEF}" >&2
}

log::ok() {
  log "${COLOR_LGREEN}$@${COLOR_DEF}"
}

log::warn() {
  log "${COLOR_LYELLOW}$@${COLOR_DEF}"
}

log::info() {
  log "${COLOR_LCYAN}$@${COLOR_DEF}"
}

exception() {
  err "$@"
  exit 1
}