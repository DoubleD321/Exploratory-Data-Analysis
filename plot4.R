## Question 4: Across the United States, how have emissions
## from coal combustion-related sources changed from 
## 1999-2008?
## 

setwd(choose.dir())
library(tidyverse)
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

coalcombinShortName<- SCC[grepl("Coal",SCC$Short.Name) & 
                            grepl("Comb",SCC$Short.Name),]
dim(coalcombinShortName)

emCoalComb<- NEI[NEI$SCC %in% coalcombinShortName$SCC,]
emCoalComb_yearly <- aggregate(emCoalComb$Emissions,by=list(emCoalComb$year), FUN=sum)
dim(emCoalComb_yearly)
View(emCoalComb_yearly)
names(emCoalComb_yearly)
names(emCoalComb_yearly)[1]="Year"
names(emCoalComb_yearly)[2]="Emissions"
names(emCoalComb_yearly)

png(filename = "plot4.png")
ggplot(emCoalComb_yearly,aes(x=factor(Year),y=round(Emissions/1000,1),label=round(Emissions/1000,1)))+
  geom_bar(stat="identity")+
  ylab(" Emissions in kilotons")+
  xlab("Year")+
  geom_label(color="grey",fontface="bold")+
  ggtitle("US Coal Combustion Emissions: 1999-2008")
dev.off()
