#!/bin/bash

echo ""
echo "-----------------------------"
echo "Publishing site content"
echo "-----------------------------"

echo "Step 1: Compile Site"
hugo -c ./content

echo "Step 2: Sync to S3"
aws s3 sync public/ s3://aws-modernize-workshop.alliances.dynatracelabs.com 

echo "-----------------------------"
echo "Done"
echo "-----------------------------"
echo ""
