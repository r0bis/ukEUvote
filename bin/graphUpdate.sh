#!/bin/bash
# change to project directory
# get the last graph created
# sed will perform update in readme.rst according to commands in graphUpdate.sed file
# this method will avoid backup files; if sed fails for whatever reason - the actual input
# file is not clobbered
cd ~/src/ukEUvote
LASTGRAPH=`ls ~/src/ukEUvote/graphs/ | tail -n 1`
sed -e '~/src/ukEUvote/bin/graphUpdate.sed' ./readme.rst > ../readme.rst.tmp && mv ../readme.rst.tmp ./readme.rst
