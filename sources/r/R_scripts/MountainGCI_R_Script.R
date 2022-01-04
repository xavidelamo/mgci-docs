#Mountain GCI project - R script
#Authors: Vignesh Kamath, Corinna Ravilious, Boipelo Tshwene-Mauchaza, Cristina Telhado and Valerie Kapos, UNEP-WCMC
#FOR QUESTIONS CONTACT CORINNA RAVILIOUS corinna.ravilious@UNEP-WCMC.org
#24-12-2021

################################################
############ REQUIRED PACKAGES #################
################################################

##Install packages if required
install.packages("raster")
install.packages("sp")
install.packages("sf")
install.packages("tidyverse")
install.packages("ncdf4")
install.packages("rgdal")
install.packages("rgeos")
install.packages("dismo")

##Load necessary libraries
library(raster)
library(sp)
library(sf)
library(tidyverse)
library(ncdf4)
library(rgdal)
library(rgeos)
library(dismo)

##Set working directory to data folder
setwd ("C:/this_is_the_path/to_my_working_directory") #replace the dummy path with the path to your working folder

################################################
######### AREA OF INTEREST SELECTION ###########
################################################

##Select area of interest and define projection#

##Input data
aoi <- st_read("C:/this_is_the_path/to_my_boundary_layer.shp")  #replace with path to polygon shapefile representing the boundary of your area of interest

##Project to equal area projection - replace the projection for your study area 
##For this example, we have defined a custom Lambert Azimuthal Equal Area projection with the central meridian set to -84 and the latitude of origin to 8.5
crs_laea <-"+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"
aoi_laea <- st_transform(aoi, crs=crs_laea)

##Create a buffer of 10 km around the area of interest
aoi_buffer <- st_buffer(aoi_laea, 10000)

##Create grids for the boundary layer
##Input boundary shapefile
aoi_ogr <- readOGR("C:/this_is_the_path/to_my_boundary_layer.shp")

##Create an empty raster with extent equal to the country boundary
grid <- raster(extent(aoi_ogr))

#Select the resolution of grids in degrees
res(grid) <- 1

##Ensure that the grid has the same coordinate reference system (CRS) as the boundary layer
proj4string(grid)<-proj4string(aoi_ogr)

## Transform the raster into a polygon
gridpolygon <- rasterToPolygons(grid)

##Intersect the grid with boundary layer
aoi.grid <- intersect(aoi_ogr, gridpolygon)

##Plot the grids
plot(aoi.grid)

##Add new attribute data for each tile of the grid
aoi.grid$grid <- 1:nrow(aoi.grid)

##Save file
writeOGR(aoi.grid, dsn=getwd(), layer="grid", driver="ESRI Shapefile", overwrite_layer=T)

##Input the boundary layer with grids
aoi_grid <- st_read("grid.shp")

##Project to equal area projection 
aoi_grid_laea <- st_transform(aoi_grid, crs=crs_laea)

################################################
############ VEGETATION DESCRIPTOR #############
################################################

###Preparation of vegetation descriptor layer###

##If your dataset is in tif format
##Input the LULC layer
lulc <- raster("C:/this_is_the_path/to_my_LULC_file.tif")

##If your dataset is in netCDF(.nc) format
##input the .nc file and select the required layer. In this example, select the lccs_class layer
#lulc <- raster("C:/this_is_the_path/to_my_LULC_file.nc", varname="lccs_class") 

##Check if LULC layer is correctly overlaying the country boundary 
plot(lulc)
plot(aoi_laea, add=T, col=NA)

##Check projection of LULC layer
lulc

##Project to equal area projection depending on your study area 
lulc <- projectRaster(lulc, crs=crs_laea, method = "ngb")

#writeRaster(DEM_laea, paste0("working_folder/lulc.tif"), overwrite=T)
#lulc <- raster("working_folder/lulc.tif")

##If LULC raster is a global/regional dataset, it needs to be clipped to the area of interest (skip this step for national datasets) 
##Clip the DEM to the buffered area of interest 
lulc_aoi <- lulc %>%
  crop(aoi_buffer) %>%
  mask(aoi_buffer)

##Plot the raster
plot(lulc_aoi)

