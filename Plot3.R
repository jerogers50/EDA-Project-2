## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable
##, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
## a plot answer this question.

library(ggplot2)

## Read and assign RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Maryland data from entire NEI dataset
MD <- subset(NEI, fips == "24510")

## Split data by year and type and sum Emmissions for each of those years and types
PM25Data <- tapply(MD$Emissions, MD[,5:6], sum)
PM25DataDF<-data.frame(as.table(PM25Data))
PM25DataDF<-PM25DataDF[c("year", "type", "Freq")]
PM25DataDF$year<-as.numeric(as.character(PM25DataDF$year))

## Plot and save line qplot to illustrate trend in emissions from 1999 to 2008 for Maryland by type
png("Plot3.png", width=480, height=480, units="px")

p <- qplot(year, Freq, data=PM25DataDF, color=type, geom="line") + 
     ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + 
     xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(p)
dev.off()