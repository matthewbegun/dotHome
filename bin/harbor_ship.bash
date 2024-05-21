#!/usr/bin/bash
# ship.bash

# build all harbor images
find . -name build.bash -execdir bash {} \;

# push all harbor images
find . -name push.bash -execdir bash {} \;