##If the input LULC layer is a vector

##Input the LULC layer
#lulc_vect <- st_read("C:/this_is_the_path/to_my_LULC_layer.shp")

##If the dataset is not already in an equal area projection, project to equal area projection depending on your study area 
#lulc_vect <- st_transform(lulc, crs=crs_laea)

##Convert vector to raster
##Create a template raster with the required resolution (needs to be determined), extent and projection (same as input layer)
#raster_template <- raster(extent(lulc_vect), resolution = 0.05, crs = st_crs(lulc_vect)$wkt)
##Convert vector to raster
#lulc <- rasterize(lulc_vect, raster_template)

##Reclassify to IPCC landcover types
m <- c(50,1, 60,1, 61,1, 62,1, 70,1, 71,1, 72,1, 80,1, 81,1, 82,1, 90,1, 100,1, ##forest
       110,2, 120,2, 121,2, 122,2,  130,2, 140,2, ##grassland
       10,3, 11,3, 12,3, 20,3, 30,3, 40,3, ##cropland
       160,4, 170,4, 180,4, ##wetland
       190,5, ##settlement
       150,6, 151,6, 152,6, 153,6, 200,6, 201,6, 202,6, 210,6, 220,6) ##other land
rclmat <- matrix(m, ncol=2, byrow=TRUE)

lulc_ipcc <- reclassify(lulc_aoi, rclmat, include.lowest=TRUE)

#writeRaster(lulc_ipcc, paste0("working_folder/VegetationDescriptor_LAEA.tif"), overwrite=T)

#Clip layer to country boundary
lulc_ipcc <- lulc_ipcc %>% 
  crop(aoi_laea) %>%
  mask(aoi_laea)

##Plot the vegetation descriptor layer with the country boundary
plot(lulc_ipcc)
plot(aoi_laea, add=T, col=NA)

################################################
############# MOUNTAIN DESCRIPTOR ##############
################################################

####Preparation of mountain descriptor layer####

##Input the DEM raster
DEM <- raster("C:/this_is_the_path/to_my_DEM_layer.tif") 

##If you have multiple raster tiles (please ensure that the origin coordinates of the raster tiles are aligned properly)
##import all raster files in the folder as a list
#DEM_rastlist <- list.files(path="C:/this_is_the_path/to_my_DEM_folder", pattern='tif$', full.names=TRUE)
#DEM_allrasters <- lapply(DEM_rastlist, raster)
##merge all the tiles in the list
#DEM_allrasters$filename <- "working_folder/DEM_merged.tif" 
#DEM <- do.call(merge, DEM_allrasters)
#plot(DEM) ##to check if they have been merged correctly

##Clip the DEM to area of interest after projecting to equal area projection
DEM_laea <- projectRaster(DEM,crs=crs_laea,method = "bilinear")
DEM_aoi_laea <- DEM_laea %>%
  crop(aoi_buffer) %>%
  mask(aoi_buffer)

plot(DEM_aoi_laea)

##############
##Generate local elevation range

for(i in 1:nrow(aoi_grid_laea))
{
  aoi_laea_grid <- aoi_grid_laea %>%
    filter(grid==i)
  
  ##Create a buffer of 10 km around the area of interest
  aoi_buffer_grid <- st_buffer(aoi_laea_grid, 10000)
  
  DEM_aoi_laea_grid <- DEM_laea %>%
    crop(aoi_buffer_grid) %>%
    mask(aoi_buffer_grid)
  
  ##Create a circular filter of 7 km
  cf <- focalWeight(DEM_aoi_laea_grid, 7000, "circle")
  cf[cf > 0] <- 1
  
  ##Generate focal maximum elevation
  focalMax <- focal(DEM_aoi_laea_grid, w=cf, fun=max)   
  #writeRaster(focalMax, paste0("working_folder/focalMax.tif"), overwrite=T)
  
  ##Generate focal minimum elevation
  focalMin <- focal(DEM_aoi_laea_grid, w=cf, fun=min)   
  #writeRaster(focalMin, paste0("working_folder/focalMin.tif"), overwrite=T)
  
  ##Generate focal range
  aoi7kmLocalElev_grid <- focalMax - focalMin  
  
  ##Clip to tile boundary
  aoi7kmLocalElev_grid <- aoi7kmLocalElev_grid %>%
    crop(aoi_laea_grid) %>%
    mask(aoi_laea_grid)
  
  ##Save file
  writeRaster(aoi7kmLocalElev_grid, paste0("working_folder/focal/aoi7kmLocalElev_",i,".tif"), overwrite=T)
}

