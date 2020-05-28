

# start - test

dest_file <- "zippedfile.bz2"

urlzip <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(urlzip, dest_file) 

zz=bzfile(dest_file,'rt')  

dat=read.csv(zz,header=T)

head(dat)

names(dat)

# Colmumns with NA
colSums(is.na(dat))

allDate <- dat$BGN_DATE
head(allDate)


library(dplyr)
datvent <- data.frame(table(dat$EVTYPE))
datvent <- tbl_df(datvent)
datvent <- datvent %>% arrange(desc(Freq))

datvent1 <- head(datvent)
datvent1

datvent <- tbl_df(dat)

datvent <- datvent %>% mutate(NEW_BGN=as.Date(as.character(BGN_DATE), "%m/%d/%Y")) %>% mutate(BGN_YEAR=as.Date(NEW_BGN,"%Y"))



datvent2 <- datvent %>% group_by(EVTYPE) %>% summarise(total_injuries=sum(INJURIES,na.rm=T),
                                                       total_fatalities=sum(FATALITIES,na.rm=T)) %>% arrange(desc(total_fatalities))

ctnmae<- data.frame(table(dat$COUNTYNAME))


