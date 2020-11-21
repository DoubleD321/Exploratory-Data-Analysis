## Question 6: Compare emissions from motor 
## vehicle sources in Baltimore City with 
## emissions from motor vehicle sources in Los 
## Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time 
## in motor vehicle emissions?
## 

setwd(choose.dir())
library(ggplot2)
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")
NEI_data <- readRDS("summarySCC_PM25.rds")
SCC_data <- readRDS("Source_Classification_Code.rds")
dim(NEI_data)
class(NEI_data)
names(NEI_data)
head(NEI_data)
dim(SCC_data)
class(SCC_data)
names(SCC_data)
head(SCC_data)

vehSubSetSCC_data<-SCC_data[grepl("Vehicle", SCC_data$EI.Sector,ignore.case = TRUE),"SCC"]
dim(vehSubSetSCC_data)
head(vehSubSetSCC_data)
class(vehSubSetSCC_data)
vehSubSetSCC_data<- as.data.frame(vehSubSetSCC_data)
dim(vehSubSetSCC_data)
names(vehSubSetSCC_data)
names(vehSubSetSCC_data)[names(vehSubSetSCC_data)== "vehSubSetSCC_data"]<- "SCC"

vehSCCinNEI_data<- NEI_data[NEI_data$SCC %in% vehSubSetSCC_data$SCC,]
dim(vehSCCinNEI_data)
head(vehSCCinNEI_data)

emVehBC<- vehSCCinNEI_data[vehSCCinNEI_data$fips=="24510",]
dim(emVehBC)
emVehBC_yearly<- aggregate(emVehBC$Emissions ~ year +fips, emVehBC,sum)
dim(emVehBC_yearly)
View(emVehBC_yearly)
names(emVehBC_yearly)
names(emVehBC_yearly)[names(emVehBC_yearly)=="emVehBC$Emissions"]<-"Emissions"

emVehLA<- vehSCCinNEI_data[vehSCCinNEI_data$fips=="06037",]
dim(emVehLA)
View(emVehLA)
emVehLA_yearly<- aggregate(emVehLA$Emissions ~ year + fips, emVehLA,sum)
dim(emVehLA_yearly)
View(emVehLA_yearly)
names(emVehLA_yearly)
names(emVehLA_yearly)[names(emVehLA_yearly)=="emVehLA$Emissions"]<-"Emissions"

emVehBCLA<-rbind(emVehBC_yearly,emVehLA_yearly)
dim(emVehBCLA)
View(emVehBCLA)

png(filename = "plot6.png")
ggplot(emVehBCLA,aes(x=factor(year),y=round(Emissions/1000,3),label=round(Emissions/1000,3),fill=fips))+
  geom_bar(stat="identity", position = "dodge")+
  ylab(" Emissions in kilotons")+
  xlab("Year")+
  geom_label(color="black",fontface="bold")+
  theme(legend.position = "top")+
  ggtitle("Los Angeles(fips=06037) vs Baltimore (fips=24510)
          Vehicle Emissions: 1999-2008")
dev.off()
