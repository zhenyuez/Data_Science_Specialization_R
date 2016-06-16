NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)

coal <- subset(SCC, grepl("Coal", EI.Sector) | grepl("Coal", Short.Name))
coal_dat <- subset(NEI, NEI$SCC %in% coal$SCC)
dat <- aggregate(coal_dat$Emissions, list(coal_dat$year), FUN = sum)

names(dat) <- c("Year", "Emissions")
p <- qplot(Year, Emissions/1000, data = dat, geom = "line") + 
  ggtitle("Total Emissions from PM2.5 from Coal in the US") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions in thousand tonnes")

print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot4.png")
dev.off()