##Merge all the tiles together
##import all raster files in the folder as a list
focal_rastlist <- list.files(path="working_folder/focal", pattern='tif$', full.names=TRUE)
focal_allrasters <- lapply(focal_rastlist, raster)
##merge all the tiles in the list
focal_allrasters$filename <- "working_folder/aoi7kmLocalElev.tif" 
aoi7kmLocalElev <- do.call(merge, focal_allrasters)
plot(aoi7kmLocalElev) ##to check if they have been merged correctly

##############

##Clip DEM to country boundary
DEM_aoi_laea <- DEM_laea %>%
  crop(aoi_laea) %>%
  mask(aoi_laea)

##Generate slope
##If your country falls within a single UTM zone & you have used UTM projection in previous steps
#slope_aoi <- terrain(DEM_aoi_laea, opt='slope', unit='degrees')

##Project to Azimuthal equidistant projection
DEM_aeqd <- projectRaster(DEM, crs="+proj=aeqd +lat_0=8.5 +lon_0=-84 +datum=WGS84 +units=m", method = "bilinear")
##Compute slope
slope <- terrain(DEM_aeqd, opt='slope', unit='degrees')
##Project to Lambert equal area projection, mask to the study area and resample
slope_aoi <- slope %>% 
  projectRaster(crs=crs_laea, method="bilinear") %>%
  crop(aoi_laea) %>%
  mask(aoi_laea) %>%
  resample(DEM_aoi_laea,method="bilinear")

writeRaster(slope_aoi, paste0("working_folder/slope.tif"), overwrite=T)
#slope_aoi <- raster("working_folder/slope.tif")

##Generating layers for each Kapos mountain class 
##class 1: DEM_aoi_laea>=4500m, class 2: >=3500 & <4500, class 3: >=2500 & <3500, assign NA to remaining values 
c123 <- reclassify(DEM_aoi_laea, c(4500,Inf,1, 3500,4499.999,2, 2500,3499.999,3, -Inf,2500,NA), include.lowest=TRUE)

##class 4: >=1500 & <2500 & slope>=2
c4 <- DEM_aoi_laea>=1500 & DEM_aoi_laea<2500 & slope_aoi>=2
##assign value 4
m <- c(1,4, 0,NA)
rclmat <- matrix(m, ncol=2, byrow=TRUE)
c4 <- reclassify(c4, rclmat, include.lowest=TRUE)

##class 5: >=1000 & <1500 & slope>=5 OR >=1000 & <1500 & local elevation range >300
c5 <- (DEM_aoi_laea>=1000 & DEM_aoi_laea<1500 & slope_aoi>=5) | (DEM_aoi_laea>=1000 & DEM_aoi_laea<1500 & aoi7kmLocalElev>300)
##assign value 5
m <- c(1,5, 0,NA)
rclmat <- matrix(m, ncol=2, byrow=TRUE)
c5 <- reclassify(c5, rclmat, include.lowest=TRUE)

##class 6: >=300 & <1000 & local elevation range >300
c6 <- DEM_aoi_laea>=300 & DEM_aoi_laea<1000 & aoi7kmLocalElev>300
##assign value 6
m <- c(1,6, 0,NA)
rclmat <- matrix(m, ncol=2, byrow=TRUE)
c6 <- reclassify(c6, rclmat, include.lowest=TRUE)

##Interim mountain layer: mosaic of raster classes 1-6
mt <- mosaic(c123, c4, c5, c6, fun=max)
#plot(mt)

################################################
############# REAL SURFACE AREA ################
################################################

##Generation of real surface area raster from DEM
##using the triangulation method developed by Jeness 2004
##info about the method is available at https://www.fs.fed.us/rm/pubs_other/rmrs_2004_jenness_j001.pdf
##Created by Cristina Telhado UNEP-WCMC
##2021-04-15

