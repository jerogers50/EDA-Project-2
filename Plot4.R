## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?

library(ggplot2)

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Group Coal combustion-related sources from SCC file
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

## Merge two data sets and split data by years and sum Emissions figures for each year
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')


## Plot and save line qplot to illustrate trend in coal combustion-related emissions from 1999 to 2008
png("Plot4.png")

p <- qplot(Year, Emissions, data=merge.sum, geom="line", color="red") + 
     ggtitle(expression("Total Emissions From Coal Combustion-related Sources")) + 
     xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(p)
dev.off()