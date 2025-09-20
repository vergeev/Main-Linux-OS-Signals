#!/bin/bash

trap date SIGINT

read input
echo User input: $input
echo Exiting now
