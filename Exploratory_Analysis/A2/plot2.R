NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
Baltimore <- subset(NEI, fips == "24510")
Bal_year <- aggregate(Baltimore$Emissions, list(Baltimore$year), FUN = sum)
names(Bal_year) <- c("Year", "Emissions")
Bal_year$Year <- as.numeric(Bal_year$Year)

p<-plot(Bal_year$Year, Bal_year$Emissions/10^3, type="l",
          main = "Total Emissions from PM2.5 in Baltimore city with zip=24510 ",
          xlab = "Year", pch=16,
          ylab = "Total PM2.5 Emissions in thousand tonnes")

print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot2.png")
dev.off()


