#!/bin/bash
#
#  Test runner script meant to be executed inside of a docker container
#
#  Usage: travis_run.sh [OPTIONS...]
#
#  Where OPTIONS are passed directly to ./configure
#
#  The script is otherwise influenced by the following environment variables:
#
#  JOBS=N        Argument for make's -j option, default=2
#
#  And, obviously, some crucial variables that configure itself cares about:
#
#  CC, CXX, LDFLAGS, CFLAGS, etc.
#

export JOBS=${JOBS:-2}

printenv LIBCLANG_PATH

echo "Cargo build"
cargo build -j $JOBS

echo "Cargo test"
cargo test -j $JOBS
