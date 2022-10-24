#!/bin/bash

export CMAKE_ARGS="-DCMAKE_BUILD_TYPE=$MATRIX_BUILD_TYPE"

if [[ $MATRIX_COMPILER =~ clang-([0-9]+) ]]
then
    version=${BASH_REMATCH[1]}
    export CC=clang-$version
    export CXX=clang++-$version
elif [[ $MATRIX_COMPILER =~ g\+\+-([0-9]+) ]]
then
    version=${BASH_REMATCH[1]}
    export CC=gcc-$version
    export CXX=g++-$version
else
    echo "error: not valid compiler parameter."
    exit 1
fi
