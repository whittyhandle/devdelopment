#!/bin/bash

dscl . read /Users/test Picture | awk -F '/' 'NR==2{print $NF}'
dscl . read /Users/test Picture | awk -F '/' 'END{print $NF}'