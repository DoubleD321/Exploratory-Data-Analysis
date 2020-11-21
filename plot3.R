## Question 3: Of the four types of sources indicated
## by the \color{red}{\verb|type|}type (point, 
## nonpoint, onroad, nonroad) variable, which of 
## these four sources have seen decreases in 
## emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 
## 1999-2008? Use the ggplot2 plotting system to 
## make a plot answer this question.

setwd(choose.dir())
library(ggplot2)
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
names(SCC)
head(SCC)

baltNEI<- NEI[NEI$fips=='24510',] 
dim(baltNEI)
emBCtype_yearly<- aggregate(Emissions ~ year + type,baltNEI,sum)
dim(emBCtype_yearly)
View(emBCtype_yearly)

png(filename = "plot3.png")
ggplot(emBCtype_yearly,aes(year, Emissions,color=type))+
  geom_line()+
  xlab("Year")+
  ylab("Emissions in kilotons")+
  ggtitle("Baltimore City PM2.5 Emisions by Type:
                   1999 - 2008")
dev.off()
print("Non-Road, Nonpoint, and On-road have all seen decreases in
      PM2.5 Emisions between 1998 and 2008. Point has seen an 
      increase during that same period. However, 2008 was 
      significantly lower than 2005.")
