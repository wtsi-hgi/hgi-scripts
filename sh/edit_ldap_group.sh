#!/bin/bash

group=$1

module purge
module add hgi/ldapvi/latest

if [[ -r ~/.ldapvirc ]]; 
then
    ldapvi "(&(cn=${group})(objectClass=posixGroup))"
else
    >&2 echo "~/.ldapvirc not readable, please run on hgi-mercury-farm3" 
    exit 1
fi
