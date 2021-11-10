5.  MGCI QGIS workflow
==================

.. contents:: **Table of Contents**


Definition 
----------
Put link to overview document
    
Initial set-up
--------------
put link to initial set up document

Introduction
------------

This section of the documentation explains in detail how to carry out this
analysis step-by-step in QGIS, using the Costa Rica as a case study using a 90m
resolution DEM from Copernicus. This section assumes that the user has
already downloaded the DEM and a LULC dataset (see section 2 and the
Annexes for further information).

For this tutorial we are using Costa Rica as an example country for
processing the MGCI, the Copernicus 90m DEM and Global ESA CCI LULC
datasets.

5.1 Define projection and generate an AOI
-----------------------------------------

-  Add a country boundary layer to QGIS **Layer>>Add Layer>>Add Vector
   Layer**

   |image32|

   |image33|\ |image34|

-  Click **Add** and **Close** to close the Data Source Manager: Vector
   dialogue window

-  Right-click on the country boundary layer and click **Zoom to Layer**

*Note that for Costa Rica the country includes Cocos Island to the
southwest of the Costa Rican mainland in the Pacific Ocean.*

In this example the boundary layer is in Geographic coordinate system
(EPSG 4326). At this stage we want to set-up the projection for the main
parts of the MGCI analysis. We therefore want to set the project window
to an equal area projection and physically project the country boundary
to the same projection.

Costa Rica covers more than one UTM Zone so in this example we will
define a custom Lambert Azimuthal Equal Area projection with the central
meridian set to -84 and the latitude of origin to 8.5.

