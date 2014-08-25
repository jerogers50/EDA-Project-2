## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Maryland and On-road data from entire NEI dataset
MD2 <- subset(NEI, fips=='24510' & type=="ON-ROAD")

## Split data by year and sum Emmissions for each of those years
PM25Data <- tapply(MD2$Emissions, MD2$year, sum)

## Plot and save barplot to illustrate trend in Emissions from 1999 t0 2008 for Maryland from motor vehicles
png("Plot5.png")
barplot(PM25Data, names.arg=names(PM25Data), col="yellow",
        main='Total Emissions from Motor Vehicle Sources in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))
dev.off()