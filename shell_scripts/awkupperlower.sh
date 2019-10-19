#!/bin/bash

networksetup -getmacaddress Wi-Fi | awk '{print $3}' | tr [:lower:] [:upper:]