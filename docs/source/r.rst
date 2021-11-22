R-MGCI :sub:`beta`
==================

A R-Software-based tool to support the computation of SDG Indicator 15.4.2 – Mountain Green Cover Index.

General Information
-------------------

About R-MGCI :sub:`beta`
^^^^^^^^^^^^^^^^^^^^^^^^

This tool was developed by the UN Environment Programme World Conservation Monitoring Centre (UNEP-WCMC) in collaboration with the Food and Agriculture Organization (FAO) of the United Nations to support member countries to compute and report against SDG Indicator 15.4.2.

This script has been developed to be run on R 4.1.1 and RStudio 2021.09.0+351 "Ghost Orchid" release. If you are using older versions, it may be good to update them. `R <https://www.r-project.org/>`_ is available as Free Software under the terms of the Free Software Foundation’s GNU General Public License in source code form. It compiles and runs on a wide variety of UNIX platforms and similar systems (including FreeBSD and Linux), Windows and MacOS.

R-MGCI :sub:`beta` is in a beta stage and therefore it is still under development. Please contact the R-MGCI :sub:`beta` development team with any comments or suggestions.


If you have specific bugs to report or improvements to the tool that you would like to suggest, please use the `GitHub’s issue tracker
<https://github.com/dfguerrerom/wcmc-mgci/issues>`_ of the SEPAL-MGCI :sub:`beta` module and do follow the `contribution guidelines
<https://github.com/dfguerrerom/wcmc-mgci/blob/master/CONTRIBUTE.md>`_.

Authors 
^^^^^^^

R-MGCI :sub:`beta` has been developed by the UN Environment Programme World Conservation Monitoring Centre (UNEP-WCMC) in collaboration with the Food and Agriculture Organization (FAO) of the United Nations. Contributors to R-MGCI :sub:`beta` and its documentation include Vignesh Kamath Cannanure, Corinna Ravilious, Boipelo Tshwene-Mauchaza, Cristina Telhado and Valerie Kapos.

License
^^^^^^^
R-MGCI :sub:`beta` and its documentation is made available under the terms of the `Creative Commons Attribution 4.0 International License (CC BY 4.0) <https://creativecommons.org/licenses/by/4.0/>`_.

Background
^^^^^^^^^^

SDG Indicator 15.4.2 – Mountain Green Cover Index (MGCI) is one of the two indicators under SDG Target 15.4, which aims to:

"*ensure the conservation of mountain ecosystems, including their biodiversity, to enhance their capacity to provide benefits which are essential for sustainable development*". 

The Food and Agriculture Organization (FAO) of the United Nations is the custodian agency of this indicator. The Mountain Green Cover Index (MGCI) is designed to measure the extent and the changes of green vegetation in mountain areas to monitor progress towards SDG Target 15.4.

The MGCI is defined as the ratio of the mountain green cover area to the total mountain area:

.. math::
    
    MGCI = (Mountain Green Cover Area)/(Total Mountain Area)

Where: 

- **Mountain Green Cover Area**: sum of mountain area (km :sup:`2`) covered by cropland, grassland, forestland, shrubland and wetland, as defined based on the IPCC classification (Penman et al. 2003). This component is calculated from the vegetation descriptor layer. 
- **Total Mountain Area**: total area (Km2) of mountains. In both the numerator and denominator, mountain area is defined according to Kapos et al. 2000. This component is calculated from the mountain description layer.
- **Vegetation descriptor layer**: The vegetation descriptor layer categorizes land cover into green and non-green areas. Green vegetation includes both natural vegetation and vegetation resulting from anthropic activity (e.g. crops, afforestation, etc.). Non-green areas include very sparsely vegetated areas, bare land, water, permanent ice/snow and urban areas. The vegetation description layer is derived from a land cover map, where land cover categories are classified into IPCC categories and then in green/non-green areas. 
- **Mountain descriptor layer**:  The mountain descriptor layer consists in a map of mountain classes following the UNEP-WCMC classification (Kapos et al. 2000). The UNEP-WCMC classification classifies the world mountain areas according altitude, slope and elevation range into the following categories.

  .. _mountain_classes:
  .. csv-table:: Mountain classes
     :header: "UNEP-WCMC Mountain Class", "Description"
     :widths: auto
     :align: center
  
     "1","Elevation > 4.500 meters"
     "2","Elevation 3.500–4.500 meters"
     "3","Elevation 2.500–3.500 meters"
     "4","Elevation 1.500–2.500 meters and slope >= 2"
     "5","Elevation 1.000–1.500 meters and slope >= 5 or local elevation range (LER 7 kilometer radius) > 300 meters"
     "6","Elevation 300–1.000 meters and local elevation range (7 kilometer radius) > 300 meters"

