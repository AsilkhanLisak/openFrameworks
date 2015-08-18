#!/bin/bash
set -ev
ROOT=${TRAVIS_BUILD_DIR:-"$( cd "$(dirname "$0")/../../.." ; pwd -P )"}

echo "**** Running unit tests ****"
cd $ROOT/tests
for group in *; do
	if [ -d $group ]; then
		for test in $group/*; do
			if [ -d $test ]; then
				cd $test
				cp ../../../scripts/osx/template/Makefile .
				cp ../../../scripts/osx/template/config.make .
				make Debug
				make RunDebug
			fi
		done
	fi
done