##Insert the value of your DEM raster cell size in the same unit as the elevation data
c.size <- res(DEM_aoi_laea)

##Convert the DEM raster to matrix
m <- as.matrix(DEM_aoi_laea)

##This matrix should have the same number of columns and rows of your DEM raster
##you can check if that is correct by typing on the console (you should get the answer TRUE for both queries)
#ncol(DEM_aoi_laea)== ncol(m)
#nrow(DEM_aoi_laea)==nrow(m)

##Separate coordinate information from the raster and assign to a new object called m1
m1 <- rasterToPoints(DEM_aoi_laea) ##this will create an object with three columns: x, y , layer

##Columns x and y have the coordinates of each cell and column layer has the elevation value of each cell
col.X <- as.vector(m1[,1]) ##just the coordinates values from X column 
col.Y <- as.vector(m1[,2]) ##just the coordinates values from Y column

##Calculate the real surface area of each grid cell  
##uses function surfaceArea of package sp
rsa <- surfaceArea(m, cellx = c.size, celly = c.size, byCell = TRUE) 

##Combine matrix with real surface area and object with XY columns
m2 <- as.vector(t(rsa))
m2_na <- na.omit(m2)
m3 <- data.frame(col.X, col.Y, m2_na)

##Convert matrix back to raster
names(m3) <- c("x", "y", "real_surface_area") ##rename columns to match raster needs
rsa_raster <- rasterFromXYZ(m3) ##convert data.frame to raster
crs(rsa_raster) <- crs(DEM_aoi_laea) ##adopt projection from original raster

##Clip layer to country boundary
rsa_raster <- rsa_raster %>%
  crop(aoi_laea) %>%
  mask(aoi_laea)

#writeRaster(rsa_raster, paste0("working_folder/rsa.tif"), overwrite=T)

################################################
############## MGCI CALCULATION ################
################################################

##Compare resolutions of rsa, Mountain and Vegetation layers

##Compare resolutions and aggregate & resample rsa, vegetation descriptor and mountain descriptor layers
if(xres(DEM_aoi_laea)!=xres(lulc_ipcc))
{
  if(xres(DEM_aoi_laea)<xres(lulc_ipcc))       ##DEM is finer than Vegetation layer
  {
    rsa_resampled <- rsa_raster %>%  ##aggregate rsa using sum function
      aggregate(fact=(as.integer(xres(lulc_ipcc)/xres(DEM_aoi_laea))),fun=sum)
    
    mt_resampled <- mt %>%  ##aggregate mountain layer using modal function
      aggregate(fact=(as.integer(xres(lulc_ipcc)/xres(DEM_aoi_laea))),fun=modal) %>%
      resample(rsa_resampled,method="ngb")
    
    lulc_ipcc_resampled <- lulc_ipcc  %>%  ##resample
      resample(mt_resampled,method="ngb")
  }
  else                             ##DEM is coarser than Vegetation layer
  {
    lulc_ipcc_resampled <- lulc_ipcc  %>%  ##aggregate vegetation layer using modal function
      aggregate(fact=(as.integer(xres(DEM_aoi_laea)/xres(lulc_ipcc))),fun=modal)
    
    mt_resampled <- mt %>% ##resample mountain layer
      resample(lulc_ipcc_resampled,method="ngb")
    
    rsa_resampled <- rsa_raster %>%  ##resample rsa
      resample(lulc_ipcc_resampled,method="bilinear")
  }
}

##Combine vegetation and mountain classes into single layer 
combined_veg_mt_aoi <- lulc_ipcc_resampled*10 + mt_resampled

##Zonal statistics: Real surface area
rsa_area <- zonal(rsa_resampled, combined_veg_mt_aoi, fun='sum', na.rm=T)

##Zonal statistics: Planimetric area
grid <- raster(combined_veg_mt_aoi) ##create a template raster
values(grid) <- xres(combined_veg_mt_aoi)*yres(combined_veg_mt_aoi) ##assign cell value = cell area
plan_area <-zonal(grid, combined_veg_mt_aoi, fun='sum', na.rm=T)

##Generate summary tables

