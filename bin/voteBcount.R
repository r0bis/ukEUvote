# this script is run every 5 minutes by operating system
# on linux this is run through cron:
# */5 * * * * /usr/bin/Rscript /home/username/src/ukEUvote/bin/voteBcount.R
# but that can be adapted on Mac and Windows undoubtedly

library(rvest)
library(lubridate)

# this is when I on first manual run created data frame:
# votedf <- data.frame(date = character(0),votecount = character(0))
# colnames(votedf) <- c("time","votecount")

# then this is to read back on subsequent automatic runs
votedf <- read.csv("~/src/ukEUvote/data/voteBdata.csv")

# actual data scraping - get page, then extract the number of votes
# and record in dataframe with the timestamp when number was gathered
petition <- read_html("https://petition.parliament.uk/petitions/131215")
str <- petition %>% html_nodes(xpath = '//*[@class="signature-count-number"]') %>% html_text()
votecount <- as.numeric(gsub("[^0-9]","",str))
votetime <- Sys.time()
votedf <- rbind(votedf,c(votetime,votecount))
write.csv(file="~/src/ukEUvote/data/voteBdata.csv",x=votedf,row.names = FALSE)
