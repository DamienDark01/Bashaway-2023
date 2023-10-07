#!/bin/bash

echo "Enter password:"
read password

if [[ "$password" =~ [a-z] && "$password" =~ [A-Z] && "$password" =~ [0-9] && ${#password} -ge 8 ]]
then
    echo "true"
else
    echo "false"
fi