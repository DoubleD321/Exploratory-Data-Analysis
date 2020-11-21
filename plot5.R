## Question 5: How have emissions from motor vehicle sources changed from 1999-2008 in
## Baltimore City?
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
emVehBC_yearly<- aggregate(emVehBC$Emissions ~ year, emVehBC,sum)
dim(emVehBC_yearly)
View(emVehBC_yearly)
names(emVehBC_yearly)
names(emVehBC_yearly)[names(emVehBC_yearly)=="emVehBC$Emissions"]<-"Emissions"

png(filename = "plot5.png")
ggplot(emVehBC_yearly,aes(x=factor(year),y=round(Emissions,1),label=round(Emissions,1)))+
  geom_bar(stat="identity")+
  ylab(" Emissions in tons")+
  xlab("Year")+
  geom_label(color="grey",fontface="bold")+
  ggtitle("Baltimore City Vehicle Emissions 1999-2008")
dev.off()
