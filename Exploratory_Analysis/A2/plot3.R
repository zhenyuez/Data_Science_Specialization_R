NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)
Baltimore <- subset(NEI, fips == "24510")
dat <- aggregate(Baltimore$Emissions, list(Baltimore$type, Baltimore$year), 
                     FUN = sum)
names(dat) <- c("Type","Year", "Emissions")
p <- qplot(Year, Emissions, color = Type, data = dat, geom = "path") + 
  ggtitle("Total Emissions from PM2.5 in Baltimore City by Type") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions in tonnes")
print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot3.png")
dev.off()