Costa Rica does have a National Projection (see https://epsg.io/5367)
which may be an alternative to the Lambert Azimuthal Equal Area.

If you need to define a custom projection, follow the instructions in Box 1

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. rubric:: **BOX 1: Defining a custom projection**:                                                                                                                  |
|    :name: box-1-defining-a-custom-projection                                                                                                                          |
|                                                                                                                                                                       |
| -  From the main menu click **settings>>custom projections**                                                                                                          |
|                                                                                                                                                                       |
| -  Click the **+** button to a new custom projection                                                                                                                  |
|                                                                                                                                                                       |
| -  Give the custom projection a **name** e.g. in this example **CRI\_LAEQ**                                                                                           |
|                                                                                                                                                                       |
| -  Copy the following projection information into the **parameters** box, changing the lat and lon highlighted in yellow to the centre lat and lon of your country.   |
|                                                                                                                                                                       |
|    +proj=laea +lat\_0=8.5 +lon\_0=-84 +x\_0=0 +y\_0=0 +datum=WGS84 +units=m +no\_defs                                                                                 |
|                                                                                                                                                                       |
|    |image35|                                                                                                                                                          |
|                                                                                                                                                                       |
| -  Click the **Validate** button to check that the parameters are valid and then **OK** to save the custom projection                                                 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Next change the project for the QGIS to your chosen equal area
projection. In this example it is the custom projection that was defined
in Box 1.

-  Click on the project projection **EPSG: 4326** in the bottom right
   hand corner of your QGIS project

|image36|

-  In the Project Properties dialogue window search for the chosen
   projection in the **Filter** tab

|image37|

-  Once located click on the equal area projection to set your QGIS
   project to be displayed in the chosen projection. E.g. in this
   example **CRI\_LEA**

-  Click **Apply** and **OK**

   |image38|

   See that the project now displays the custom projection in the bottom
   right hand corner.

Next use the reproject tool to project the country boundary layer to the
equal area projection

-  In the processing toolbox search for the **Reproject** tool

|image39|

|image40|

-  Set the Input layer to be the **country boundary**

-  Set the Target CRS to be the **Project CRS** (i.e. to the equal area
   projection)

-  | Set the output name to be the same as the input with a suffix to
     indicate the projection e.g. in this example
   | **BND\_CTY\_CRI\_ LAEA**

Now that the country boundary is in the chosen equal area projection, we
can generate a rectangular bounding box which we will use as an area of
interest (AOI). As indicated previously, the AOI needs to be larger than
the country boundary to avoid errors during the processing. A distance
of 10km around the bounding box is added to ensure the AOI is large
enough to accommodate the 7km focal range function used in the mountain
descriptor layer generation.

-  In the processing toolbox search for the **minimum bounding geometry
   tool**

|image41|

-  Select your **projected** **country boundary** for the Input layer

-  Choose Envelope (bounding Box) for the Geometry type

-  Set a new output with the prefix **bounds\_** for the name e.g.
   **bounds\_CRI\_LAEA**

-  Click **Run** to run the tool.

This has generated the bounding box. The next step adds the 10km buffer.

-  In the processing toolbox search for the **buffer tool**

-  Set the buffer **Distance** to **10**

-  Set the buffer **Units** to **Kilometres**

-  Set the **endcap style** to **square** and the **join style** to
   **Miter**

-  Save the Buffered output to the same name as the input with the
   suffix **\_BUF10**

-  Click **Run** to run the tool.

|image42|

If you change the symbology to semi-transparent symbol and draw it over
the original bounding box you should be able to see the additional
buffered area.

|image43|

The output is a bounding box 10km larger than the bounding box for the
country. This will be used as the Area of Interest (AOI) when preparing
the various layers for the MGCI analysis.

5.2 Preparation of Vegetation descriptor layer
----------------------------------------------

The development of vegetation descriptor layer starts with either a
raster or vector landuse landcover (LULC) dataset. Follow either section
5.2.1 if your LULC dataset is a raster data or 5.2.2 if your LULC
dataset is a vector.

5.2.1 Steps when using a raster dataset 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To demonstrate the steps for processing a raster LULC dataset we will
use the Global ESA CCI LULC dataset. This dataset is provided in netcdf
(.nc) format. Similarly to Geotiffs, these can be added directly to
QGIS.

-  From the QGIS main toolbar click on **Layer>>Add Layer>>Add Raster
   Layer** to add the LULC file to your QGIS session.

|image44|

|image45|

-  Click **Add**

For most formats this will add the LULC dataset to the QGIS session. The
Global ESA CCI LULC netcdf file however contains 7 different layers
(similar to bands in an image) and users need to select the
**lccs\_class** layer.

-  Click **lccs\_class** to select the LULC layer

-  Click **OK** and the LULC layer will be added to your QGIS project

-  Click **Close** to close the Data Source Manager: Raster dialogue
   window

|image46|

Next check that the LULC layer has correct projection information and
appears in the correct place in the QGIS project.

-  First check that the LULC layer is correctly overlaying the country
   boundary data. If it does not your country boundary and/or your LULC
   layer may be lacking projection information or have the wrong
   projection information.

   |image47|

   QGIS will display a **?** next to the layer if projection information
   is missing.

-  If projection information is missing define the projection using the
   **Define Shapefile projection** tool in the processing toolbox (this
   will permanently attach projection information to the layer)
   alternatively you can just define it within the current QGIS project
   by right clicking on the layer.

   In this example we know the LULC is in Geographic coordinate system
   so we can assign coordinate system EPSG 4326 to the layer

   |image48|

   This layer should now draw correctly on the country boundary.

   If the LULC dataset is a regional or global extent it will need
   projecting and clipping to the AOI.

   In this example we are using a global dataset so we will need to
   follow **step (a) only** to clip the raster and save it in the equal
   area projection. For National datasets already clipped to the country
   boundary follow **step (b) only.**

(a) Clip and project LULC raster (FOR REGIONAL/GLOBAL DATASETS ONLY):
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  In the processing toolbox search for **Clip**.

-  Double click on the **Clip raster by mask layer** under the GDAL
   toolset

   |image49|

-  Select the **LULC dataset** for the **Input Layer**

-  Select the **buffered bounding box layer** for the **Mask Layer**

-  Select the **Project CRS** for the **Target CRS**

-  Tick **Match the extent of the clipped raster to the extent of the
   mask layer**

-  Tick **set the output file resolution**

-  Type the **X and Y resolution in metres** (in this case the
   resolution of the LULC dataset is 300)

-  Tick **Use Input Layer Data Type**

-  Set the output **Clipped (mask)** e.g. to LULC\_clip\_LAEA\_BUF10.tif

   (see screengrab below)

|image50|\ |image51|

-  \ **Click Run** to run the tool

The new clipped LULC dataset in the equal area projection should be
added should be added to the map canvas\ **.**

-  Right click on the clipped LULC dataset (i.e. in this example the
   LULC\_clip\_LAEA\_BUF10 layer) and click **properties>>Symbology**

|image52|

-  Change the render type to **Palleted/Unique Values**

-  Click **Classify** and then **OK**

   |image53|

You should now see the unique LULC classes present within the AOI for
the country.

|image54|

(b) Project LULC raster (FOR NATIONALDATASETS ONLY):
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  search for **project** in the processing toolbox.

-  Double click on the GDAL tool **Warp (reproject)**

-  Select the **National** **LULC dataset** for the **Input Layer**

-  Select the **Project CRS** for the **Target CRS**

-  Set the resampling method to **Nearest Neighbour**

-  Set the output resolution (same as the input or the equivalent to the
   input in metres)

-  Set the output **Reprojected** layer name e.g. to
   **National\_LULC\_\_LAEA.tif**

-  Click **Run** to run the tool

   |image55|

The new projected LULC dataset in the equal area projection should be
added should be added to the map canvas\ **.**

-  Right click on the projected LULC dataset and click
   **properties>>Symbology**

-  Change the render type to **Palleted/Unique Values**

-  Click **Classify** and then **OK**

   |image56|\ |image57|

The layer should now show all the National LULC classes for Costa Rica.

5.2.3 Steps when using a vector LULC dataset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When using a vector LULC dataset the data will also need to be projected
to an equal area projection.

-  If the dataset is not already in an equal area projection,
search for **reproject** in the processing toolbox

   |image58| 

-  Select the **National** **LULC vector dataset** for the **Input
   Layer**

-  Select the **Project CRS** for the **Target CRS**

-  Set the **reprojected** output layer e.g. **LULC_vector_LAEA.shp**
   
   |image59|

The next step is to rasterize the LULC data. When converting it is
important to choose an output resolution that is appropriate for the
scale of the vector dataset. (see Box 2).

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. rubric:: BOX 2: Conversion between nominal scale and resolution                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|    :name: box-2-conversion-between-nominal-scale-and-resolution                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| The scale of a vector dataset is usually expressed in a similar way to paper maps, i.e. in a ratio to show the amount of reduction from the real world e.g. 1:50,000. A country’s vector LULC map will have been created a particular scale. determined by the Minimum Mapping Unit. i.e. the size of the smallest feature. A nominal scale is will have been assigned to the dataset to reflect the scale at which the data were collected and mapped. Conversion to raster requires this scale to be converted to a resolution, i.e. an appropriate pixel size for the scale of the data. Table X provides some general guidance / suggestions for such conversion.   |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | Pixel Size(m)   | Nominal scale   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| +=================+=================+===========+============+=============+=============+===========+=======+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| |                 | 10K-25K         | 25K-50K   | 50K-100K   | 100K-200K   | 200K-500K   | 500K-1M   | >1M   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 250-1000        |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 140             |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 35-45           |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 30              |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 25-30           |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 23.5            |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 23.5            |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 20              |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 15-30           |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 15              |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 10              |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 5.8             |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 5               |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 5               |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 2-2.8           |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| | 0.8             |                 |           |            |             |             |           |       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| +-----------------+-----------------+-----------+------------+-------------+-------------+-----------+-------+                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Table X : Resolutions recommended for Nominal scales vs pixel resolution                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| (Source: reproduced from https://marinedataliteracy.org/basics/scales/scales.htm)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| To calculate map scale there are two parameters: ground resolution and screen resolution.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| |image60|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| | Where:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| | **Resolution** = ground resolution (the size in (m) that a pixel represents.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **PPI** = the screen resolution (pixels number that every inch contains on the screen (default 96dpi).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **0.0254 =** (m/inch), the unit conversion between meter and inches.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Scale = nominal scale of vector dataset                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| (source: https://enonline.supermap.com/iExpress9D/Appendix/scale.htm)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
+=========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

|image61|

Once the resolution to convert the vector dataset to has been
determined the vector dataset can be converted to Raster.

-  In the processing toolbox search for **Rasterize.**

-  Double click on the GDAL **Rasterize (vector to raster)** tool

-  Select the **National** **LULC vector dataset in equal area
   projection** for the **Input Layer**

-  Select the **field containing LULC classes** for the **field to use
   for a burn-in value**

-  Set the **output raster size units** as **Georeferenced units**

-  Set both the **Width/ Horizontal resolution and Width/ vertical
   resolution** to the resolution determined by previous step using the
   formula to convert from the nominal

   vector scale (see BOX 2)

-  Set the **output extent** to **Calculate by Layer** and selecting the
   same dataset used for the Input Layer

-  Set the **rasterized** output layer e.g.
   **LULC\_LAEA\_fromvector.tif**

-  Click **Run** to run the tool

The new rasterised LULC dataset in the equal area projection should be
added should be added to the map canvas\ **.**

-  Right click on the projected LULC dataset and click
   **properties>>Symbology**

-  Change the render type to **Palleted/Unique Values**

-  Click **Classify** and then **OK**

   |image62|\ |image63|

The layer should now show all the National LULC classes for Costa Rica.

5.2.4 Reclassify to IPCC landcover types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The next step is to reclassify the LULC map prepared in 5.2.1, 5.2.2 or
5.2.3 into the 6 MGCI vegetation descriptor LULC types.

QGIS provides several tools for reclassification. The easiest one to use
in this instance is the **r.reclass** tool in the GRASS toolset as it
allows the upload of a simple crosswalk textfile containing the input
LULC types on the left and the IPCC reclass values on the right.

-  Create a text file to crosswalk landuse/landcover (LULC) types from
   the ESA CII or National landcover dataset to the 6 IPCC landcover
   classes

   |image64|

-  Search for **reclass** in the processing toolbox
   
   |image65|

-  Double click on **r.reclass**

-  Select the LULC output(from step 5.2.1, 5.2.2 or 5.2.3) as the
   **input raster layer**

-  Set the **GRASS GIS region extent** to be the same as the input layer

-  Set the **Reclassified** output e.g. VegetationDescriptor\_LAEA.tif

-  Click **Run** to run the tool

   |image66|

The new **VegetationDescriptor** layer is added to the map.

Although the reclassification only had 6 output classes the symbology
initially show values 0-255. This is a QGIS visualisation only and you
can see that the actual layer only has 6 values.

-  Right click on the layer **properties>>>Symbology**

-  Change the Render type to **Palleted/Unique values** and click
   **Classify** to see only the classes present in the raster (i.e. the
   1-6 Vegetation descriptor classes).

-  Load the VegetationDescriptor.qml file for quickly assigning the
   colours and labels.

   |image67|

   |image68|

5.3 Preparation of Mountain descriptor 
---------------------------------------

Users should have read section 2.3.4 Choice of DEM and selected a DEM
for use in the analysis before starting this section as the generation
of the mountain descriptor layer requires a DEM as the input source.

In this tutorial the Copernicus 90m source DEM has been chosen as an
example.

5.3.1 Merging DEM tiles into a single DEM 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The DEM tiles covering the full extent of Costa Rica have been download
from Copernicus using their AWS client. (Instructions for download of
Copernicus data can be found in the Annexs).

-  From the QGIS main toolbar click on **Layer>>Add Layer>>Add Raster
   Layer** to add the DEM tiles to your QGIS session.

   |image69|

-  Click **Open** and then **Add.** The DEM tiles will be added to the QGIS project

   The next step is to merge the DEM tiles into a single raster.
   
-  Search for **Merge** in the processing toolbox window
  
   |image70|

-  Double click the **GDAL Merge tool**.

-  For the Input layers **select the DEM tiles** covering your area of
   interest

   |image71|

-  Tick the DEM tiles to merge and Click **OK** to make the selection
   and return to main **Merge Dialog window**

-  Set the **output data type** to Float32 (same as the input DEM tiles)

-  Set the **Merged** output name e.g. C:/MGCI\_tutorial/
   DEM\_copernicus\_merge.tif

   |image72|

   |image73|

-  Click **Run** to run the tool

The merged DEM is added to the QGIS project.

   |image74|

5.3.2 Clip and project merged DEM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The DEM tiles are likely to cover a much wider area than the country
being analysed therefore it is important to crop the extent to minimise
processing time. As indicated in section 2.3.2, the country boundary is
not used to clip the dataset directly as the various calculations during
the generation of the mountain descriptor layer require neighbouring
pixels to be analyses therefore the buffered bounding box generated in
section 5.1 should be used.

-  In the processing toolbox search for **Clip**.

-  Double click on the **Clip raster by mask layer** under the GDAL
   toolset

-  Select the **merged DEM dataset** for the **Input Layer**

-  Select the **buffered bounding box layer** for the **Mask Layer**

-  Select the **Project CRS** for the **Target CRS**

-  Tick **Match the extent of the clipped raster to the extent of the
   mask layer**

-  Tick **set the output file resolution**

-  Type the **X and Y resolution in metres** (in this case the
   resolution of the DEM dataset is 90)

-  Tick **Use Input Layer Data Type**

-  Set the output **Clipped (mask)** e.g. to
   DEM_copernicus_merge_AOI_LAEA.tif

-  Click **Run** to run the tool

   (see screen grab on next page)

   |image75|

The new clipped DEM dataset in the equal area projection should be added
should be added to the map canvas\ **.**

|image76|

5.3.4 Generating slope layer from layer DEM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users should have read section 2.3.4 Choice of DEM and selected a DEM
for use in the analysis before starting this section as the generation
of the mountain descriptor layer requires a DEM as the input source.

IF your country falls within **a single UTM Zone only** ***AND*** **you
have used the UTM projection for the previous steps**, slope can be
generated in UTM using the simple QGIS Slope tool

|image77|

-  Select the DEM clipped to the AOI in UTM projection as the Elevation
   layer

-  Set the **Slope** output to e.g. SLOPE_copernicus_merge_AOI_UTM.tif

-  Click **Run** to Run the tool

***IF*** your country crosses ***multiple UTM Zones*** skip the above
step and follow the slope calculation steps outlined in below and
referenced in section 2.3.4

**Methods for slope generation in QGIS (for countries covering more than
one UTM zone)**


The first step is to create a latitude grid. (a grid of the
y-coordinates in geographic coordinate system) [4]_.

-  In the Processing toolbox search for r.latlong

   |image78|

-  Select the **merged DEM dataset (the initial version that is in
   geographic coordinate system not the projected one)** for the **Input
   Layer**

-  |image79|\ Set the **GRASS GIS 7 region extent** to be calculated
   from **merged DEM dataset**

-  Set the **LatLon** output to e.g. latitude\_grid\_ epsg4326.tif

-  Click **Run** to run the tool

  A map showing greyscale latitude bands is added to the
   QGIS project
 
  |image80|

The second step is to compute the cosine of the latitude layer.

-  In the processing toolbox search for **Raster Calculator**

   |image81|

-  Double click on the **Raster Calculator** under the **Raster
   analysis** toolset

   |image82|

-  In the expression window type the COS expression

   e.g. **cos("latitude\_grid\_epsg4326@1")**

-  Set the **reference layer** to be the **latitude\_grid** raster.

-  Set the **Output** to e.g. cos\_latitude\_grid\_ epsg4326.tif

-  Click **Run** to run the tool

The third step is to project both the DEM and the cosine of the latitude
using a Mercator projection in which scale is true at the Equator. This
means a straight forward Mercator with a central meridian of 0 e.g.
World Mercator EPSG 3395 (and not pseudo or web Mercator).

|image83|

-  In the processing toolbox search for **reproject**

   |image84|

-  Double click on the **Warp (reproject)** tool under the **GDAL**
   toolset

-  Set the **Input layer** to be the **merged DEM in geographic
   coordinate system**

-  Set the **Source CRS** to be **EPSG: 4326 (Geographic)**

-  Set the **Target CRS** to be **EPSG: 3395 (World Mercator)**

-  Set the **resampling method** to Nearest Neighbour

-  Set the **output file resolution** to the resolution of the DEM in
   meters e.g. **90**\ m in this example

-  Set the **Reprojected** output to e.g.
   **DEM\_copernicus\_merge\_WorldMercator.tif**

-  Click **Run** to run the tool

   |image85|

Then reproject the cos\_latitude grid in the same way

-  Set the **Input layer** to be the **cos\_latitude\_grid\_epsg4326**
   (in geographic coordinate system)

-  Set the **Reprojected** output to e.g.
   **cos\_latitude\_grid\_WorldMercator.tif**

The two reprojected layers are added to the QGIS project.

The fourth step is to compute the slope of the World Mercator DEM. This
needs to be generated as a pure slope in the form of percent. i.e. NOT
as an angle in degrees

-  In the processing toolbox search for **Slope**

-  Double click on the **slope** tool under **Raster
   analysis** in the **GDAL** toolset.
   
   |image86|

   We will use this tool instead of the other slope tools as it has the
   option for slope to be calculated as a percent

-  Set the **Input layer** to be the
   **DEM\_copernicus\_merge\_WorldMercator.tif**

-  Tick **Slope** **expressed** as percent instead of degrees

-  Tick **compute edged**

-  Set the **Slope** output to e.g. **PERCSLOPE\_Wmercator.tif**

-  Click **Run** to run the tool

   |image87|

The fifth step is to divide this percent slope by the projected
cosine(latitude) raster in World Mercator.

-  In the processing toolbox search for **Raster Calculator**

-  Double click on the **Raster Calculator** under the
   **Raster analysis** toolset
   
   |image88|

-  In the expression window type the expression

   e.g. **"PERCSLOPE\_Wmercator@1" /
   "cos\_latitude\_grid\_WorldMercator@1"**

-  Set the **reference layer** to be the **percent** **slope** raster.

-  Set the **Output** to e.g. **PERCSLOPE\_Wmercator\_COScorrected.tif**

-  Click **Run** to run the tool

   (screengrab on next page)

   |image89|

The sixth step is to convert the slope to degrees as these units are
required in the generation of the mountain descriptor layer.

-  In the processing toolbox search for **Raster Calculator** again

-  Double click on the **Raster Calculator** under the **Raster
   analysis** toolset

   |image90|

-  In the expression window type the expression

   **atan("PERCSLOPE\_Wmercator\_COScorrected@1" /100) /3.14159\*180**

-  Click **Run** to run the tool

Finally the slope raster can be projected to the main analysis equal
area projection and be clipped to the AOI.

-  In the processing toolbox search for **Clip**.

-  Double click on the **Clip raster by mask layer** under the GDAL
   toolset

-  Select the **merged DEM dataset** for the **Input Layer**

   e.g. SLOPE\_Wmercator\_COScorrected\_DEG

-  Select the **AOI** **buffered bounding box layer** for the **Mask
   Layer**

-  Select the **Project CRS** for the **Target CRS**

-  Tick **Match the extent of the clipped raster to the extent of the
   mask layer**

-  Tick **set the output file resolution**

-  Type the **X and Y resolution in metres** (in this case the
   resolution of the DEM dataset is 90)

-  Tick **Use Input Layer Data Type**

-  Set the output **Clipped (mask)** e.g. to
   DEM\_copernicus\_merge\_AOI\_LAEA\_SLOPE

-  Click **Run** to run the tool

   (see screen grab on next page)

   |image91|\ |image92|

The new clipped DEM dataset in the equal area projection should be added
should be added to the map canvas\ **.**

5.3.5 Generating local elevation range from DEM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Kapos classes 5 and 6 a 7km local elevation range is required for
the identification of areas that occur in regions with significant
relief, even though elevations may not be especially high, and
conversely high-elevation areas with little local relief. This local
elevation range is generated by defining a 7km radius of interest around
each grid cell and calculating the difference between the maximum and
minimum values within a neighborhood. In QGIS the focal functions only
allow for the specification of the neighborhood size in pixels (i.e.
number of cells) so therefore, when running the next steps the size of
the neighborhhod will be influenced by the cellsize of the DEM.

|image93|

The Kapos 2000 documentation stated that the local elevation range was
evaluated for a 5 cell (or 7 km) radius around the target cell.

This it looks at a 5 x 5 neighborhood around each cell.

As the 2000 analysis was undertaken at 1km resolution we can use this to
estimate the ratio between the 7km radius distance and the number of
cells for the neighborhood :

Neighborhood size = 7000 / DEM cellsize \* (5000/7000)

The tool requires the neighborhood to be rounded to the nearest odd
whole number.

-  In the processing toolbox search for **r.neighbor**.

-  Double click on the **r.neighbor** tool under the GRASS toolset

-  Select the **Input Raster Layer to** the Projected DEM clipped to the
   AOI

-  Set the **neighborhood operation** to **Maximum**

-  Set the **neighborhood size to** 55 (determined by:
   7000/90\*(5000/7000))

-  Set the **GRASS GIS 7 region extent** to the **same as the Input
   Layer specified above**

-  Set the **GRASS GIS 7 cellsize** to the **same as the Input Layer
   specified above**

-  Set the output **Neighbors layer** e.g. to
   FOCMAX\_copernicus\_merge\_AOI\_LAEA

-  Click **Run** to run the tool

   |image94|

   Repeat the step for the focal minimum using the same parameters but
   this time

-  Set the **neighborhood operation** to **Maximum**

-  Set the output **Neighbors layer** e.g. to
   FOCMIN\_copernicus\_merge\_AOI\_LAEA

  |image95|

The two new focal maximum and focal minimum layers in the equal area
projection should have been added to the map canvas\ **.**

|image96| |image97|\ |image98|

The **local elevation** **range** can now be calculated using a simple
expression in the **raster calculator**

-  In the processing toolbox search for **Raster Calculator**

-  Double click on the **Raster Calculator** under the **Raster
   analysis** toolset

-  In the expression window type the following expression

   "FOCMAX\_copernicus\_merge\_AOI\_LAEA\_@1" -
   "FOCMIN\_copernicus\_merge\_AOI\_LAEA\_@1"

-  Set the **reference layer** to either of the focal grids or the
   projected DEM clipped to the AOI e.g.
   DEM\_copernicus\_merge\_AOI\_LAEA raster.

-  Set the **Output** to e.g. LocalElevationRange7km\_AOI\_LAEA\_.tif

-  Click **Run** to run the tool

    |image99|

The local elevation range in the equal area projection should have been
added to the map canvas\ **.**

|image100|

\ **5.3.6 Generating layers for each Kapos mountain class**

We now have all the inputs required for generating the mountain classes
for the mountain descriptor layer. We will use the raster calculator to
input the followings expression to generate a raster layer for each
mountain class.

**Kapos Class 1**

"DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 4500

|image101|

**Kapos Class 2**

"DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 3500 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 4500

|image102|

**Kapos Class 3**

"DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 2500 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 3500

|image103|

**Kapos Class 4**

"DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 1500 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 2500 AND
"DEM\_copernicus\_merge\_AOI\_LAEA\_SLOPE@1" > 2

|image104|

**Kapos Class 5**

("DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 1000 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 1500 AND
"DEM\_copernicus\_merge\_AOI\_LAEA\_SLOPE@1" >= 5) OR
("DEM\_copernicus\_merge\_AOI\_LAEA@1" >= 1000 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 1500 AND
"LocalElevationRange7km\_AOI\_LAEA@1" >= 300)

|image105|

**Kapos Class 6**

"DEM\_copernicus\_merge\_AOI\_LAEA@1">= 300 AND
"DEM\_copernicus\_merge\_AOI\_LAEA@1" < 1000
AND"LocalElevationRange7km\_AOI\_LAEA@1" >= 300

|image106|

5.3.7 Generate an interim mountain layer with classes 1-6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can now use the following expression in the raster calculator to add
the different classes into a single map where class 1 has a value of 1,
class2 a value of 2 etc.

"K1\_AOI\_LAEA\_@1" + ("K2\_AOI\_LAEA\_@1"\*2) +
("K3\_AOI\_LAEA\_@1"\*3)+("K4\_AOI\_LAEA\_@1"\*4)+("K5\_AOI\_LAEA\_@1"
\* 5)+("K6\_AOI\_LAEA\_@1"\*6)

|image107|

The first interim dataset K1\_to\_K6\_AOI\_LAEA\_interim.tif of the
mountain descriptor layer should have been added should be added to the
map canvas\ **.**

-  To improve the symbology, right click on the new layer and click
   **properties** and then **symbology**

   |image108|

At the bottom of the layer properties dialogue window click the
**style** button and then load the predefined style file

|image109|

|image110|

5.3.8 Filling isolated pixels within mountain areas and merging into classes 1-6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The last part of the mountain descriptor layer generation is to identify
isolated ‘non-mountain’ grid cells ( < 25km\ :sup:`2` in size)occurring
in mountain areas i.e, isolated inner basins and plateaus that are
surrounded by mountains but do not themselves meet criteria 1-6.

Once identified these can be reclassified according to the predominant
class among their neighbours.

-  The first step is to generate a raster of all non-mountain areas
   using the following expression in the **Raster Calculator**

   **"K1\_to\_K6\_AOI\_LAEA\_interim@1" = 0**

-  Set the output layer to e.g. **non\_mountain\_areas\_LAEA.tif**

   |image111|

   |image112|

You can see that the resultant non-mountains output dataset has value 1
for nonmountains and 0 for mountains. We need to set the 0 values to no
data.

-  Use the **Raster calculator** again with the following expession.
   This formular will set the 0’s to no data and leave the 1’s remaining
   as 1.

("non\_mountain\_areas\_LAEA@1">0)\*( "non\_mountain\_areas\_LAEA@1") /
(("non\_mountain\_areas\_LAEA@1">0)\*1 +
("non\_mountain\_areas\_LAEA@1"<=0)\*0)

   |image113|

   |image114|

We can now use this layer to clump the the pixels into groups of
connected pixels

-  In the **Processing Toolbox** search for **r.clump**

   |image115|

-  Double click on the **r.clumps tool** under the GRASS toolset

-  Select the **Input layer** as the non-mountain dataset with 1’s and
   no data.

-  Set the **Title for output raster map** to **connected\_clumps**

-  Set the **GRASS GIS 7 region extent** to the **same as the Input
   Layer specified above**

-  Set the **GRASS GIS 7 cellsize** to the **same as the Input Layer
   specified above**

-  Set the output **Clumps layer** e.g. to
   non\_mountain\_clumps\_NA\_LAEA.tif

-  Click **Run** to run the tool

   |image116|

You can see that the resultant clumped non-mountains output dataset
which has a different value for each clump.

|image117|

We can now use this clumped layer to select and reclass clumps < 25sqkm
(2500 ha)

-  In the **Processing Toolbox** search for **r.reclass.area**

-  Double click on the **r.reclass.area tool** under the **GRASS
   toolset**

-  Select the **Input layer** as the **non\_mountain\_clumps**

-  Set the **value option that sets the area size limit** to **2500**

-  Set the **Lesser or greater than specified value** to **lesser**

-  Tick **Input map is clumped**

-  Set the **GRASS GIS 7 region extent** to the **same as the Input
   Layer specified above**

-  Set the **GRASS GIS 7 cellsize** to the **same as the Input Layer
   specified above**

-  Set the output **Reclassified** layer e.g. to
   non\_mountain\_clumps\_lt\_25km2\_\_LAEA.tif

-  Click **Run** to run the tool

   |image118|

If we zoom in to look at the output we can see the pixels that are
smaller than 25km2 in purple.

|image119|

We can now use the r.neighbor tool in the GRASS toolst to reclassified
according to the predominant class among their neighbours.

-  In the processing toolbox search for **r.neighbor**.

-  Double click on the **r.neighbor** tool under the GRASS toolset

-  Set the **Input Raster** dataset to the 1-6 interim Kapos map

   e.g. K1\_to\_K6\_AOI\_LAEA\_interim.tif

-  Set the **Raster Layer to select cells which should be processed** to
   **reclassified clumps for the Input Layer e.g.**
   non\_mountain\_clumps\_lt\_25km2\_\_LAEA.tif

-  Set the **neighborhood operation** to **Mode**

-  Set the **neighborhood size to 3** (we set it small for this first
   run so to make a best attempt to correctly recode according to
   closest neighbours)

-  Set the **GRASS GIS 7 region extent** to the **same as the Input
   Layer specified above**

-  Set the **GRASS GIS 7 cellsize** to the **same as the Input Layer
   specified above**

-  Set the output **Neighbors layer** e.g. to

   K1\_to\_K6\_AOI\_LAEA\_interim2.tif

-  Click **Run** to run the tool

   |image120|

Copy the Kapos mountain class symbology to the new
K1\_to\_K6\_AOI\_LAEA\_interim2.tif

-  Right click on the the 1-6 interim Kapos map e.g.
   K1\_to\_K6\_AOI\_LAEA\_interim.tif

-  Click on styles>>copy style

-  Then right click on the new 1-6 interim Kapos plus filled neighbors
   layer e.g. K1\_to\_K6\_AOI\_LAEA\_interim2.tif and paste style

   |image121|

See that the smallest of the identified isolated pixels < 25km2 have
been classified correctly into Kapos classes 1-6 but the larger ones are
still not classified.

|image122|

To rerun again on the new K1\_to\_K6\_AOI\_LAEA\_interim2.tif we first
have to extract the remaining pixels that are still to be reclassified
into a separate raster.

Use the **Raster Calculator** and the following expression to create the
new clumps subset.

"K1\_to\_K6\_AOI\_LAEA\_interim2@1" = 0 AND
"non\_mountain\_clumps\_lt\_25km2\_\_LAEA@1" > 0

|image123|

Use the Raster Calculator again but this time to convert the 0 cells in
the new clumps subset to no data using the following expression:

("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset2@1">0)\*(
"non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset2@1") /
(("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset2@1">0)\*1 +
("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset2@1"<=0)\*0)

|image124|

We can then use the r.neighbor again to the remaining identified clumps
that didn’t get picked up first time round. (this time we suggest making
the neighborhood bigger area e.g. in this example we have used the same
number of pixels that was used for the local elevation range function
e.g. for a 90m resolution dataset 55 )

|image125|

Check to see if all pixels have been classified and if not so a further
run on a 3rd clumps subset will be required.

-  Use the **Raster Calculator** and the following expression to create
   the new clumps subset.

    "K1\_to\_K6\_AOI\_LAEA\_interim55@1" = 0 AND
    "non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset2@1" > 0

|image126|

Convert the no data values to 0 using the ecxpression:

("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset3@1">0)\*(
"non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset3@1") /
(("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset3@1">0)\*1 +
("non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset3@1"<=0)\*0)

|image127|

Run the r.neighborhood again to catch the last pixels

|image128|

Select any remaining non-classified pixels using the expression:

"K1\_to\_K6\_AOI\_LAEA\_interim55\_55@1" = 0 AND
"non\_mountain\_clumps\_lt\_25km2\_\_LAEA\_subset3@1" > 0'

|image129|

If the resultant layer has all zeros then all pixels have been
classified

|image130|

|image131|

There is one last step before the Mountain Descriptor layer is complete.

-  Right click on the last K1\_to\_K6\_AOI\_LAEA layer that was
   generated in the previous step.

    See that the Raster is 32 bit floating point raster. We will use the
    GRASS r.reclass tool to convert the dataset to Byte and also embed
    the Kapos class descriptions to the mountain classes. Whilst QGIS
    cannot see it the class description when the file loads GRASS will
    be able to read them when calculating statistics and add the
    descriptions to output CSVs.

We have create a reclass file containing the mountain classes and
descriptions

|image132|

-  Run the **r.reclass** GRASS tool:

-  Set the reclassified output name to be
   **MountainDescriptor\_LAEA.tif**

   |image133|

Copy and paste the style from the previous layer to shade and label the
classes in the MountainDescriptor\_LAEA.tif within the QGIS session.

|image134|

The Mountain Descriptor layer is now complete

5.4 Generation of Real Surface Area raster
------------------------------------------

The final layer that needs generating is the Real Surface
Area raster from the DEM. The tools should have all been tested to check
your R integration is working in Section 2.1.

-  In the processing toolbox expand the R-tools

   |image135|

-  Expand Raster Processing and double-click on Create RSA raster V1

-  Select the projected DEM as the Input Layer

-  Set the cellsize to the resolution of your DEM in metres

-  Set an output name RealSufaceArea\_LAEA.tif

   |image136|

-  Click Run to run the tool

   |image137|

5.5 Aligning mountain and vegetation descriptor layers 
-------------------------------------------------------

Now that we have 3 raster datasets in their native resolutions we need
to bring the datasets together and ensure that correct aggregation is
undertaken and that the all the layers align to the VegetationDescriptor
layer.

In this example we have the Mountain Descriptor layer and the
RealSurfaceArea Rasters at 90m resolution but a VegetationDescriptor
layer at 300m resolution.

We can use the Align tool in QGIS to aggregate and align the 2 higher
resolution rasters to the 300m Vegetation Descriptor layer

5.6 Computation of Mountain Green Cover Index
---------------------------------------------

We can use the r.stats tool to generate a csv file containing both
planimetric area, real surface area and disaggregations of mountain and
LULC classes. This summary table can then be used to calculate and
summarise the data at the various levels of aggregation and
disaggregation

|image138|

|image139|

5.7 Export to standard reporting table
--------------------------------------

.. |image0| image:: media/image2.png
   :width: 6.26806in
   :height: 3.16875in
.. |image1| image:: media/image3.png
   :width: 6.26806in
   :height: 5.06528in
.. |image2| image:: media/image4.png
   :width: 6.26806in
   :height: 0.81458in
.. |image3| image:: media/image5.png
   :width: 6.26806in
   :height: 1.65347in
.. |image4| image:: media/image6.png
   :width: 6.26806in
   :height: 3.97847in
.. |image5| image:: media/image7.png
   :width: 5.97917in
   :height: 4.25867in
.. |image6| image:: media/image8.png
   :width: 6.03472in
   :height: 4.75909in
.. |image7| image:: media/image9.png
   :width: 6.26806in
   :height: 4.46458in
.. |image8| image:: media/image10.png
   :width: 6.26806in
   :height: 3.33742in
.. |image9| image:: media/image11.png
   :width: 5.52160in
   :height: 0.94805in
.. |image10| image:: media/image12.png
   :width: 6.26806in
   :height: 3.70278in
.. |image11| image:: media/image13.png
   :width: 4.42770in
   :height: 4.71941in
.. |image12| image:: media/image14.png
   :width: 4.42653in
   :height: 4.71816in
.. |image13| image:: media/image15.png
   :width: 3.44840in
   :height: 1.83359in
.. |image14| image:: media/image16.png
   :width: 0.43750in
   :height: 0.35417in
.. |image15| image:: media/image17.png
   :width: 3.21875in
   :height: 1.13542in
.. |image16| image:: media/image18.png
   :width: 6.26806in
   :height: 2.56667in
.. |image17| image:: media/image19.png
   :width: 2.32263in
   :height: 0.97904in
.. |image18| image:: media/image20.png
   :width: 6.26806in
   :height: 3.45417in
.. |image19| image:: media/image21.png
   :width: 5.21948in
   :height: 1.75024in
.. |image20| image:: media/image22.png
   :width: 1.95347in
   :height: 2.17361in
.. |image21| image:: media/image23.png
   :width: 5.10417in
   :height: 1.21875in
.. |image22| image:: media/image24.png
   :width: 5.75000in
   :height: 3.93750in
.. |image23| image:: media/image25.png
   :width: 0.29861in
   :height: 0.29276in
.. |image24| image:: media/image26.png
   :width: 6.26806in
   :height: 3.40417in
.. |image25| image:: media/image27.png
   :width: 6.26806in
   :height: 3.59931in
.. |image26| image:: media/image28.png
   :width: 3.18056in
   :height: 2.63633in
.. |image27| image:: media/image29.png
   :width: 6.26806in
   :height: 2.40000in
.. |image28| image:: media/image30.png
   :width: 5.48788in
   :height: 5.13889in
.. |image29| image:: media/image31.png
   :width: 5.43750in
   :height: 3.10009in
.. |image30| image:: media/image32.png
   :width: 3.37547in
   :height: 4.79234in
.. |image31| image:: media/image33.png
   :width: 6.26806in
   :height: 2.66389in
.. |image32| image:: media/image34.png
   :width: 5.65728in
   :height: 1.02917in
.. |image33| image:: media/image35.png
   :width: 4.00355in
   :height: 1.62431in
.. |image34| image:: media/image36.png
   :width: 1.74534in
   :height: 1.62292in
.. |image35| image:: media/image37.png
   :width: 5.29167in
   :height: 6.63899in
.. |image36| image:: media/image38.png
   :width: 6.28139in
   :height: 0.35833in
.. |image37| image:: media/image39.png
   :width: 6.28125in
   :height: 5.64371in
.. |image38| image:: media/image40.png
   :width: 5.73024in
   :height: 0.27500in
.. |image39| image:: media/image41.png
   :width: 6.26806in
   :height: 5.45486in
.. |image40| image:: media/image42.png
   :width: 2.46597in
   :height: 2.24167in
.. |image41| image:: media/image43.png
   :width: 6.26806in
   :height: 2.72569in
.. |image42| image:: media/image44.png
   :width: 6.26806in
   :height: 6.17639in
.. |image43| image:: media/image45.png
   :width: 6.26806in
   :height: 5.56458in
.. |image44| image:: media/image46.png
   :width: 6.26806in
   :height: 1.33194in
.. |image45| image:: media/image47.png
   :width: 6.26806in
   :height: 2.48403in
.. |image46| image:: media/image48.png
   :width: 6.10502in
   :height: 3.58383in
.. |image47| image:: media/image49.png
   :width: 4.54167in
   :height: 2.21453in
.. |image48| image:: media/image50.png
   :width: 5.50833in
   :height: 3.71962in
.. |image49| image:: media/image51.png
   :width: 3.48021in
   :height: 2.14167in
.. |image50| image:: media/image52.png
   :width: 5.49984in
   :height: 6.74167in
.. |image51| image:: media/image53.png
   :width: 5.50764in
   :height: 2.87097in
.. |image52| image:: media/image54.png
   :width: 5.79167in
   :height: 3.75759in
.. |image53| image:: media/image55.png
   :width: 5.79572in
   :height: 3.78333in
.. |image54| image:: media/image56.png
   :width: 4.08390in
   :height: 1.31268in
.. |image55| image:: media/image57.png
   :width: 6.26806in
   :height: 9.07222in
.. |image56| image:: media/image58.png
   :width: 3.43128in
   :height: 4.10833in
.. |image57| image:: media/image54.png
   :width: 6.26806in
   :height: 4.06667in
.. |image58| image:: media/image59.png
   :width: 2.63578in
   :height: 1.68774in
.. |image59| image:: media/image60.png
   :width: 5.28584in
   :height: 6.92500in
.. |image60| image:: media/image61.png
   :width: 4.97917in
   :height: 0.51042in
.. |image61| image:: media/image62.png
   :width: 4.84861in
   :height: 7.35000in
.. |image62| image:: media/image58.png
   :width: 3.35417in
   :height: 4.01667in
.. |image63| image:: media/image54.png
   :width: 6.26806in
   :height: 4.06667in
.. |image64| image:: media/image63.png
   :width: 6.21606in
   :height: 2.15833in
.. |image65| image:: media/image64.png
   :width: 2.73125in
   :height: 2.93333in
.. |image66| image:: media/image65.png
   :width: 6.26806in
   :height: 5.58958in
.. |image67| image:: media/image66.png
   :width: 5.72500in
   :height: 4.53763in
.. |image68| image:: media/image67.png
   :width: 5.72500in
   :height: 4.09871in
.. |image69| image:: media/image68.png
   :width: 6.26806in
   :height: 6.30417in
.. |image70| image:: media/image69.png
   :width: 2.16667in
   :height: 2.37500in
.. |image71| image:: media/image70.png
   :width: 3.29167in
   :height: 0.96306in
.. |image72| image:: media/image71.png
   :width: 5.73333in
   :height: 4.20440in
.. |image73| image:: media/image72.png
   :width: 5.70000in
   :height: 5.32741in
.. |image74| image:: media/image73.png
   :width: 6.26806in
   :height: 4.20000in
.. |image75| image:: media/image74.png
   :width: 5.83333in
   :height: 9.69306in
.. |image76| image:: media/image75.png
   :width: 6.26806in
   :height: 4.29028in
.. |image77| image:: media/image76.png
   :width: 5.39167in
   :height: 2.82486in
.. |image78| image:: media/image77.png
   :width: 2.50000in
   :height: 1.23056in
.. |image79| image:: media/image78.png
   :width: 5.73038in
   :height: 5.49167in
.. |image80| image:: media/image79.png
   :width: 2.85556in
   :height: 3.19167in
.. |image81| image:: media/image80.png
   :width: 2.65833in
   :height: 1.71265in
.. |image82| image:: media/image81.png
   :width: 5.73652in
   :height: 4.69167in
.. |image83| image:: media/image82.png
   :width: 6.26806in
   :height: 1.17917in
.. |image84| image:: media/image83.png
   :width: 2.64583in
   :height: 1.10417in
.. |image85| image:: media/image84.png
   :width: 6.23190in
   :height: 5.26667in
.. |image86| image:: media/image85.png
   :width: 2.35625in
   :height: 2.03333in
.. |image87| image:: media/image86.png
   :width: 6.26806in
   :height: 5.91944in
.. |image88| image:: media/image80.png
   :width: 2.65833in
   :height: 1.71250in
.. |image89| image:: media/image87.png
   :width: 5.77619in
   :height: 4.87578in
.. |image90| image:: media/image88.png
   :width: 6.26806in
   :height: 4.38403in
.. |image91| image:: media/image89.png
   :width: 3.06973in
   :height: 3.67361in
.. |image92| image:: media/image90.png
   :width: 6.26806in
   :height: 5.98125in
.. |image93| image:: media/image91.png
   :width: 1.62500in
   :height: 1.30208in
.. |image94| image:: media/image92.png
   :width: 5.70718in
   :height: 7.59524in
.. |image95| image:: media/image93.png
   :width: 6.26806in
   :height: 8.21042in
.. |image96| image:: media/image94.png
   :width: 2.14147in
   :height: 0.82576in
.. |image97| image:: media/image95.png
   :width: 1.31645in
   :height: 1.62121in
.. |image98| image:: media/image96.png
   :width: 1.31509in
   :height: 1.62121in
.. |image99| image:: media/image97.png
   :width: 5.78451in
   :height: 5.33333in
.. |image100| image:: media/image98.png
   :width: 6.26806in
   :height: 4.53472in
.. |image101| image:: media/image99.png
   :width: 6.26806in
   :height: 5.02847in
.. |image102| image:: media/image100.png
   :width: 6.26806in
   :height: 5.02986in
.. |image103| image:: media/image101.png
   :width: 6.26806in
   :height: 5.02708in
.. |image104| image:: media/image101.png
   :width: 6.26806in
   :height: 5.02708in
.. |image105| image:: media/image102.png
   :width: 6.26806in
   :height: 5.02847in
.. |image106| image:: media/image103.png
   :width: 6.26806in
   :height: 5.24306in
.. |image107| image:: media/image104.png
   :width: 6.26806in
   :height: 4.55556in
.. |image108| image:: media/image105.png
   :width: 5.97917in
   :height: 4.75366in
.. |image109| image:: media/image106.png
   :width: 5.85417in
   :height: 2.86158in
.. |image110| image:: media/image107.png
   :width: 6.26806in
   :height: 4.50139in
.. |image111| image:: media/image108.png
   :width: 6.26806in
   :height: 5.53472in
.. |image112| image:: media/image109.png
   :width: 6.26806in
   :height: 4.48333in
.. |image113| image:: media/image110.png
   :width: 6.26806in
   :height: 4.56111in
.. |image114| image:: media/image111.png
   :width: 6.26806in
   :height: 4.44792in
.. |image115| image:: media/image112.png
   :width: 3.09722in
   :height: 1.37500in
.. |image116| image:: media/image113.png
   :width: 6.26806in
   :height: 4.59236in
.. |image117| image:: media/image114.png
   :width: 6.26806in
   :height: 4.45694in
.. |image118| image:: media/image115.png
   :width: 6.26806in
   :height: 4.60278in
.. |image119| image:: media/image116.png
   :width: 6.26806in
   :height: 3.34861in
.. |image120| image:: media/image117.png
   :width: 6.26806in
   :height: 6.40000in
.. |image121| image:: media/image118.png
   :width: 6.26806in
   :height: 3.95486in
.. |image122| image:: media/image119.png
   :width: 6.26806in
   :height: 3.39167in
.. |image123| image:: media/image120.png
   :width: 6.26806in
   :height: 5.17708in
.. |image124| image:: media/image121.png
   :width: 6.26806in
   :height: 4.38403in
.. |image125| image:: media/image122.png
   :width: 6.26806in
   :height: 5.07500in
.. |image126| image:: media/image123.png
   :width: 6.26806in
   :height: 5.04306in
.. |image127| image:: media/image124.png
   :width: 6.26806in
   :height: 5.04375in
.. |image128| image:: media/image125.png
   :width: 6.26806in
   :height: 5.05625in
.. |image129| image:: media/image126.png
   :width: 6.26806in
   :height: 5.05208in
.. |image130| image:: media/image127.png
   :width: 5.71528in
   :height: 0.77630in
.. |image131| image:: media/image128.png
   :width: 5.22222in
   :height: 3.12836in
.. |image132| image:: media/image129.png
   :width: 6.26806in
   :height: 1.42500in
.. |image133| image:: media/image130.png
   :width: 6.26806in
   :height: 5.07083in
.. |image134| image:: media/image131.png
   :width: 6.26806in
   :height: 3.82639in
.. |image135| image:: media/image132.png
   :width: 1.74653in
   :height: 1.97917in
.. |image136| image:: media/image133.png
   :width: 4.58472in
   :height: 2.31944in
.. |image137| image:: media/image134.png
   :width: 6.26806in
   :height: 3.19861in
.. |image138| image:: media/image135.png
   :width: 6.26806in
   :height: 6.41458in
.. |image139| image:: media/image136.png
   :width: 6.26806in
   :height: 4.29028in
.. |image140| image:: media/image137.png
   :width: 6.10208in
   :height: 3.16513in
.. |image141| image:: media/image138.png
   :width: 6.10208in
   :height: 3.16056in
.. |image142| image:: media/image139.png
   :width: 6.13889in
   :height: 0.51146in
.. |image143| image:: media/image140.png
   :width: 6.14021in
   :height: 4.06549in
.. |image144| image:: media/image141.png
   :width: 6.13092in
   :height: 1.95833in
.. |image145| image:: media/image142.png
   :width: 6.13869in
   :height: 1.52778in
.. |image146| image:: media/image143.png
   :width: 1.38205in
   :height: 0.21154in
.. |image147| image:: media/image144.png
   :width: 3.60467in
   :height: 2.18781in
.. |image148| image:: media/image145.png
   :width: 5.75000in
   :height: 4.76172in
.. |image149| image:: media/image146.png
   :width: 5.71528in
   :height: 4.75941in
.. |image150| image:: media/image147.png
   :width: 5.70139in
   :height: 4.76269in
.. |image151| image:: media/image148.png
   :width: 6.02167in
   :height: 4.97986in
.. |image152| image:: media/image149.png
   :width: 5.70833in
   :height: 4.72891in
.. |image153| image:: media/image150.png
   :width: 5.93833in
   :height: 4.95903in
.. |image154| image:: media/image151.png
   :width: 5.99042in
   :height: 5.01112in
.. |image155| image:: media/image152.png
   :width: 6.00084in
   :height: 4.91735in
.. |image156| image:: media/image153.png
   :width: 6.26806in
   :height: 2.67639in
.. |image157| image:: media/image154.png
   :width: 6.26806in
   :height: 4.40000in
.. |image158| image:: media/image155.png
   :width: 5.43001in
   :height: 2.79001in
.. |image159| image:: media/image156.png
   :width: 5.07668in
   :height: 3.08334in
.. |image160| image:: media/image157.png
   :width: 2.07279in
   :height: 0.21970in
.. |image161| image:: media/image158.png
   :width: 6.26806in
   :height: 4.84861in
.. |image162| image:: media/image159.png
   :width: 6.26806in
   :height: 4.88403in
.. |image163| image:: media/image160.png
   :width: 6.26806in
   :height: 4.86875in
.. |image164| image:: media/image161.png
   :width: 6.26806in
   :height: 4.86875in
.. |image165| image:: media/image162.png
   :width: 6.26806in
   :height: 4.89653in
.. |image166| image:: media/image163.png
   :width: 6.26806in
   :height: 6.27569in
.. |image167| image:: media/image164.png
   :width: 5.33408in
   :height: 5.05279in
.. |image168| image:: media/image165.png
   :width: 6.26806in
   :height: 4.42014in
.. |image169| image:: media/image166.png
   :width: 6.26806in
   :height: 1.02222in
