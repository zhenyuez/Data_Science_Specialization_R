NEI <- readRDS("~/data/R/summarySCC_PM25.rds")
SCC <- readRDS("~/data/R/Source_Classification_Code.rds")
emi_year <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)

names(emi_year) <- c("Year", "Emissions")
emi_year$Year <- as.numeric(emi_year$Year)
p <- plot(emi_year$Year, emi_year$Emissions/10^6, type = "l", 
          main = "Total Emissions from PM2.5 in the US",
          xlab = "Year", 
          ylab = "Total PM2.5 Emissions in million tonnes",pch=8)
print(p)
setwd("~/data-science-coding/R/explore-A2")
dev.copy(png, file = "plot1.png")
dev.off()

