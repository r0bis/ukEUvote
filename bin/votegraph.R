# this graph is quite basic

library(lubridate)
library(ggplot2)
# read in accumulated data and format epoch timestamp to normal time
votedfB <- read.csv("~/src/ukEUvote/data/voteBdata.csv")
votedfB$time <- as.POSIXct(votedfB$time,origin = "1970-01-01",tz = "Europe/London")
# some variables
maxCount <- max(votedfB$votecount)
maxLab <- as.character(format(maxCount,big.mark=",",scientific=FALSE))
max(votedfB$votecount)

# make and output plot
voteplot <- ggplot(votedfB,aes(x=time,y=votecount))
voteplot <- voteplot + geom_line(colour = "darkgreen", size = 1) +
  ylab("Vote count") + xlab("Time") +
  ggtitle(paste("Vote counts on",format(now(), "%A %d %b, %Y @ %H:%M") ))
voteplot <- voteplot +   annotate(hjust=0, "text", y=3287000, x=(now()-32900), label = paste("Maximum count reached so far: ", maxLab), colour = "red") +
  annotate(hjust=1, "text", y=2950000, x=(now()-1000), label = "data collection started at 9 AM from \n https://petition.parliament.uk/petitions/131215")

ggsave(plot = voteplot, filename = paste("~/src/ukEUvote/data/votes_",format(now(), "%Y_%m_%d-%H_%M"),".png",sep=""), width=170, height=107, units="mm" , scale = 1.2)

votedfB$hour <- floor_date(votedfB$time, unit = "hour")
as.data.frame(votedfB %>% group_by(hour) %>% slice(which.max(votecount)))$votecount - as.data.frame(votedfB %>% group_by(hour) %>% slice(which.min(votecount)))$votecount

