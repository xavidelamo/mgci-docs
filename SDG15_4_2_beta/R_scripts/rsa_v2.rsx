##SDG15_4_2=group
##Create RSA raster=name
##Layer=raster
##Output=output raster

#Draft script to calculate the real surface area from a DEM raster file
#using the triangulation method developed by Jeness 2004
#info about the method is available at https://www.fs.fed.us/rm/pubs_other/rmrs_2004_jenness_j001.pdf
#Created by Cristina Telhado UNEP-WCMC
#2021-04-15


# ###############################################
# ##############   SECTION A.3  #################
# ########### REQUIRED PACKAGES #################
# ###############################################

#load required packages and install if needed
if(!require("sp")) install.packages("sp")
if(!require("raster")) install.packages("raster")
library("raster") ## Corinna added this line
library("tiff") ## Corinna added this line
# ###############################################
# ##############   SECTION A.4  #################
# ######### REQUIRED INPUT AND INFO #############
# ###############################################

#import DEM raster

#for testing purposes use this dummy raster
#and compare result with Jenness 2004
r <- raster(ncol=6, nrow=6)
r[15:17] <- c(190, 170, 155)
r[21:23] <- c(183, 165, 145)
r[27:29] <- c(175, 160, 122)
r[8:12] <- 1
r[14] <- 1
r[18] <- 1
r[20] <- 1
r[24] <- 1
r[26] <- 1
r[30] <- 1
r[32:36] <- 1

r <- Layer ##Corinna changed this to QGIS input from QGIS header added to top of script (originally said replace the dummy path with the file path to your DEM.tif file)
a1 <- nrow(r)+1
print("dem rows")
print(a1)
b1 <- ncol(r)-1
print("dem cols")
print(b1)
print ("rdem")
#print (r)
# # Any indication of projection necessary? 

#insert the value of your DEM raster cell size in the same unit as the elevation data

crs(r)
c.size <- xres(r) 

#c.size <- Cellsize ## Corinna changed this to QGIS input from QGIS header added to top of script

# ###############################################
# ##############   SECTION A.5  #################
# #############  CALCLULATION  ##################
# ###############################################

#step 1 - prepare your DEM raster for the calculation

#1.a - exclude all boundaries cells with no value from DEM raster
#print ("remove NAs")
#r <- trim(r, padding=0, values=NA) # originally said this but QGIS did not like NA : r <- trim(r, padding=0, values=NA)
print ("r")
#print (r)
#print ("removed NAs")
#1.b - remove one row and one column from the top, bottom, left, and right
print("remove one row and one column from the top, bottom, left, and right")
a <- nrow(r)
print("a")
print(a)
b <- ncol(r)
print("b")
print(b)
# use row and column numbers:
print("cropping")
print ("r crop1")
#print (r)
#r1 <- shift(r, dx=1, dy=1)
r<- r [1:a, 1:b, drop=FALSE]
r.cropped <- r [2:a, 2:b, drop=FALSE] 
print("r.cropped")
#print(r.cropped)
print("step1 done")
#step 2 - convert the trimmed DEM raster to matrix

m <- as.matrix(r) # corinna changed this from r to r.cropped
#this matrix should have the same number of columns and rows of your DEM raster
#you can check if that is correct by typing on the console 
print ("this matrix should have the same number of columns and rows of your DEM raster:")
print (ncol(m))
print (nrow(m))
#you should get the answer TRUE for both queries
print("step2 done")
#step 3 - separate coordinate information from cropped raster and assign to a new object called m1
m1 <- rasterToPoints(r.cropped) # this will create an object with three columns: x, y , layer # Corinna cahanged to R instead of r.cropped
print ("m1")
#print (m1)
# columns x and y have the coordinates of each cell and column layer has the elevation value of each cell
col.X <- as.vector(m1[,1]) # just the coordinates values from X column 
col.Y <- as.vector(m1[,2]) # just the coordinates values from Y column
print("step3 done")
#step 4 - calculate the real surface area of each grid cell  
#uses function surfaceArea of package sp
#needs object 'm' created on step 1 and the cell size 'c.size'
rsa <- surfaceArea(m, cellx = c.size, celly = c.size, byCell = TRUE) 
print("RSA")
#print (rsa)
rsa.cropped <- rsa [2:a, 2:b, drop=FALSE]
#rsa.cropped <- rsa [2:a, 2:b, drop=FALSE] ## Corinna comment  - This line does not work in QGIS
#rsa.cropped <- rsa ## Corinna added this only to skip the step above and trouble shoot rest of script
print("step4 done")
print ("rsa")
#print (rsa)
#step 5 - combine matrix with real surface area and object with XY columns
m2 <- as.vector(t(rsa.cropped))#changed from rsa.cropped
print ("m2")
#print (m2)
m3 <- data.frame(col.X, col.Y, m2)
print ("m3")
#print (m3)
print("step5 done")
#step 6 - convert matrix back to raster
names(m3) <- c("x", "y", "real_surface_area") #rename columns to match raster needs
r2 <- rasterFromXYZ(m3) #convert data.frame to raster
crs(r2) <- crs(r) # adopt projection from original raster
# use row and column numbers to crop to exclude bottom row and right hand column as these values will not have been calculated from 8 surrounding cells
print("now cropping outer edge cells")
r3 <- crop(r2, extent(r2, 1,(a-2),1,(b-2)))
print("step6 done")

#step 7 - sum the real surface area of all pixels within the study area
real_surface_area <- cellStats(r2, stat='sum')

print("step7 done")
Output = r3