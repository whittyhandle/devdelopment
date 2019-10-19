#!/bin/sh


address="https://bramcohen.local:8443"
numberOfRuns="20"


logFile="/Users/bramcohen/Desktop/cert.log"

runs=0
while [ "$runs" -lt "$numberOfRuns" ]; do
	openssl s_client -showcerts -connect ${serverAddress} >> ${logFile}
	sleep 10
done