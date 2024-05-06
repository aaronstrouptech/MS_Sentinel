#!/bin/sh

## Install as Root
sudo installer -pkg "/private/var/tmp/NessusAgent.pkg" -target /
## Link Agent
sudo /Library/NessusAgent/run/sbin/nessuscli agent link --key="23a87832c27177274bd837318f7e22032e4011bec11781209cbbf8ddc4876c4d" --cloud --groups="mac"
## Removing the package
sudo rm /private/var/tmp/NessusAgent.pkg