R-MGCI :sub:`beta` allows the user to compute each of these description layers to then calculate MGCI values for any given area. The results of this analysis can be exported to a set of standardized reporting tables where MGCI values are disaggregated by mountain class and IPCC land category, as specified in the metadata of SDG Indicator 15.4.2.

References
^^^^^^^^^^

- Kapos, V., Rhind, J., Edwards, M., Prince, M., & Ravilious, C. (2000). Developing a map of the world’s mountain forests. In M. F. Price , & N. Butt (Eds.),?Forests in Sustainable Mountain Development: A State-of-Knowledge Report for 2000?(pp. 4-9). Wallingford: CAB International.? 
- Penman, J., Gytarsky, M., Hiraishi, T., Krug, T., Kruger, D., Pipatti, R., Buendia, L., Miwa, K., Ngara, T., Tanabe, K. (2003). Good Practice Guidance for Land Use, Land-use Change and Forestry. Good Practice Guidance for Land Use, Land-use Change and Forestry. 

Before using R-MGCI :sub:`beta`
-------------------------------

To run the this script you will need to have R 4.1.1 and RStudio 2021.09.0+351 "Ghost Orchid" installed. 


.. contents:: **Table of Contents**


Introduction
------------

This tutorial explains in detail how to run the R-MGCI :sub:`beta` step-by-step using Costa Rica as an example. It uses the 90m resolution Digital ELevation Model (DEM) from Copernicus `(COP-DEM_GLO-90) <https://spacedata.copernicus.eu/web/cscda/dataset-details?articleId=394198>`_ to create the mountain descriptor layer and land cover datasets from the  `European Space Agency (ESA) Climate Change Initiative (CCI) land cover datasets <https://maps.elie.ucl.ac.be/CCI/viewer/>`_ to create the vegetation descriptor layer. If using QGIS-MGCI for official purposes, it is recommended that users use nationally appropriate data sources if available. 

The MGCI module has five main steps, and the index will be calculated based on the user inputs:

-  Area of interest selection
-  Vegetation descriptor
-  Mountain descriptor
-  Real surface area
-  MGCI results

Before starting with the steps to calculate MGCI, install and load the required packages, and set your working folder.
This is outlined in the code below.

|image0|

..code-block:: r
    #Install packages if required
    
    install.packages("raster") 
    
    install.packages("sp")
    
    install.packages("sf")
    
    install.packages("tidyverse")
    
    install.packages("ncdf4")
    

    #Load necessary libraries
    
    library(raster)
    
    library(sp)
    
    library(sf)
    
    library(tidyverse)
    
    library(ncdf4)

    #Set working directory to data folder
    
    setwd("C:/this_is_the_path/to_my_working_directory") #replace the dummy path with the path to your working folder;

Define projection and generate an AOI
-------------------------------------
Add a country or area of interest boundary layer. Input a polygon shapefile representing the boundary of your area of interest.

|image1|

.. code-block:: r
   aoi <- st_read("C:/this_is_the_path/to_my_boundary_layer.shp");


The next step is to define a projection for the country boundary. In this example the boundary layer is in Geographic coordinate system (EPSG 4326).

Costa Rica covers more than one UTM Zone so in this example we will define a custom Lambert Azimuthal Equal Area projection with the central meridian set to **-84** and the latitude of origin to **8.5**.

