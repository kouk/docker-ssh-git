#!/bin/bash

echo $PUBLIC_KEY >> /home/git/.ssh/authorized_keys
/usr/sbin/sshd -D -e
