# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#  Create Data 
BC <- subset(NEI, fips == "24510") 
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()