

# start

dest_file <- "zippedfile.bz2"

urlzip <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(urlzip, dest_file) 

zz=bzfile(dest_file,'rt')  

dat=read.csv(zz,header=T)

head(dat)

names(dat)

