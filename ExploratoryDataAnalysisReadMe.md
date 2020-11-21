## Introduction

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

Questions
You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## The data
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment [29Mb]
The zip file contains two files:

PM2.5 Emissions Data (\color{red}{\verb|summarySCC_PM25.rds|}summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

* fips: A five-digit number (represented as a string) indicating the U.S. county. The two we are interested in are Baltimore City fips="24510" and Los Angeles fips="06037"

* SCC: The name of the source as indicated by a digit string (see source code classification table)

* Pollutant: A string indicating the pollutant

* Emissions: Amount of PM2.5 emitted, in tons

* type: The type of source (point, non-point, on-road, or non-road)

* year: The year of emissions recorded

Source Classification Code Table Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source "10100101" is known as "Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal".

## Read Data
The data collections that are need to be read into R and named (either NEI / NEI_data and SCC / SCC_data based on the code)

## Subset of data 
Subsets of the two data collections need to be created for each question.

## Aggregate subset data
Each question is looking at the period of 1999-2008. The subsetted data needs to be agregated to show the results for the stated years.

## Ansers, Codes and Plots
<li><b>Question 1 Answers:</b> Total emissions from PM2.5 have decreased in the United States from 1999 to 2008.</li>
* 'Plot1.R' code for downloading and subsetting data. Then creating a bar chart with said data
* `plot1.png` PNG file with bar chart of PM2.5 Emissions 1999-2008

<li><b>Question 2 Answers:</b> Total emissions have decreased in Baltimore between 1999 and 2008. However, 2005 saw an increase compared to 2002.</li> 
* 'Plot2.R' code for downloading and subsetting data. Then creating a bar chart with said data
* `plot2.png` PNG file with bar chart of Baltimore City PM2.5 Emissions 1999-2008

<li><b>Question 3 Answers:</b> All types, except On Road, saw decreases between 1999 and 2008.</li>
* 'Plot3.R' code for downloading and subsetting data. Then creating a line chart using ggplot2
with said data
* `plot3.png` PNG file with line chart of Baltimore City PM2.5 Emissions by Type 1999-2008

<li><b>Question 4 Answer:</b> Coal emissions across the US between 1999-2005 were relatively consisted. However, there was a significant drop in emissions in 2008.</li>
* 'Plot4.R' code for downloading and subsetting data. Then creating a bar chart
with said data
* `plot4.png` PNG file with bar chart of US Coal Combustion Emissions 1999-2008 

<li><b>Question 5 Answer:</b> Baltimore has seen a decrease in vehicle emissions during the period 1999-2008.</li>
* 'Plot5.R' code for downloading and subsetting data. Then creating a bar chart with said data
* `plot5.png` PNG file with bar chart of Baltimore City Vehicle Emissions 1999-2008

<li><b>Question 6 Answer:</b> Baltimore has seen greater change than Los Angeles. Moreover, Baltimore saw a decrease whereas Los Angeles saw and increase in emissions over the period 1999-2008.</li>
* 'Plot6.R' code for downloading and subsetting data. Then creating a cluster bar chart with said data
* `plot6.png` PNG file with bar chart of Los Angeles vs Baltimore Vehicle Emissions 1999-2008
