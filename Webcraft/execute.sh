#!/bin/bash

web_root="src"

if [ ! -d "$web_root" ]
then
  exit 1
fi

if nc -z localhost 8085
then
  exit 1
fi

python -m SimpleHttpServer 8085 --directory "$web_root"

sleep 2
wait