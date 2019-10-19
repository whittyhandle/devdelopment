#!/bin/bash

dscl . list /Users UniqueID | awk '$2>500{print "The user "$1" has and id of "$2""}'