Costa Rica does have a National Projection (see https://epsg.io/5367) which may be an alternative to the Lambert Azimuthal Equal Area.

Replace the projection in the code below to that of your area of interest:

|image2|

.. code-block:: r
   aoi_laea <- st_transform(aoi, crs=("+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"));


Now that the country boundary is in the chosen equal area projection, we can generate a buffer area of 10km around the country boundary/area of interest. A distance of 10km around the bounding box is added to ensure the AOI is large enough to accommodate the 7km focal range function used in the mountain descriptor layer generation.   

|image3|

.. code-block:: r
   aoi_buffer <- st_buffer(aoi_laea, 10000);

Preparation of Vegetation descriptor layer
------------------------------------------

The development of vegetation descriptor layer starts with either a raster or vector landuse landcover (LULC) dataset.

Steps when using a raster dataset
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To demonstrate the steps for processing a raster LULC dataset we will use the Global ESA CCI LULC dataset. Input the LULC layer. If the dataset is in GeoTiff format use the following code:

|image4|

.. code-block:: r
   lulc <- raster("C:/this_is_the_path/to_my_LULC_file.tif");


If the dataset is in netCDF (.nc) format, use the following code (ensure that library(ncdf4) has been loaded). Edit the varname to the name of the required layer.

|image5|

.. code-block:: r
   lulc <- raster("C:/this_is_the_path/to_my_LULC_file.nc", varname="lccs_class");


First check that the LULC layer is correctly overlaying the country boundary data. If it does not, your country boundary and/or your LULC layer may be lacking projection information or have the wrong projection information. 

|image6|

.. code-block:: r
   plot(lulc)
    
   plot(aoi_laea, add=T, col=NA);

Project to equal area projection depending on your study area.

|image7|

.. code-block:: r
   lulc <- projectRaster(lulc, crs="+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs", method = "ngb");


If LULC raster is a global/regional dataset, it needs to be clipped to the area of interest (skip this step for national datasets)

|image8|

.. code-block:: r
   lulc_aoi <- crop(lulc,aoi_buffer);


Steps when using a vector LULC dataset
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, input the LULC dataset in vector format. When using a vector LULC dataset the data will also need to be projected to an equal area projection.  If it is not already in equal area projection, project it to equal area projection depending on your study area.

|image9|

.. code-block:: r
   lulc_vect <- st_read("C:/this_is_the_path/to_my_LULC_layer.shp");

   lulc_vect <- st_transform(lulc, CRS=CRS("+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"));

The next step is to rasterize the LULC data. When converting it is important to choose an output resolution that is appropriate for the scale of the vector dataset (**see section Defining analysis environments and data selection** for more detail). Once the resolution to convert the vector dataset to has been determined the vector dataset can be converted to Raster. First, create a template raster with the required resolution (needs to be determined), extent and projection (same as input layer) and then convert the vector to raster format with resolution, extent and projection same as that of the template raster.

|image10|

.. code-block:: r
   raster_template <- rast(ext(lulc_vect), resolution = 0.05, crs = st_crs(lulc_vect)$wkt)
    
   lulc <- rasterize(vect(lulc_vect), raster_template);

Reclassify to IPCC landcover types
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next step is to reclassify the LULC map prepared in the previous steps into the 6 MGCI vegetation descriptor LULC types. 

Reclassify the LULC types from the ESA CII or National landcover dataset to the 6 IPCC landcover classes (**see section Defining analysis environments and data selection** for more detail)

|image11|

.. code-block:: r
   m <- c(50,1, 60,1, 61,1, 62,1, 70,1, 71,1, 72,1, 80,1, 81,1, 82,1, 90,1, 100,1,
   110,2, 120,2, 121,2, 122,2,  130,2, 140,2, 
   10,3, 11,3, 12,3, 20,3, 30,3, 40,3,
   160,4, 170,4, 180,4, 
   190,5,
   150,6, 151,6, 152,6, 153,6, 200,6, 201,6, 202,6, 210,6, 220,6)
   rclmat <- matrix(m, ncol=2, byrow=TRUE)

    lulc_ipcc <- reclassify(lulc_aoi, rclmat, include.lowest=TRUE);

Plot the vegetation descriptor layer with the country boundary.

|image28|

.. code-block:: r
    plot(lulc_ipcc)
    
    plot(aoi_laea, add=T, col=NA);

|image29|

Preparation of Mountain descriptor
----------------------------------

Users should have read section **Defining analysis environments and data selection** on choice of DEM and selected a DEM for use in the analysis before starting this section as the generation of the mountain descriptor layer requires a DEM as the input source.  

In this tutorial the Copernicus 90m source DEM has been chosen as an example. 

Input the DEM raster.

|image12|

.. code-block:: r
    DEM <- raster("C:/this_is_the_path/to_my_DEM_layer.tif");

Merging DEM tiles into a single DEM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you have multiple DEM raster tiles, follow the steps below to merge them. In this example, the DEM tiles covering the full extent of Costa Rica have been download from Copernicus using their AWS client. (Instructions for download of Copernicus data can be found in the **Annexs**). 

|image13|

.. code-block:: r
    #import all raster files in the folder as a list
    
    DEM_rastlist <- list.files(path="C:/this_is_the_path/to_my_DEM_folder", pattern='tif$', full.names=TRUE)
    
    DEM_allrasters <- lapply(DEM_rastlist, raster)
    
    #merge all the tiles in the list
    
    DEM_allrasters$filename <- "working_folder/DEM_merged.tif" 
    
    DEM <- do.call(merge, DEM_allrasters);


Clip and project merged DEM
^^^^^^^^^^^^^^^^^^^^^^^^^^^
The DEM tiles are likely to cover a much wider area than the country being analysed therefore it is important to crop the extent to minimise processing time. As indicated in section 2.3.2, the country boundary is not used to clip the dataset directly as the various calculations during the generation of the mountain descriptor layer require neighbouring pixels to be analyses therefore the buffered area of interest generated in section 4.1 should be used. 

Clip the DEM to area of interest after projecting to equal area projection

|image14|

.. code-block:: r
    DEM_laea <- projectRaster(DEM,crs="+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs", method = "bilinear")
    
    DEM_aoi_laea <- crop(DEM_laea,aoi_buffer);

Generating slope layer from DEM layer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this section, depending on whether your chosen projection already has equidistant properties, you will need to reproject the original merged DEM to an  equidistant projection (the one in its native coordinate system not the projected one to minimise introduction of errors from projecting a raster multiple times). This will  reduce errors in slope calculation. An overview of slope calculation methods is provided in the defining environments section.

IF your country falls within a single UTM Zone only AND you have used the UTM projection for the previous steps, or if the projection you are using has equidistant properties, slope can be generated in the same projection as the rest of the analysis, 

|image15|

.. code-block:: r
    slope_aoi <- terrain(DEM_aoi_laea, opt='slope', unit='degrees');

otherwise please generate a custom equidistant azimuthal projection by changing the **+lat_0 = 8.5** and the **+lon_0 = -84** parameters in the example equidistant azimuthal projection to the central latitude and longitude of your area of interest.

|image16|

.. code-block:: r
    #Project to Azimuthal equal area projection
    
    DEM_aeqd <- projectRaster(DEM, crs="+proj=aeqd +lat_0=8.5 +lon_0=-84 +datum=WGS84 +units=m", method = "bilinear")
    
    #Compute slope
    
    slope <- terrain(DEM_aeqd, opt='slope', unit='degrees')
    
    #Project to Lambert equal area projection, crop to the study area and resample
    
    slope_aoi <- slope %>% 
    
    projectRaster(crs="+proj=laea +lat_0=8.5 +lon_0=-84 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs", method = "bilinear") %>%
    
    crop(aoi_buffer) %>%
    
    resample(DEM_aoi_laea,method="bilinear");


Generating local elevation range from DEM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For Kapos classes 5 and 6 a 7km local elevation range is required for the identification of areas that occur in regions with significant relief, even though elevations may not be especially high, and conversely high-elevation areas with little local relief. This local elevation range is generated by defining a 7km radius of interest around each grid cell and calculating the difference between the maximum and minimum values within a neighborhood. 

|image17|

.. code-block:: r
    #Create a circular filter of 7 km
    
    cf <- focalWeight(DEM_aoi_laea, 7000, "circle")
    
    cf[cf > 0] <- 1
    

    #Generate focal maximum elevation
    
    focalMax <- focal(DEM_aoi_laea, w=cf, fun=max)  
    

    #Generate focal minimum elevation
    
    focalMin <- focal(DEM_aoi_laea, w=cf, fun=min)  
    

    #Generate focal range
    
    aoi7kmLocalElev <- focalMax - focalMin;   


Plot Focal range

|image30|

.. code-block:: r
    plot(aoi7kmLocalElev);


|image31|

Generating layers for each Kapos mountain class
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We now have all the inputs required for generating the mountain classes for the mountain descriptor layer. We will reclassify the DEM raster processed in the previous steps to generate a raster layer for each mountain class. 

class 1: DEM\_aoi\_laea>=4500m

class 2: >=3500 & <4500

class 3: >=2500 & <3500

class 4: >=1500 & <2500 & slope>=2

class 5: >=1000 & <1500 & slope>=5 OR >=1000 & <1500 & local elevation range >=300

class 6: >=300 & <1000 & local elevation range >=300

|image18|

.. code-block:: r
    #class 1: DEM_aoi_laea>=4500m, class 2: >=3500 & <4500, class 3: >=2500 & <3500, assign NA to remaining values 
    
    c123 <- reclassify(DEM_aoi_laea, c(4500,Inf,1, 3500,4499.999,2, 2500,3499.999,3, -Inf,2500,NA), include.lowest=TRUE)
    

    #class 4: >=1500 & <2500 & slope>=2
    
    c4 <- DEM_aoi_laea>=1500 & DEM_aoi_laea<2500 & slope_aoi>=2
    
    
    #assign value 4
    
    m <- c(1,4, 0,NA)
    
    rclmat <- matrix(m, ncol=2, byrow=TRUE)
    
    c4 <- reclassify(c4, rclmat, include.lowest=TRUE)
    

    #class 5: >=1000 & <1500 & slope>=5 OR >=1000 & <1500 & local elevation range >300
    
    c5 <- (DEM_aoi_laea>=1000 & DEM_aoi_laea<1500 & slope_aoi>=5) | (DEM_aoi_laea>=1000 & DEM_aoi_laea<1500 & aoi7kmLocalElev>300)
    
    #assign value 5
    
    m <- c(1,5, 0,NA)
    
    rclmat <- matrix(m, ncol=2, byrow=TRUE)
    
    c5 <- reclassify(c5, rclmat, include.lowest=TRUE)
    

    #class 6: >300 & <1000 & local elevation range >300
    
    c6 <- DEM_aoi_laea>300 & DEM_aoi_laea<1000 & aoi7kmLocalElev>300
    
    #assign value 6
    
    m <- c(1,6, 0,NA)
    
    rclmat <- matrix(m, ncol=2, byrow=TRUE)
    
    c6 <- reclassify(c6, rclmat, include.lowest=TRUE);


Generate an interim mountain layer with classes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next step is to create a mosaic of all the classes into a single raster where class 1 has a value of 1, class2 a value of 2, etc. 

|image19|

.. code-block:: r
    c <- mosaic(c123, c4, c5, c6, fun=max);


Plot the mountain descriptor layer

|image32|

.. code-block:: r
    plot(c);

|image33|

Generation of Real Surface Area raster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The final layer that needs generating is the Real Surface Area raster from the DEM. The following code generates the real surface area raster from the DEM. The steps are explained below.

|image20|

.. code-block:: r
    #insert the value of your DEM raster cell size in the same unit as the elevation data
    
    c.size <- res(DEM_aoi_laea);

**Step 1: prepare your DEM raster for the calculation**

Part a uses function ‘trim’ to exclude all boundaries cells with no value (NA) from DEM raster. Part b removes one row and one column from the top, bottom, left, and right from the original raster (cropping the raster to the boundaries of the area of interest).
.. code-block:: r
    #1.a - exclude all boundaries cells with no value from DEM raster
    
    DEM_aoi_laea <- trim(DEM_aoi_laea, padding=0, values=NA)
    

    #1.b - remove one row and one column from the top, bottom, left, and right
    
    a <- nrow(DEM_aoi_laea)-1
    
    b <- ncol(DEM_aoi_laea)-1
    
    DEM_aoi_laea.cropped <- DEM_aoi_laea [2:a, 2:b, drop=FALSE];
    

**Step 2: Convert DEM raster to matrix**

This step uses the function ‘as.matrix’ to convert the DEM raster into a matrix with the same number of columns and rows of your DEM raster. There are instructions within the R script to check if that is true.
.. code-block:: r
    #step 2 - convert the trimmed DEM raster to matrix
    
    m <- as.matrix(DEM_aoi_laea)
    
    #this matrix should have the same number of columns and rows of your DEM raster
    
    #you can check if that is correct by typing on the console 
    
    #ncol(DEM_aoi_laea)== ncol(m)
    
    #nrow(DEM_aoi_laea)==nrow(m)
    
    #you should get the answer TRUE for both queries;


**Step 3: Get coordinate information from DEM raster and assigns it to new object called m1**

This step uses the function ‘rasterToPoints’ to create a numeric object of type double from the cropped raster. The resulting object has 3 columns: x, y and layer. Columns ‘x’ and ‘y’ have the coordinates of each cell. Column ‘layer’ has the elevation value of each cell.

It uses function ‘as.vector’ assigned to each of one of the two coordinates columns to create numeric lists with the coordinates of the cells.
.. code-block:: r
    #step 3 - separate coordinate information from cropped raster and assign to a new object called m1
    
    m1 <- rasterToPoints(DEM_aoi_laea.cropped) # this will create an object with three columns: x, y , layer
    

    # columns x and y have the coordinates of each cell and column layer has the elevation value of each cell
    
    col.X <- as.vector(m1[,1]) # just the coordinates values from X column 
    
    col.Y <- as.vector(m1[,2]) # just the coordinates values from Y column
    

    #step 4 - calculate the real surface area of each grid cell  
    
    #uses function surfaceArea of package sp
    
    #needs object 'm' created on step 2 and the cell size 'c.size'
    
    rsa <- surfaceArea(m, cellx = c.size, celly = c.size, byCell = TRUE) 
    
    rsa.cropped <- rsa [2:a, 2:b, drop=FALSE];


**Step 4: Calculate the real surface area of each grid cell within the DEM**

This step uses the ‘surfaceArea’ function from package ‘sp’. Information about this function can be found on page 105 of the package ‘sp’ documentation (https://cran.r-project.org/web/packages/sp/sp.pdf) and on GitHub (`*https://github.com/cran/sp/blob/master/src/surfaceArea.c* <https://github.com/cran/sp/blob/master/src/surfaceArea.c>`__).
This function will calculate the real surface area of each grid cell of the DEM, based on the matrix ‘m’ created on step 1 and the cell size inserted on ‘SECTION A.4’. The resulting object ‘rsa’ is a matrix with the same number of columns and rows as the matrix ‘m’ and, hence, of the DEM, but with the estimated values of the real surface area for all cells within the DEM.

It crops the resulting matrix ‘rsa’ to create a matrix with just the columns and rows of the area of interest.
.. code-block:: r

**Step 5: Combine matrix with real surface area values and object with coordinate information**

This step uses the function ‘as.vector’ assigned to the transposed matrix ‘rsa’.

It uses the function ‘data.frame’ to create a new table ‘m3’ with three columns: two for coordinates ‘col.X’ and ‘col.Y’, and one with the real surface area values ‘m2’.
.. code-block:: r

**Step 6: Convert matrix back to a raster with the original projection**

This step renames the columns of the new table ‘m3’ to ‘x’, ‘y’, and ‘real\_surface\_area’

It uses the function ‘rasterFromXYZ’ to convert the table ‘m3’ to a raster.

It adopts the projection of the original DEM raster ‘r’ on the newly created raster ‘r2’ (that has the real surface area of each pixel).
.. code-block:: r

**Step 7: Sum the real surface area of all pixels within the study area**

This last step uses the cellStats function to sum values of all cells within the created raster ‘r2’.
.. code-block:: r


Mountain Green Cover Index Calculation
--------------------------------------

Aggregating mountain and RSA layers to resolution of vegetation descriptor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now that we have 3 raster datasets in their native resolutions we need to bring the datasets together and ensure that correct aggregation is undertaken and that all the layers align to the Vegetation Descriptor layer. In this example we have the Mountain Descriptor layer and the RealSurfaceArea Rasters at 90m resolution but a Vegetation Descriptor layer at 300m resolution. 

Aggregate the real surface area using the sum aggregation and then resample it to the resolution of the vegetation layer (if the resolution of the vegetation descriptor layer is coarser).

|image21|

Next, compare the resolutions of the vegetation and mountain descriptor layers and aggregate & resample the finer resolution raster to that of the coarser resolution one.

|image22|

Combining vegetation and mountain classes into single layer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As the MGCI required disaggregation by both the 6 LULC class and the 6 Mountain Class, we will combine the two datasets together to form a combined zones dataset to calculate zonal statistics. We will sum the two dataset together but in order to distinguish the vegetation class from the mountain class, all the vegetation values will be multiplied by 10. This means for example a value of 35 in the output means the pixel has class 3 in the vegetation descriptor layer and class 5 in the Mountain descriptor layer.

|image23|

Clip layers to country boundary
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

At this stage we can now clip the final aggregated datasets to the country boundary (remember that up to this point we have used a bounding box of the country boundary buffered out by 10km).

|image24|

Generate Zonal statistics
^^^^^^^^^^^^^^^^^^^^^^^^^

The data are now in a consistent format and clipped to the country boundary, so we can now generate the statistics required for the MGCI reporting. As we want to generate disaggregated statistics by LULC class and Mountain Class we will use a zonal statistics tool with the combined Vegetation + mountain layer as the summary unit and the RSA raster as the summary layer.

|image25|

We will also calculate the planimetric area. For this, we will create a raster template similar to the combined Vegetation + mountain layer and we will assign the area of each cell as the cell value and use the zonal statistics tool with the template raster as the summary unit and the combined Vegetation + mountain layer raster as the summary layer.

|image26|

We can now generate a summary table containing real surface area and planimetric area calculations for LULC classes with each Kapos mountain class.

|image27|


Outputing and formattting to Standard MGCI reporting tables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    To be added shortly

.. |image0| image:: media_R/image1.png
   :width: 6.26806in
   :height: 5.65417in
.. |image1| image:: media_R/image2.png
   :width: 6.26806in
   :height: 0.59514in
.. |image2| image:: media_R/image3.png
   :width: 6.26806in
   :height: 0.73681in
.. |image3| image:: media_R/image4.png
   :width: 6.26806in
   :height: 0.59514in
.. |image4| image:: media_R/image5.png
   :width: 6.26806in
   :height: 0.59514in
.. |image5| image:: media_R/image6.png
   :width: 6.26806in
   :height: 0.73681in
.. |image6| image:: media_R/image7.png
   :width: 6.26806in
   :height: 0.73681in
.. |image7| image:: media_R/image8.png
   :width: 6.26806in
   :height: 0.73681in
.. |image8| image:: media_R/image9.png
   :width: 6.26806in
   :height: 0.59514in
.. |image9| image:: media_R/image10.png
   :width: 6.26806in
   :height: 1.01875in
.. |image10| image:: media_R/image11.png
   :width: 6.26806in
   :height: 0.87778in
.. |image11| image:: media_R/image12.png
   :width: 6.26806in
   :height: 1.72361in
.. |image12| image:: media_R/image13.png
   :width: 6.26806in
   :height: 0.59514in
.. |image13| image:: media_R/image14.png
   :width: 6.26806in
   :height: 1.44167in
.. |image14| image:: media_R/image15.png
   :width: 6.26806in
   :height: 1.01875in
.. |image15| image:: media_R/image16.png
   :width: 6.26806in
   :height: 0.59514in
.. |image16| image:: media_R/image17.png
   :width: 6.26806in
   :height: 1.44167in
.. |image17| image:: media_R/image18.png
   :width: 6.26806in
   :height: 2.14653in
.. |image18| image:: media_R/image19.png
   :width: 6.26806in
   :height: 4.12153in
.. |image19| image:: media_R/image20.png
   :width: 6.26806in
   :height: 0.59514in
.. |image20| image:: media_R/image21.png
   :width: 6.26806in
   :height: 6.94167in
.. |image21| image:: media_R/image22.png
   :width: 6.26806in
   :height: 0.87778in
.. |image22| image:: media_R/image23.png
   :width: 6.26806in
   :height: 2.57014in
.. |image23| image:: media_R/image24.png
   :width: 6.26806in
   :height: 0.59514in
.. |image24| image:: media_R/image25.png
   :width: 6.26806in
   :height: 0.87778in
.. |image25| image:: media_R/image26.png
   :width: 6.26806in
   :height: 0.59514in
.. |image26| image:: media_R/image27.png
   :width: 6.26806in
   :height: 1.01875in
.. |image27| image:: media_R/image28.png
   :width: 6.26806in
   :height: 2.42917in
.. |image28| image:: media_R/image29.png
   :width: 6.26806in
   :height: 2.42917in
.. |image29| image:: media_R/image30.png
   :width: 6.26806in
   :height: 2.42917in
.. |image30| image:: media_R/image31.png
   :width: 6.26806in
   :height: 2.42917in
.. |image31| image:: media_R/image32.png
   :width: 6.26806in
   :height: 2.42917in
.. |image32| image:: media_R/image33.png
   :width: 6.26806in
   :height: 2.42917in
.. |image33| image:: media_R/image34.png
   :width: 6.26806in
   :height: 2.42917in
