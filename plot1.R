setwd(choose.dir())
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dim(NEI)
class(NEI)
names(NEI)
head(NEI)
dim(SCC)
class(SCC)
head(SCC)
## Question #1: Have total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot showing the 
## total PM2.5 emission from all sources for each of the years 1999, 2002, 
## 2005, and 2008.
totalEm_yearly<- aggregate(Emissions ~ year,NEI,sum)
View(totalEm_yearly)
png(filename = "plot1.png")
barplot(height=totalEm_yearly$Emissions/1000,xlab= "Year",
        names=totalEm_yearly$year, 
        ylab = "PM2.5 Emissions in kilotons", 
        main="Yearly PM2.5 Emissions:
        1999 - 2008")
dev.off()
