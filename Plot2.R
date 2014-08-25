## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Maryland data from entire NEI dataset
MD <- subset(NEI, fips=='24510')

## Split data by year and sum Emmissions for each of those years
PM25Data <- tapply(MD$Emissions, MD$year, sum)

## Plot and save barplot to illustrate trend in emissions from 1999 t0 2008 for Maryland
png("Plot2.png")
barplot(PM25Data, names.arg=names(PM25Data), col="blue",
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))
dev.off()