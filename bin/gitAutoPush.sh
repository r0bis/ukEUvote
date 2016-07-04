#!/bin/bash

# this is an explanatory script - needs to be edited to your conditions
# actual script and backup are run from place not accessible to this project.
# so how this project runs on full auto
# run by cron using command crontab -e
# back up data, get new vote count, create new graph, update graph in readme page, push to git
# */5 * * * * /home/user/bin/votebackup.sh
# */5 * * * * /usr/bin/Rscript /home/user/src/ukEUvote/bin/voteBcount.R
# */30 * * * * /usr/bin/Rscript /home/user/src/ukEUvote/bin/votegraph.R
# 1-56/5 * * * * /home/user/src/ukEUvote/bin/gitAutoPush.sh
# 4-59/30 * * * * /home/user/src/ukEUvote/bin/graphUpdate.sh

cd ~/src/ukEUvote
git pull -q origin master
git status
git add .
git commit -m "latest update"
git push https://user:password@github.com/user/ukEUvote.git master

# obviously username and password will be specific to your repository 
