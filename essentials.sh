#!/bin/bash

echo "updating and upgrading the system............."
sudo apt-get update -y && sudo apt-get upgrade -y

echo "installing essential packages......."
sudo apt-get install -y git curl wget vim
