#!/usr/bin/env bash

sudo add-apt-repository ppa:duggan/bats --yes 2>&1
sudo apt-get -qq update
sudo apt-get install -y bats 2>&1
sudo apt-get install -y realpath 2>&1
