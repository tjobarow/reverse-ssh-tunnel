#!/bin/bash

#Get date for filename
date=$(date +%b-%d-%Y_%H:%M:%S)
echo $date

#Run the full and fast scan and save it to full_fast_<DATE>.xml
docker run --rm -v $(pwd):/reports/:rw thedoctor0/openvas-docker-lite python3 -u scan.py 10.0.0.0/24 --debug -o=full_fast_$date.xml | tee full_fast_docker_output_$date.log

#Run the system discovery scan and save it to system_discovery_<DATE>.xml
docker run --rm -v $(pwd):/reports/:rw thedoctor0/openvas-docker-lite python3 -u scan.py 10.0.0.0/24 --debug -p="System Discovery" -o=system_discovery_$date.xml | tee system_disc_docker_output_$date.log
