#!/bin/bash

diskutil list | awk '/Macintosh/{print $NF}'