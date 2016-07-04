# this graph is quite basic

library(lubridate)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(scales)

# read in accumulated data and format epoch timestamp to normal time
votedfB <- read.csv("~/src/ukEUvote/data/voteBdata.csv")
votedfB$time <- as.POSIXct(votedfB$time,origin = "1970-01-01",tz = "Europe/London")

# some variables
maxCount <- max(votedfB$votecount)
maxLab <- as.character(format(maxCount,big.mark=",",scientific=FALSE))
latestCount <- votedfB$votecount[which.max(votedfB$time)]
# print maxVotecount in case we are running it interactively
maxCount
latestCount

# calculate votes per hour
votedfB$hour <- floor_date(votedfB$time, unit = "hour")
maxHvote <- as.data.frame(votedfB %>% group_by(hour) %>% slice(which.max(votecount)))$votecount
minHvote <- as.data.frame(votedfB %>% group_by(hour) %>% slice(which.min(votecount)))$votecount
last5hvotes <- head(tail(maxHvote - minHvote,6),5)
labLast5hvotes <- paste(format(last5hvotes,big.mark=",",scientific=FALSE), sep=" ",collapse = " => ")


# make and then save output plot
voteplot <- ggplot(votedfB,aes(x=time,y=votecount))
voteplot <- voteplot + geom_line(colour = "#008800", size = 1.2) +
  ylab("Vote count") + xlab("Time") +
  ggtitle(paste("2nd referendum petition vote counts on",format(now(), "%A %d %b, %Y @ %H:%M") ))
# annotate and apply theme
voteplot <- voteplot +
  annotate(hjust=1, "text", y=3287000, x=(now()-1000), label = paste("Latest count reached: ", format(latestCount,big.mark=",",scientific=FALSE)), colour = "darkred") +
  annotate(hjust=1, "text", y=2989000, x=(now()-1000), label = "Data collection started at on 26th June at 9 AM from \n https://petition.parliament.uk/petitions/131215") +
  annotate(hjust=1, "text", y=2905000, x=(now()-1000), label = paste("Signatures per hour over last 5 hours: ",labLast5hvotes)) +
  annotate(hjust=1, "text", y=2860000, x=(now()-1000), label = "project page https://github.com/r0bis/ukeuvote") +
  scale_y_continuous(labels = comma) +
  theme_igray() + scale_colour_tableau()

# save latest plot; files in graphs folder will be sorted automatically by name
ggsave(plot = voteplot, filename = paste("~/src/ukEUvote/graphs/votes_",format(now(), "%Y_%m_%d-%H_%M"),".png",sep=""), width=170, height=107, units="mm" , scale = 1.2)
# voteplot
# output signature activity per hour (group by hour, then subtract min from max in that hour)
# presently just print the countperhour on terminal.

# print votes over all hours on terminal
maxHvote - minHvote

# Zooming in on specific times
# voteplot + coord_cartesian(xlim = c(votedfB$time[104],votedfB$time[178])) + geom_line(size=0.8)
