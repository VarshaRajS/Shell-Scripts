#!/bin/bash

repo_dir=/workspaces/Shell-Scripts/project
commit_msg=$1

if [ -z "$commit_msg" ]; then
	echo "Usage: $0 <commit-message>"
	exit 1
fi

cd $repo_dir || { echo "repo not found"; exit 1; }

echo "Adding changes to git..."
git add .

echo "Committing changes..."
git commit -m "$commit_msg"

echo "pusing changes to repository..."
git push origin main

if [ $? -eq 0 ]; then 
	echo "Done!"
else
	echo "Unsuccessfull!"
fi 
