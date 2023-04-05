#!/bin/sh
rm -rf .vagrant && vagrant up DevOps && vagrant ssh DevOps -c "sudo shutdown -r now"