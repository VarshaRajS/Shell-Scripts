#!/bin/bash

domain="google.com"

echo "checking connection to $domain..........."
curl -I https://$domain -k

# $? gives the exit staus of the previous command , if exit status is zero then successful
if [ $? -eq 0 ]; then
	echo "HTTPS connectivity is working for $domain"
else
	echo "HTTPS connectivity failed for $domain"
fi
