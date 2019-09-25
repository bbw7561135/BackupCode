#!/bin/bash

val1=testing
val2=""

if [ -n $val1 ] #non-zero
then
    echo "the string $val1 is not empty"
else
    echo "the string $val1 is empty"
fi

if [ -z $val2 ] #zero
then
    echo "the string $val2 is empty"
else
    echo "the string $val2 is not empty"
fi
