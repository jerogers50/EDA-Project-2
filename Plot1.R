## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Split data by year and sum Emmissions for each of those years
PM25Data <- tapply(NEI$Emissions, NEI$year, sum)

## Plot and save barplot to illustrate trend in emissions from 1999 t0 2008
png("Plot1.png")
barplot(PM25Data, names.arg=names(PM25Data), col="red",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()