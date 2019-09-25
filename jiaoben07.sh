#!/bin/bash

test="testing"

if [ -d $test ]
then
    echo "a dir named $test exists"
else
    echo "no dir named $test exists"
fi

if [ -f jiaoben01.sh ] && [ -f jiaoben06.sh ]
then
    if [ jiaoben06.sh -nt jiaoben01.sh ]
    then
        echo "jiaoben06 is newer than jiaoben01"
    else
        echo "jiaoben01 is newer than jiaoben06"
    fi
else
    echo "file not exist"
fi



