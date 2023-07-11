#!/bin/bash

declare -a versions=("4.17.3" "4.18.0")
for version in "${versions[@]}"
do
    image=captaincoordinates/jsonschema-4.18-bug-$version
    docker build \
        -t $image \
        --build-arg jsonschema_version=$version \
        .

    echo "Testing $version"
    docker run \
        --rm \
        $image
    exit_code=$?

    echo
    if [ $exit_code -eq 0 ]; then
        echo "Success"
    else
        echo "Failure"
    fi
    echo

done
