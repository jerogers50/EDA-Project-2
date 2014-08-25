## Compare emissions from motor vehicle sources in Baltimore City with emissions from
## motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city 
## has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Maryland and On-road data from entire NEI dataset
MD2 <- subset(NEI, fips=='24510' & type=="ON-ROAD")
CA2 <- subset(NEI, fips=='06037' & type=="ON-ROAD")

## Split MD2 and CA2 data by year and sum Emmissions for each of those years 
MD2DataFrame <- aggregate(MD2[, 'Emissions'], by=list(MD2$year), sum)
colnames(MD2DataFrame) <- c('Year', 'Emissions')
MD2DataFrame$City <- paste(rep('MD', 4))

CA2DataFrame <- aggregate(CA2[, 'Emissions'], by=list(CA2$year), sum)
colnames(CA2DataFrame) <- c('Year', 'Emissions')
CA2DataFrame$City <- paste(rep('CA', 4))

## Combine split MD2 and CA2 data to form new dataframe
NewDF <- as.data.frame(rbind(MD2DataFrame, CA2DataFrame))

## Plot and save line qplot to illustrate and compare trend in on-road sources with Emissions 
## from 1999 to 2008 for Maryland and California
png('Plot6.png')

p <- qplot(Year, Emissions, data=NewDF, geom="line", color=City, facets=.~ City) + 
  ggtitle(expression("CA vs. MD Total Emissions From Motor Vehicles")) + 
  xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(p)
dev.off()