##Edit the following variables with inputs relevant to your data
GeoAreaCode <- "188" ##Please enter the country code (you can find it here: https://github.com/dfguerrerom/wcmc-mgci/blob/main/sources/qgis/QGIS_models/country_lut.csv)
GeoAreaName <- "Costa Rica" ##Please enter the name of the country or region
TimePeriod <- "y2018" ##Please enter the year in question for which the analysis is done in the following format: yXXXX
Source <- "UNEP-WCMC" ##Please insert the name of the institution you belong to
Nature <- "G" ##This should be 'G' if the data used to compute the index is global or C if you have used your own data (you have uploaded your own land cover map)

##A. Summary tables for planimetric area

##1. Total mountain area (planimetric area)

##Create a dataframe and enter column names
ER_MTN_TOTL <- data.frame("Indicator"="15.4.2",
                          "SeriesID"="",
                          "SeriesDescription"="Mountain area (square kilometers)",	
                          "GeoAreaCode"=GeoAreaCode,	
                          "GeoAreaName"=GeoAreaName,	
                          "TimePeriod"=TimePeriod,
                          "Time_Detail"=TimePeriod,	
                          "Source"=Source,	
                          "Footnote"="",	
                          "Nature"=Nature,	
                          "Units"="SQKM",	
                          "Reporting"="G",	
                          "SeriesCode"="ER_MTN_TOTL",
                          "MountainClass"=rep(c("C1", "C2", "C3", "C4", "C5", "C6"),each=6),	
                          "LULC_Class"=rep(c("Forest", "Grassland", "Cropland", "Wetland", "Settlement", "Other land"),times=6))

plan_area <- plan_area %>% 
  as.data.frame()  %>% 
  mutate(Value=sum/1000000) %>% ##convert values to sqkm
  add_column("MountainClass"="", "LULC_Class"="") ##add new columns

##Enter the mountain and LULC class for each zone
for(i in 1:nrow(plan_area)) {
  if(substr(plan_area$zone[i],1,1)=="1")
    plan_area$LULC_Class[i]="Forest"
  if(substr(plan_area$zone[i],1,1)=="2")
    plan_area$LULC_Class[i]="Grassland"
  if(substr(plan_area$zone[i],1,1)=="3")
    plan_area$LULC_Class[i]="Cropland"
  if(substr(plan_area$zone[i],1,1)=="4")
    plan_area$LULC_Class[i]="Wetland"
  if(substr(plan_area$zone[i],1,1)=="5")
    plan_area$LULC_Class[i]="Settlement"
  if(substr(plan_area$zone[i],1,1)=="6")
    plan_area$LULC_Class[i]="Other land" 
  
  if(substr(plan_area$zone[i],2,2)=="1")
    plan_area$MountainClass[i]="C1"
  if(substr(plan_area$zone[i],2,2)=="2")
    plan_area$MountainClass[i]="C2"
  if(substr(plan_area$zone[i],2,2)=="3")
    plan_area$MountainClass[i]="C3"
  if(substr(plan_area$zone[i],2,2)=="4")
    plan_area$MountainClass[i]="C4"
  if(substr(plan_area$zone[i],2,2)=="5")
    plan_area$MountainClass[i]="C5"
  if(substr(plan_area$zone[i],2,2)=="6")
    plan_area$MountainClass[i]="C6"
}

ER_MTN_TOTL <- plan_area %>%
  select(-sum, -zone) %>% ##drop unwanted columns
  right_join(ER_MTN_TOTL, by=c("MountainClass","LULC_Class")) ##add the values to the dataframe

##Replace NA values with "N"
ER_MTN_TOTL$Value[is.na(ER_MTN_TOTL$Value)] <- "N"

ER_MTN_TOTL <- ER_MTN_TOTL[, c(4,5,6,7,8,9,10,1,11,12,13,14,15,16,2,3)] ##reorder columns

write_csv(ER_MTN_TOTL, paste0("working_folder/ER_MTN_TOTL_",GeoAreaCode,".csv"))

##2. Mountain Green cover area summary (planimetric area)

