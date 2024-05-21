#!/usr/bin/bash
# pull.bash
# use docker images format option to generate list of images to pull
docker images --format "{{.Repository}}:{{.Tag}}" | xargs -L1 docker pull
