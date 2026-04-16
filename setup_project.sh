#!/bin/bash

read -r -p "Enter your project number: " number
trap 'zip -r "attendance_tracker_${number}_archive.zip" "attendance_tracker_${number}" && rm -rf attendance_tracker_${number}; exit' SIGINT

mkdir -p attendance_tracker_$number
mkdir -p "attendance_tracker_$number/Helpers/"
mkdir -p  "attendance_tracker_$number/reports/"

cp assets.csv "attendance_tracker_$number/Helpers/"
cp config.json "attendance_tracker_$number/Helpers/"
cp reports.log "attendance_tracker_$number/reports/"
cp attendance_checker.py "attendance_tracker_$number"

read -r -p "Do you want to update your threshold (y/n): " choice
if [ "$choice" = 'y' ]; then
	read -r -p "Enter new Warning threshold value: " warning
	read -r -p "Enter new Failure threshold value: " failure
	
	sed -i "s/75/$warning/g" "attendance_tracker_$number/Helpers/config.json"
        sed -i "s/50/$failure/g" "attendance_tracker_$number/Helpers/config.json"
else
	echo "The threshold remaining the same"
fi

#trap 'zip -r "attendance_tracker_${number}_archive.zip" "attendance_tracker_${number}" && rm -rf attendance_tracker_${number}; exit' SIGINT

if python3 --version; then
	echo "Python is available"
else
        echo "Python not available"
fi	


  	