##Create a dataframe and enter column names
ER_MTN_GRNCOV <- data.frame("Indicator"="15.4.2",
                            "SeriesID"="",
                            "GeoAreaCode"=GeoAreaCode,	
                            "GeoAreaName"=GeoAreaName,	
                            "TimePeriod"=TimePeriod,
                            "Time_Detail"=TimePeriod,	
                            "Source"=Source,	
                            "Footnote"="",	
                            "Nature"=Nature,	
                            "Units"="SQKM",	
                            "Reporting"="G",	
                            "SeriesCode"=rep(c("ER_MTN_GRNCOV", "ER_MTN_TOTL"),times=6),
                            "MountainClass"=rep(c("C1", "C2", "C3", "C4", "C5", "C6"),each=2))

##Group and summarize by MountainClass to get Total Mountain area
group <- ER_MTN_TOTL %>% 
  group_by(MountainClass, SeriesCode) %>% 
  summarise(Value1=sum(as.numeric(Value),na.rm=T))

group <- group %>%  
  mutate(SeriesDescription1="Mountain area (square kilometers)")    ##Enter SeriesDescription value

ER_MTN_GRNCOV <- group %>%
  right_join(ER_MTN_GRNCOV, by=c("MountainClass","SeriesCode"))  ##add the values to the dataframe

##Drop non-green landcover data
GRNCOV <- ER_MTN_TOTL %>%
  subset(LULC_Class!="Settlement" & LULC_Class!="Other land")

##Group and summarize by MountainClass to get Mountain Green Cover Area
group <- GRNCOV %>% 
  group_by(MountainClass) %>% 
  summarise(Value2=sum(as.numeric(Value),na.rm=T)) %>%
  mutate(SeriesCode="ER_MTN_GRNCOV")

group <- group %>%
  mutate(SeriesDescription2="Mountain green cover area (square kilometers)") ##Enter SeriesDescription value

ER_MTN_GRNCOV <- group %>%
  right_join(ER_MTN_GRNCOV, by=c("MountainClass","SeriesCode"))  ##add the values to the dataframe

ER_MTN_GRNCOV <- ER_MTN_GRNCOV %>% 
  unite("Value", Value1, Value2, na.rm=T) %>% ##combine values in the two columns
  unite("SeriesDescription", SeriesDescription1, SeriesDescription2, na.rm=T)

##Replace 0 values with "N"
ER_MTN_GRNCOV$Value[as.numeric(ER_MTN_GRNCOV$Value)==0] <- "N"

ER_MTN_GRNCOV <- ER_MTN_GRNCOV[, c(5,6,4,7,8,9,2,10,11,12,13,14,15,3,1)] ##reorder columns

write_csv(ER_MTN_GRNCOV, paste0("working_folder/ER_MTN_GRNCOV_",GeoAreaCode,".csv"))

##3. Mountain Green Cover index summary (planimetric area)

##Create a dataframe and enter column names
ER_MTN_GRNCVI <- data.frame("Indicator"="15.4.2",
                            "SeriesID"="",
                            "SeriesDescription"="Mountain Green Cover Index",	
                            "GeoAreaCode"=GeoAreaCode,	
                            "GeoAreaName"=GeoAreaName,	
                            "TimePeriod"=TimePeriod,
                            "Value"="",
                            "Time_Detail"=TimePeriod,	
                            "Source"=Source,	
                            "Footnote"="",	
                            "Nature"=Nature,	
                            "Units"="INDEX",	
                            "Reporting"="G",	
                            "SeriesCode"="ER_MTN_GRNCVI",
                            "MountainClass"=c("C1", "C2", "C3", "C4", "C5", "C6"))

for(val in c("C1", "C2", "C3", "C4", "C5", "C6"))
{
  temp <- ER_MTN_GRNCOV %>% 
    filter(MountainClass==val)
  
  ##Compute Mountain Green Cover Index
  ER_MTN_GRNCVI$Value[ER_MTN_GRNCVI$MountainClass==val] <- (as.numeric(temp$Value[temp$SeriesCode=="ER_MTN_GRNCOV"])/as.numeric(temp$Value[temp$SeriesCode=="ER_MTN_TOTL"]))*100
}

##Replace NA values with "N"
ER_MTN_GRNCVI$Value[is.na(ER_MTN_GRNCVI$Value)] <- "N"

write_csv(ER_MTN_GRNCVI, paste0("working_folder/ER_MTN_GRNCVI_",GeoAreaCode,".csv"))

