#!/bin/bash

DEPEND_SOURCE=${HOME}/tmp/superpolo_dep_libs/
DEPEND_TARGET=${superpolo_dep_libs}/

PREBUILD_SOURCE=${HOME}/tmp/superpolo_prebuild/
PREBUILD_TARGET=${superpolo_base_path}/libs/prebuild/

# Transfer
rsync -l -r -t -v --progress --delete ${DEPEND_SOURCE} ${DEPEND_TARGET}
rsync -l -r -t -v --progress --delete ${PREBUILD_SOURCE} ${PREBUILD_TARGET}
