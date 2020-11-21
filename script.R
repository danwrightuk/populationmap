rm(list=ls())
setwd("C:/Users/Danie/Desktop/populationmap/CSV/SP")
library(maps)
library(mapdata)
library(maptools)
library(rgdal)
library(ggmap)
library(ggplot2)
library(rgeos)
library(broom)
library(plyr)

#Get all filenames and read in the postcodes
filenames <- dir("C:/Users/Danie/Desktop/populationmap/CSV/SP/") #get file names
postcodes <- do.call(rbind,lapply(filenames,read.csv,header=FALSE)) #read in all files and bind
postcodes <- postcodes[-which(postcodes$V3 == 0),] #remove lines where V3 is zero

gg <- ggplot() + geom_point(data=postcodes, aes(x=V3, y=V4), color="#ff9900", size=0.2, alpha=0.3)
gg <- gg + coord_fixed(1)
gg <- gg + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
gg <- gg + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
gg <- gg + theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())
gg <- gg + theme(panel.background = element_rect(fill = 'black'))
print(gg)