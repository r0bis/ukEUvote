#!/bin/bash
# change to project directory
# get the last graph created
# sed will perform update in readme.rst according to commands in graphUpdate.sed file
# this method will avoid backup files; if sed fails for whatever reason - the actual input
# file is not clobbered
cd ~/src/ukEUvote
pwd
LASTGRAPH=`ls ~/src/ukEUvote/graphs/ | tail -n 1`
sed -e s/(votes_2016_[0-9_-]{11}\.png)/$LASTGRAPH/g ./readme.rst > ../readme.rst.tmp && cat ../readme.rst.tmp | echo

# mv ../readme.rst.tmp ./readme.rst
