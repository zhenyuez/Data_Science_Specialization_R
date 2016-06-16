NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)

veh <- subset(SCC, grepl("Vehicles", EI.Sector) | grepl("Vehicles", Short.Name))
veh_dat <- subset(NEI, (fips == "24510"|fips=="06037") & NEI$SCC %in% veh$SCC)

veh_dat <- transform(veh_dat, region = 
                       ifelse(fips == "24510", "Baltimore City", "LA County"))
library(plyr)
dat <- ddply(veh_dat, .(year, region), function(x) sum(x$Emissions))

names(dat) <- c("Year", "Region", "Emissions")
head(dat)

p<-ggplot(data = dat, aes(x=Year, y=Emissions,color=Region, group=Region))+ 
  geom_line()+
  ggtitle("Total Emissions from PM2.5 from Motor Vehicles Baltimore vs LA") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions in tonnes")+
  facet_wrap(~ Region, scales = "free")

print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot6.png")
dev.off()
