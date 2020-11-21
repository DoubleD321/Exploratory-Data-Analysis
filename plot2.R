## Question 2: Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
## to make a plot answering this question.
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

baltNEI<- NEI[NEI$fips=='24510',] 
emBaltCity_yearly<- aggregate(Emissions ~ year,baltNEI,sum)
png(filename = "plot2.png")
barplot(height=emBaltCity_yearly$Emissions/1000,xlab= "Year",
        names=emBaltCity_yearly$year, 
        ylab = "PM2.5 Emissions in kilotons", 
        main="Baltimore City Yearly PM2.5 Emissions 
        - 1999, 2002, 2005, & 2008")
dev.off()