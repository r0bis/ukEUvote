#!/bin/bash

# this project runs on full auto
# run by cron using command crontab -e
# back up data, get new vote count, create new graph, update graph in readme page, push to git
# */5 * * * * /home/r0bis/bin/votebackup.sh
# */5 * * * * /usr/bin/Rscript /home/r0bis/src/ukEUvote/bin/voteBcount.R
# */30 * * * * /usr/bin/Rscript /home/r0bis/src/ukEUvote/bin/votegraph.R
# 1-56/5 * * * * /home/r0bis/bin/gitAutoPush.sh
# 4-59/30 * * * * /home/r0bis/src/ukEUvote/bin/graphUpdate.sh

cd ~/src/ukEUvote
git pull -q origin master
git status
git add .
git commit -m "latest update"
git push https://user:password@github.com/r0bis/ukEUvote.git master

# obviously username and password will be specific to your repository 
