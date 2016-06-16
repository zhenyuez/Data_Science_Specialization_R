NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)

veh <- subset(SCC, grepl("Vehicles", EI.Sector) | grepl("Vehicles", Short.Name))
veh_dat <- subset(NEI, fips == "24510" & NEI$SCC %in% veh$SCC)
dat <- aggregate(veh_dat$Emissions, list(veh_dat$year), FUN = sum)

names(dat) <- c("Year", "Emissions")
p <- qplot(Year, Emissions, data = dat, geom = "line") + 
  ggtitle("Total Emissions from PM2.5 from Motor Vehicles in Baltimore") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions in tonnes")

print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot5.png")
dev.off()
