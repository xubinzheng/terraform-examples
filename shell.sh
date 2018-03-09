#!/bin/sh

max=1500
for i in {1..1000}
do
    cp test.yaml blueprint$i.yaml
done

