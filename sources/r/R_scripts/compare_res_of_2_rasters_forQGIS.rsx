##MGCI_beta=group
##Check which Raster has higher resolution=name
##r1_DEMRaster=raster
##r2_LULCRaster=raster
##tab= output table

#Draft script to check if projected DEM raster is higher or lower resolution than projected LULC raster
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

crs(r2_LULCRaster)
r1_DEMRaster_res <- xres(r1_DEMRaster) 
r2_LULCRaster_res <- xres(r2_LULCRaster) 

print (r1_DEMRaster_res)
print (r2_LULCRaster_res)

if(r1_DEMRaster_res >= r2_LULCRaster_res)
  r3<-("demresGTE") else r3<-("demresLT")
print (r3)


df <- data.frame(ID = c(1), Result = c(r3), DEM_res = c(r1_DEMRaster_res), LULC_res = c(r2_LULCRaster_res))
is.data.table(df)
#convert df to table 
tab <- setDT(df)

#view table 
tab

