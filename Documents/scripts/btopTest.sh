#! /usr/bin/bash
for i in {1..100}; do
  mmsg get all-clients | jq '.'
  sleep 0.1
done