##B. Summary tables for Real Surface Area
##1. Total mountain area (Real Surface Area)

##Create a dataframe and enter column names
ER_MTN_TOTL_rsa <- data.frame("Indicator"="15.4.2",
                              "SeriesID"="",
                              "SeriesDescription"="Mountain area (square kilometers)",	
                              "GeoAreaCode"=GeoAreaCode,	
                              "GeoAreaName"=GeoAreaName,	
                              "TimePeriod"=TimePeriod,
                              "Time_Detail"=TimePeriod,	
                              "Source"=Source,	
                              "Footnote"="",	
                              "Nature"=Nature,	
                              "Units"="SQKM",	
                              "Reporting"="G",	
                              "SeriesCode"="ER_MTN_TOTL",
                              "MountainClass"=rep(c("C1", "C2", "C3", "C4", "C5", "C6"),each=6),	
                              "LULC_Class"=rep(c("Forest", "Grassland", "Cropland", "Wetland", "Settlement", "Other land"),times=6))

rsa_area <- rsa_area %>%
  as.data.frame()  %>% 
  mutate(Value=sum/1000000) %>% ##convert values to sqkm
  add_column("MountainClass"="", "LULC_Class"="") ##add new columns

##Enter the mountain and LULC class for each zone
for(i in 1:nrow(rsa_area)) {
  if(substr(rsa_area$zone[i],1,1)=="1")
    rsa_area$LULC_Class[i]="Forest"
  if(substr(rsa_area$zone[i],1,1)=="2")
    rsa_area$LULC_Class[i]="Grassland"
  if(substr(rsa_area$zone[i],1,1)=="3")
    rsa_area$LULC_Class[i]="Cropland"
  if(substr(rsa_area$zone[i],1,1)=="4")
    rsa_area$LULC_Class[i]="Wetland"
  if(substr(rsa_area$zone[i],1,1)=="5")
    rsa_area$LULC_Class[i]="Settlement"
  if(substr(rsa_area$zone[i],1,1)=="6")
    rsa_area$LULC_Class[i]="Other land" 
  
  if(substr(rsa_area$zone[i],2,2)=="1")
    rsa_area$MountainClass[i]="C1"
  if(substr(rsa_area$zone[i],2,2)=="2")
    rsa_area$MountainClass[i]="C2"
  if(substr(rsa_area$zone[i],2,2)=="3")
    rsa_area$MountainClass[i]="C3"
  if(substr(rsa_area$zone[i],2,2)=="4")
    rsa_area$MountainClass[i]="C4"
  if(substr(rsa_area$zone[i],2,2)=="5")
    rsa_area$MountainClass[i]="C5"
  if(substr(rsa_area$zone[i],2,2)=="6")
    rsa_area$MountainClass[i]="C6"
}

ER_MTN_TOTL_rsa <- rsa_area %>%
  select(-sum, -zone) %>% ##drop unwanted columns
  right_join(ER_MTN_TOTL_rsa, by=c("MountainClass","LULC_Class")) ##add the values to the dataframe

##Replace NA values with "N"
ER_MTN_TOTL_rsa$Value[is.na(ER_MTN_TOTL_rsa$Value)] <- "N"

ER_MTN_TOTL_rsa <- ER_MTN_TOTL_rsa[, c(4,5,6,7,8,9,10,1,11,12,13,14,15,16,2,3)] ##reorder columns

write_csv(ER_MTN_TOTL_rsa, paste0("working_folder/ER_MTN_TOTL_",GeoAreaCode,"_rsa.csv"))

##2. Mountain Green cover area summary (Real Surface Area)

##Create a dataframe and enter column names
ER_MTN_GRNCOV_rsa <- data.frame("Indicator"="15.4.2",
                                "SeriesID"="",
                                "GeoAreaCode"=GeoAreaCode,	
                                "GeoAreaName"=GeoAreaName,	
                                "TimePeriod"=TimePeriod,
                                "Time_Detail"=TimePeriod,	
                                "Source"=Source,	
                                "Footnote"="",	
                                "Nature"=Nature,	
                                "Units"="SQKM",	
                                "Reporting"="G",	
                                "SeriesCode"=rep(c("ER_MTN_GRNCOV", "ER_MTN_TOTL"),times=6),
                                "MountainClass"=rep(c("C1", "C2", "C3", "C4", "C5", "C6"),each=2))

