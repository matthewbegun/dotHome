#!/usr/bin/bash
# harbor_log.bash

# This script will generate a file with each line being a docker pull command for each image installed on the system
# This script is intended to be used in conjunction with the harbor project to backup docker images to a local registry
#
# Usage:
# harbor_log.bash
#
# Output:
# A file named harbor.txt will be created in the current directory with each line being a docker pull command for each image installed on the system

docker images --format "{{.Repository}}:{{.Tag}}" | sed 's/^/docker pull /' > ~/_src/dotHome/harbor.txt
