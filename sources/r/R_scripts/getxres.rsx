##MGCI_beta=group
##GetXres resolution=name
##Raster=raster
##table= output table

#Draft script to get raster xresolution
#Created by Corinna Ravilious UNEP-WCMC
#2023-08-31

#Load necessary libraries
library(rgdal)
library(raster)
library(data.table)

#Set working directory to data folder
setwd("C:/MGCI_DML") #replace the dummy path with the path to your working folder
#r1_DEMRaster <- raster("C:/MGCI_DML/raw_data/global_DEM_mosaics/GMTED_1km_mea30.tif")
#r2_LULCRaster <- raster("C:/MGCI_DML/raw_data/C3S_LC_L4_LCCS_Map_300m_P1Y_2018_v2_1_1/C3S_LC_L4_LCCS_Map_300m_P1Y_2018_v2_1_1.tif")

crs(Raster)
Raster_res <- xres(Raster) 

print (Raster_res)




df <- data.frame(ID = c(1), XRES = c(Raster_res))
is.data.table(df)
#convert df to table 
table <- setDT(df)

#view table 
table