##Group and summarize by MountainClass to get Total Mountain area
group <- ER_MTN_TOTL_rsa %>% 
  group_by(MountainClass, SeriesCode) %>% 
  summarise(Value1=sum(as.numeric(Value),na.rm=T))

group <- group %>%  
  mutate(SeriesDescription1="Mountain area (square kilometers)")    ##Enter SeriesDescription value

ER_MTN_GRNCOV_rsa <- group %>%
  right_join(ER_MTN_GRNCOV_rsa, by=c("MountainClass","SeriesCode"))  ##add the values to the dataframe

##Drop non-green landcover data
GRNCOV <- ER_MTN_TOTL_rsa %>%
  subset(LULC_Class!="Settlement" & LULC_Class!="Other land")

##Group and summarize by MountainClass to get Mountain Green Cover Area
group <- GRNCOV %>% 
  group_by(MountainClass) %>% 
  summarise(Value2=sum(as.numeric(Value),na.rm=T)) %>%
  mutate(SeriesCode="ER_MTN_GRNCOV")

group <- group %>%
  mutate(SeriesDescription2="Mountain green cover area (square kilometers)") ##Enter SeriesDescription value

ER_MTN_GRNCOV_rsa <- group %>%
  right_join(ER_MTN_GRNCOV_rsa, by=c("MountainClass","SeriesCode"))  ##add the values to the dataframe

ER_MTN_GRNCOV_rsa <- ER_MTN_GRNCOV_rsa %>% 
  unite("Value", Value1, Value2, na.rm=T) %>% ##combine values in the two columns
  unite("SeriesDescription", SeriesDescription1, SeriesDescription2, na.rm=T)

##Replace 0 values with "N"
ER_MTN_GRNCOV_rsa$Value[as.numeric(ER_MTN_GRNCOV_rsa$Value)==0] <- "N"

ER_MTN_GRNCOV_rsa <- ER_MTN_GRNCOV_rsa[, c(5,6,4,7,8,9,2,10,11,12,13,14,15,3,1)] ##reorder columns

write_csv(ER_MTN_GRNCOV_rsa, paste0("working_folder/ER_MTN_GRNCOV_",GeoAreaCode,"_rsa.csv"))

##3. Mountain Green Cover index summary (Real Surface Area)

##Create a dataframe and enter column names
ER_MTN_GRNCVI_rsa <- data.frame("Indicator"="15.4.2",
                                "SeriesID"="",
                                "SeriesDescription"="Mountain Green Cover Index",	
                                "GeoAreaCode"=GeoAreaCode,	
                                "GeoAreaName"=GeoAreaName,	
                                "TimePeriod"=TimePeriod,
                                "Value"="",
                                "Time_Detail"=TimePeriod,	
                                "Source"=Source,	
                                "Footnote"="",	
                                "Nature"=Nature,	
                                "Units"="INDEX",	
                                "Reporting"="G",	
                                "SeriesCode"="ER_MTN_GRNCVI",
                                "MountainClass"=c("C1", "C2", "C3", "C4", "C5", "C6"))

for(val in c("C1", "C2", "C3", "C4", "C5", "C6"))
{
  temp <- ER_MTN_GRNCOV_rsa %>% 
    filter(MountainClass==val)
  
  ##Compute Mountain Green Cover Index
  ER_MTN_GRNCVI_rsa$Value[ER_MTN_GRNCVI_rsa$MountainClass==val] <- (as.numeric(temp$Value[temp$SeriesCode=="ER_MTN_GRNCOV"])/as.numeric(temp$Value[temp$SeriesCode=="ER_MTN_TOTL"]))*100
}

##Replace NA values with "N"
ER_MTN_GRNCVI_rsa$Value[is.na(ER_MTN_GRNCVI_rsa$Value)] <- "N"

write_csv(ER_MTN_GRNCVI_rsa, paste0("working_folder/ER_MTN_GRNCVI_",GeoAreaCode,"_rsa.csv"))
