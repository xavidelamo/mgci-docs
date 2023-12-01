Annex 2
=======

Manual steps to calculate Sub-indicator 15.4.2a in QGIS
-----------------------------------------------------------------------------------------------

This section of the tutorial explains in detail how to calculate value
estimates for sub-indicator 15.4.2a in QGIS, using Colombia as a case
study. This section assumes that the user has already downloaded the
global mountain map made available by FAO to compute this indicator and
a land cover dataset meeting the requirements described in section 3.2.

Step-by-step equivalent of Tool step A0: Prepare country boundary and buffer to 10km
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Define projection and buffer country boundary
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The first step is to define the projection and an Area of Interest (AOI) for the analysis.
The AOI should go beyond the country boundary as outlined in the \ **Defining analysis environments** section of the tutorial.

-  Add a country boundary layer to QGIS **Layer>>Add Layer>>Add Vector
   Layer**

|image1|

|image2|

|image3|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

-  Click \ **Add** and **Close** to close the Data Source Manager:
   Vector dialogue window

-  Right-click on the country boundary layer and click \ **Zoom to
   Layer**

In this example, the boundary layer is in Geographic coordinate system
(EPSG 4326). At this stage we want to set-up the projection for the main
parts of the analysis. We therefore want to set the project window to an
equal area projection and physically project the country boundary to the
same projection.

Colombia does have a `National Projection <https://epsg.io/9377>`__ that
preserve both area and distance (see
`here <https://origen.igac.gov.co/documentos.html>`__) and therefore
could be used as a custom projection. In case a national projection that
minimize area distortion does not exist for a given country, it is
recommended to define a custom Equal Area projection centered on the
country area following the instructions described
`here <https://mgci-docs.readthedocs.io/en/latest/qgis.html>`__ under
‘’Define projection and generate AOI’’).

Once you have defined the projection to use in the analysis, change the
projection set for the QGIS project to your chosen projection. In this
example it is the national projection for Colombia.

-  Click on the project projection \ **EPSG: 4326** in the bottom right
   hand corner of your QGIS project

|image4|

-  In the Project Properties dialogue window search for the chosen
   projection in the \ **Filter** tab, in this case the projection EPSG
   9377

|image5|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

-  Once located click on the chosen projection to set your QGIS project
   to be displayed in the chosen projection.

-  Click \ **Apply** and **OK **

See that the project now displays the custom projection in the bottom
right hand corner.

|image6|

Next use the reproject tool to project the country boundary layer to the
9377 projection

-  In the processing toolbox search for the \ **Reproject** tool

|image7|

-  Set the Input layer to be the \ **country boundary**

-  Set the Target CRS to be the \ **Project CRS** (i.e. the EPSG 9377
   projection)

-  Set the output name to be the same as the input with a suffix to
   indicate the projection e.g. in this example \ **Colombia\_9377. **

|image8|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Now that the country boundary is in the chosen projection, we can
generate the mountains and land cover maps for Colombia.



Step-by-step equivalent of Tool step A1: Prepare and reclassify LULC dataset into UN-SEEA classes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

To demonstrate the steps for processing a raster LULC dataset we will
use the Global ESA CCI LULC dataset. If you are using a national
dataset, you can skip the following step.

`Clip and project LULC raster <https://mgci-docs.readthedocs.io/en/latest/qgis.html#id23>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ESA CCI LULC dataset is provided in netcdf (.nc) format. Similarly
to Geotiffs, these can be added directly to QGIS.

-  From the QGIS main toolbar click on Layer>>Add Layer>>Add Raster
   Layer to add the LULC file to your QGIS session.

|image9|

|image18|

-  Click \ **Add**

For most formats this will add the LULC dataset to the QGIS session. The
Global ESA CCI LULC netcdf file however contains 7 different layers
(similar to bands in an image) and users need to select
the lccs\_class layer.

-  Click \ **lccs\_class** to select the LULC layer

-  Click \ **OK** and the LULC layer will be added to your QGIS project

-  Click \ **Close** to close the Data Source Manager: Raster dialogue
   window

|image19|

Next check that the LULC layer has correct projection information and
appears in the correct place in the QGIS project.

-  First check that the LULC layer is correctly overlaying the country
   boundary data. If it does not your country boundary and/or your LULC
   layer may be lacking projection information or have the wrong
   projection information.

|image20|

-  QGIS will display a ‘’\ **?’’** next to the layer if projection
   information is missing.

-  If projection information is missing define the projection using
   the \ **Define Shapefile projection** tool in the processing toolbox
   (this will permanently attach projection information to the layer)
   alternatively you can just define it within the current QGIS project
   by right clicking on the layer.

In this example we know the LULC is in Geographic coordinate system so
we can assign coordinate system EPSG 4326 to the layer

|image21|

-  This layer should now draw correctly on the country boundary.

If the LULC dataset is a regional or global extent it will need
projecting and clipping to the AOI.

In this example we are using a global dataset so we will need to clip
the raster and save it in the equal area projection.

-  In the processing toolbox search for \ **Clip**

-  Double click on the \ **Clip raster by mask layer** under the GDAL
   toolset

|image12|

-  Select the **LULC dataset** for the input layer

-  Select the \ **national border of the country** for the \ **Mask
   Layer**

-  Select the \ **Project CRS** for the \ **Target CRS**

-  Tick \ **Match the extent of the clipped raster to the extent of the
   mask layer**

-  Tick \ **set the output file resolution**

-  Type the \ **X and Y resolution in metres** (in this case the
   resolution of the LULC dataset is 300)

-  Tick \ **Use Input Layer Data Type**

-  Set the output \ **Clipped (mask)** e.g. to LULC\_2020\_Colombia.tif
   (see screengrab below)

|image22|

|image23|

-  **Click Run** to run the tool

The new clipped LULC dataset in the equal area projection should be
added should be added to the map canvas\ **.** LULC\_2020\_Colombia
layer) and click \ **properties>>Symbology**

|image24|

-  Change the render type to \ **Palleted/Unique Values**

-  Click \ **Classify** and then \ **OK**

You should now see the unique LULC classes present within the AOI for
the country.

|image25|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Reclassify to UN-SEEA land cover classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The next step is to reclassify the LULC map into the 10 UN-SEEA classes
defined for SDG Indicator 15.4.2

QGIS provides several tools for reclassification. The easiest one to use
in this instance is the \ **r.reclass** tool in the GRASS toolset as it
allows the upload of a simple crosswalk textfile containing the input
LULC types on the left and the UN-SEEA reclass values on the right.

-  Create a text file to crosswalk landuse/landcover (LULC) types from
   the ESA CCI or National landcover dataset to the 10 UN-SEEA landcover
   classes

|image26|

-  Search for \ **reclass** in the processing toolbox

|image27|

-  Double click on \ **r.reclass**

-  Select the LULC output as the \ **input raster layer**

-  Set the \ **GRASS GIS region extent** to be the same as the input
   layer

-  Set the \ **Reclassified** output e.g.
   VegetationDescriptor\_Colombia.tif

|image28|

-  Click \ **Run** to run the tool. The
   new \ **VegetationDescriptor** layer is added to the map.

Although the reclassification only had 6 output classes the symbology
initially show values 0-255. This is a QGIS visualisation only and you
can see that the actual layer only has 10 values.

-  Right click on the layer \ **properties>>>Symbology**

-  Change the Render type to \ **Palleted/Unique values** and
   click \ **Classify** to see only the classes present in the raster
   (i.e. the 1-10 Vegetation descriptor classes) and rename the classes
   following the UN-SEEA terminology. Give each class a distinctive and
   identifiable colour.

|image29|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Step-by-step equivalent of Tool step A2 Prepare mountains and combine with LULC
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Generate the mountain map for the chosen country
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The development of mountain map consists in clipping and reprojecting
the SDG 15.4.2. Global Mountain Descriptor Map developed by FAO to area
of interest, in this case, the national border of Colombia.

**`Clip and project global mountain map**


From the QGIS main toolbar click on \ **Layer>>Add Layer>>Add Raster
Layer** to add the global mountain map file to your QGIS session.

|image9|

|image10|

-  Click \ **Add**

|image11|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

-  In the processing toolbox search for \ **Clip**

-  Double click on the \ **Clip raster by mask layer** under the GDAL
   toolset

|image12|

-  Select the \ **global mountain descriptor map** for the \ **Input
   Layer**

-  Select the \ **national border of the country** for the \ **Mask
   Layer**

-  Select the \ **Project CRS** for the \ **Target CRS**

-  Tick \ **Match the extent of the clipped raster to the extent of the
   mask layer**

-  Tick \ **set the output file resolution**

-  Type the \ **X and Y resolution in metres** (in this case 832)

-  Tick \ **Use Input Layer Data Type**

-  Set the output \ **Clipped (mask)** e.g. to Mountains\_Colombia.tif

|image13|

|image14|

-  **Click Run** to run the tool

The new clipped mountain descriptor dataset in the national projection
should be added to the map canvas\ **.**

|image15|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

-  Right click on the clipped mountain dataset (i.e. in this example the
   Mountains\_Colombia layer) and click \ **properties>>Symbology**

-  Click on **Style >> Load Style, and select the**
   SDG1542\_Mntn\_BioclimaticBelts.qml included in the Global Descriptor
   Dataset Folder

|image16|

The layer should now show all the mountain area for Colombia classified
by Biolimatic belts (where 1 is ‘’Nival”, 2 is “Alpine”, 3 is ‘’Montane”
and 4 is “Remaining Mountain Area”.

|image17|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Combine mountain and vegetation descriptor layers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have 2 raster datasets in their native resolutions we need
to bring the datasets together and ensure that correct aggregation is
undertaken and that the all the layers align to a common resolution.

Aggregate the layers to a common spatial resolution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this example we have the Mountain Descriptor layer at a 832 meters
resolution and a vegetation descriptor layer at a 300 m resolution.
There are various tools that can be used but we have opted for the GRASS
tool **r.resample** as it allowed to resample the mountain descriptor to
the vegetation layer, which has a finer grid.

In the processing toolbox search for \ **\*r.resample\***

|image30|

-  Select the mountain descriptor (in this example
   **Mountains\_Colombia.tif)** as the \ **Input Layer**

-  Set the cellsize to the the same resolution as your Vegetation
   Descriptor layer e.g. in this example 300m

-  Set the \ **Resampled Aggregated** layer to a name that distinguishes
   the resampling of the layer e.g. \ **Mountains\_Colombia\_300.tif**

-  Click \ **Run** to run the tool

|image31|

Combine mountain and vegetation descriptor layers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As SGD Indicator 15.4.2a requires disaggregation by both the 10 land
cover classes and the 4 bioclimatic belts and the tools within QGIS will
only allow a single input for zones, we will combine the two datasets.

-  In the \ **processing toolbox**, search for and double click on
   the \ **raster calculator**

-  In the expression window we will sum the two dataset together but in
   order to distinguish the vegetation class from the mountain all the
   vegetation values will be multiplied by 10. This means for example a
   value of 35 in the output means the pixel has class 3 in the
   vegetation descriptor layer and class 5 in the Mountain descriptor
   layer.

-  In the expression box formulate the expression:

(“VEGETATION\_DESCRIPTOR@1”`\* <https://mgci-docs.readthedocs.io/en/latest/qgis.html#id5>`__\ 10)
+ “MoutainDescriptor@1”

|image32|

-  Set the Reference layer as the Vegetation Descriptor layer

-  Click \ **Run** to run the tool

|image33|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Step-by-step equivalent of Tool step A3 download DEM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The step guides users in downloading an appropriate DEM.
Please refer to the **Defining environments section** and **Annex 1** for more information download options.
If you are not calculating Real Surface Area, this step will not be required.

Step-by-step equivalent of Tool step A4 Generate real surface area raster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This step cannot be carried out manually. Please run the QGIS model Step A4 which runs an R script to calculate Real Surface Area.


**Computation of Sub-indicator a Mountain Green Cover Index**

Step-by-step equivalent of Tool Step A5 Generate planimetric and real surface area statistics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

NOTE: the step by step instructions only calculate planimetric area. For real Surface Area statistics the toolbox must be used.

Generate area statistics for each land cover class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The data are now in a consistent format, so we can now generate the
statistics required for the MGCI reporting. As we want to generate
disaggregated statistics by LULC class and bioclimatic belt we will use
a zonal statistics tool with the combined Vegetation + mountain layer as
the summary unit. The Zonal statistics tool will automatically calculate
planimetric area in the output.

This output is the main statistics table from the analysis, from which
other summary statistics tables will be generated.

-  In the \ **processing toolbox** search for Zonal Statistics

-  Double click on the Raster layer unique values report.

-  Set the input layer to the combined vegetation and mountain class
   layer created in the previous step.

-  Under the Unique values table click on ... and choose Save to File….
   Enter a name for the file, in this case LULC\_Areas\_COL\_2020.gpkg.

-  Click \ **Run**.

|image34|

Now the LULC\_Areas\_COL\_2020  layer will be added to the Layers panel.
Right-click on the layer and click \ **Open Attribute Table**. The
column m2 contains the area for each class in square meters.

|image35|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Let’s convert the area to square kilometers. In the Processing Toolbox,
search and select \ **Vector table >> Field Calculator.**

-  In the Field Calculator dialog, select the LULC\_Areas\_COL\_2020
   layer

-  Enter the Field name as Area\_sqkm.

-  In the Result field type choose **Float**

-  In the Expression window, enter the below expression. This will
   convert the sqmt to sqkm and round the result to 2 decimal places.
   Under the Calculated click on **…** and choose Save To File… . Enter
   the name as LULC\_Areas\_COL\_2020\_sqkm.csv

   round("m2"/1e6, 2)

-  Click \ **Run.**

|image36|

Now the **LULC\_Areas\_COL\_2020\_sqkm** will be loaded in canvas. Open
the Attribute table and examine the newly added area\_sqkm column. You
will notice that the Value column contains numbers for each class. To
make the results easier to interpret. Let’s also add the land cover name
for each class number

In the Attribute Table, select “\ **Open** **Field Calculator”** in the
top bar.

-  Enter the Field name as Land\_cover.

-  In the Result field type, choose String. In Output field length enter
   100.

-  In the Expression window enter the below expression. This expression
   uses the \ **CASE** statement to assign a value based on multiple
   conditions. In this case it extract the first string of the value
   field, which indicate the type of land cover, to assign the name of
   the land cover in the new field name called “Land cover”

CASE

WHEN (substr("value",1,2))=10 THEN 'Inland water bodies'

WHEN (substr("value",1,1))=1 THEN 'Artificial Surfaces'

WHEN (substr("value",1,1))=2 THEN 'Cropland'

WHEN (substr("value",1,1))=3 THEN 'Grassland'

WHEN (substr("value",1,1))=4 THEN 'Tree-covered areas'

WHEN (substr("value",1,1))=5 THEN 'Shrub-covered areas'

WHEN (substr("value",1,1))=6 THEN 'Shrubs and/or herbaceous vegetation,
aquatic or regularly flooded'

WHEN (substr("value",1,1))=7 THEN 'Sparsely natural vegetated areas'

WHEN (substr("value",1,1))=8 THEN 'Terrestrial barren land'

WHEN (substr("value",1,1))=9 THEN 'Permanent snow and glaciers'

END

-  Click \ **Run.**

|image37|\ |image38|

Do the same again to add the Bioclimatic belt for each end string for
each value number, using the below expression:

|image39|

CASE

WHEN (substr("value",2,1))=1 THEN 'Nival'

WHEN (substr("value",2,1))=2 THEN 'Alpine'

WHEN (substr("value",2,1))=3 THEN 'Montane'

WHEN (substr("value",2,1))=4 THEN 'Remaining Mountain Area'

WHEN (substr("value",3,1))=1 THEN 'Nival'

WHEN (substr("value",3,1))=2 THEN 'Alpine'

WHEN (substr("value",3,1))=3 THEN 'Montane'

WHEN (substr("value",3,1))=4 THEN 'Remaining Mountain Area'

END

Save the edits.


Step-by-step equivalent of Tool Step A6 Formatting to reporting tables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool (although when undertaken manually the steps are slightly different as a QGIS plugin can be used to help with the formatting):

Now, we will export this result as an excel file. Before export we will
also organize the table and remove unwanted fields. In the Processing
Toolbox, search and select \ **Vector table ‣ Refactor fields**.

In the Refactor Fields dialog, select the layer edited in the prior step
as an Input layer (in this case LULC\_Areas\_COL\_2020\_SQKM), select
all columns except *area\_sqkm*, *Land\_cover*, *Bioclimatic\_belt* and
then click Delete selected field.

Once you are done with the edits, click on the ... button next
to Refactored and choose Save To File…. Select XLSX Files (\*.xlsx) as
the format. Enter the file name as 15.4.2a\_2020.xlsx and click Save. In
the Refactor Fields dialog, click Run to apply your changes.

|image40|

The result will be a spreadheet with *area\_sqkm* , land\_cover and
Bioclimatic\_belt columns.

|image41|

In Excel, calculate: (1) the total area of each bioclimatic belt (by
summing the area of all land cover types per bioclimatic belt); (2) the
total area of each land cover type across all bioclimatic belts (by
summing the area of each specific land cover type across all bioclimatic
belts) and finally; (3) the total mountain area of the country (by
summing the area of all land cover types across all bioclimatic belts).

Save this excel tab as 15.4.2a\_dis\_landcover. This data contains the
estimates of 15.4.2 sub-indicator a, disaggregated by land cover type.
Let’s now calculate the Mountain Green Cover Index estimates.

Copy and paste the values of this tab into another tab. In this one,
calculate Green Cover area for each bioclimatic belt, by summing the
areas of the following land cover types: (1) Tree-covered areas, (2)
Grasslands, (3) Croplands, (4) Shrub-covered areas and (5) Shubs and/or
herbaceous vegetation, aquatic or regularly flooded.

|image42|

Finally, calculate the MGCI by diving the area of green cover the total
area of each bioclimatic belt and the total mountain area and
multiplying it by 100.

|image43|

Sub-indicator a is now complete.

**Repeat for each of the reporting years.**



Manual steps to calculate Sub-indicator 15.4.2b in QGIS
--------------------------------------------------------------------

This section of the tutorial explains in detail how to calculate value
estimates for sub-indicator 15.4.2b in QGIS, continuing to use Colombia
as a case study. Sub-Indicator 15.4.2b is designed to monitor the extent
of degraded mountain land as a result of land cover change of a given
country and for given reporting year.

This sub-indicator looks at the proportion of degraded mountain area,
calculated using a binary score (degraded/non-degraded) showing the
extent of degraded land over total mountain area. This is calculated
using the following formula:

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| |image44|                                                                                                                                                                                                                              |
+========================================================================================================================================================================================================================================+
| Where:                                                                                                                                                                                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| **Degraded mountain area *n*** = Total degraded mountain area (in Km\ :sup:`2`) in the reporting period *n*. This is, the sum of the areas where land cover change is considered to constitute degradation from the baseline period.   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| **Total mountain area** = Total area of mountains (in Km\ :sup:`2`).                                                                                                                                                                   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

As a reminder, in accordance with the `SDG indicator’s
metadata <https://url6.mailanyone.net/scanner?m=1p7BBU-0003wA-60&d=4%7Cmail%2F90%2F1671436800%2F1p7BBU-0003wA-60%7Cin6b%7C57e1b682%7C25141507%7C10026187%7C63A01BCCC78D4890136281E76B4E7422&o=%2Fphtn%3A%2Futsntsto.u.as%2Fsrgegsm%2Fdfatala%2FidtdMesttaa%2Fe-5a-20401-fdp.&s=jYabXHtwhAEMHSvssRQeRRbeyDQ>`__
countries are required to compute estimates for Sub-Indicator 15.4.2b
for a baseline for approximately 2000-2015, and subsequently every three
years (2018, 2021, 2024, 2027 and 2030). Therefore, for the example in
this tutorial we will use the ESA-CCI landcover products for 2000, 2015
(for the baseline) and 2018 (for the reporting year). ESA-CCI landcover
data are not yet available beyond 2021 so we have therefore not yet been
able to calculate subsequent years in this example.

This section of the tutorial assumes that the user has already
calculated sub-indicator 15.4.2a and has therefore already downloaded
and translated the landcover cover datasets to UN-SEEA classes for the
baseline and reporting years (see sections 3.1-3.3 of the tutorial) as
presented in the figure below).

**LULC reclassified into UN-SEEA classes for 2000, 2015 and 2018**

|image45|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

Generate LULC degradation layers for reporting periods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SGD Indicator 15.4.2b requires us to identify change between LC classes
in each reporting period, therefore the first requirement for
sub-indicator 15.4.2b is to develop a transition matrix that specifies
the land cover changes occurring in a given land unit (pixel) as being
either degradation, improvement or neutral transitions. The definition
of degradation adopted for the computation of this indicator is the one
established by the Intergovernmental Science-Policy Platform on
Biodiversity and Ecosystem Services (IPBES) [2]_.

Countries may choose to either calculate degradation using the default
land cover legend for this indicator and default transition matrix
provided or from a native or simplified legend of a national land
use/land cover (LULC) dataset if they have the advantage of better
representing degradation transitions compared to the broader default
transitions.

Section 4.1.1 describes the default method using the default legend and
transition matrix, while section 4.1.2 outlines the
additional/alternative steps required to generate a transitions matrix
using a nationally adapted land cover legend. In both cases the output
results in the same 3 classes (stable, degradation and improving) and
both needed to be disaggregated and reported by both landcover
transition and bioclimatic belt.

The easiest method in QGIS is to generate a single value that represents
both year1 landcover and year2 landcover. For example, when calculating
the baseline using the default land cover legend reclassified datasets
for 2000 and 2015, each dataset has LULC values from 1-10 we need to
change the values for one of the years to be able to distinguish between
classes in year1 and year2. When using the nationally adapted LULC
legend, the values may be greater than 1-10. We will therefore multiply
values in year 1 by 1000 (in order to avoid any overlap between the
values in year 2).

Step-by-step equivalent of Tool Step B1 Combine LULC datasets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Combine the landcover dataset for the baseline and reporting year
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, we will generate a single raster containing a value to represent
both year1 landcover and year2 landcover. We will demonstrate using the
default method using the UN-SEEA reclassified landcover raster’s in
equal area projection that were previously reclassified for the
computation of sub-indicator a. As indicated above, users can choose to
use the rasters projected to equal area projection containing the full
or a simplified national LULC legend if there is a preference/advantage
of calculating landcover transitions compared to using the default
legend and transition matrix. The processing is the same regardless
which method is chosen.

In this example we will use the UN-SEEA reclassified landcover datasets
for 2000 and 2015 for the baseline and UN-SEEA classified landcover 2015
to 2018 raster’s for the 2018 reporting year. As each dataset has the
same LULC values (values 1-10 for UN-SEEA classification) we need to
change the values in one of the years to be able to distinguish between
classes in year1 and year2. We will multiply year1 land cover classes by
1000 before summing the datasets together. So for example values for
year 1 when using the default legend will range from 1000 – 10000 and
values for year 2 will remain 1 -10 and the resultant output will have
values ranging from a minimum of 1001 to a maximum of 10010 (depending
on which LULC transitions are present).

We will calculate the baseline period first i.e. using 2000 landcover
(year 1) and 2015 landcover (year2)

-  In the \ **processing toolbox**, search for and double click on
   the \ **raster calculator**

-  In the **expression box** formulate the expression (in this example
   using the UN-SEEA datasets):

(“UNSEEA\_LULC2000\_BND\_AOI\_EqArea@1”`\* <https://mgci-docs.readthedocs.io/en/latest/qgis.html#id5>`__\ 1000)
+ “UNSEEA\_LULC2015\_BND\_AOI\_EqArea@1”

|image46|

|image47|

*The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

 Set the Reference layer as one of the landcover datasets
   to set the extent, cellsize and CRS e.g.
   **UNSEEA\_LULC2015\_BND\_AOI\_EqArea layer**

-  Set the Output dataset to a new name e.g.
   **UNSEEA\_LULC2000\_2015\_BND\_AOI\_EqArea.tif** for the baseline

-  Click \ **Run** to run the tool

When using the default UN-SEEA land cover legend, this means that a
value of 2001 means a land cover class 2 in year 1 and a land cover
class 1 in year 2. A value of 10010 would mean a land cover class 10 in
year 1 and a land cover class 10 in year 2. In other words, year 1 is
represented by the first digit for values 1 to 9, and by the first 2
digits for land cover class 10. Year 2, on the other hand, is
represented by the right hand digit (for values 1-9) and the right hand
2 digits for value 10.

Repeat the above step for the next reporting period i.e. using 2015
landcover (year 1) and 2018 landcover (year2)

Step-by-step equivalent of Tool Step B2 Generate Transition matrix
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Generate the transitions Matrix
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Option 1: Use the default transitions matrix (using the default LULC legend)**

Download the default transitions matrix csv file from the `GitHub
repository <https://github.com/sepal-contrib/sepal_mgci/blob/master/component/parameter/transition_matrix.csv>`__
showing the unique combination of transitions using the default UN-SEEA
classes as presented in the figure below. The default transitions matrix
lists the transitions from the LULC classes to the 3 change classes
Stable (0), Degradation (-1) and Improving (1).

|image48|

-  Download the transitions matrix csv file and add it to your QGIS
   project using **Layer>>Add Layer>>Add Delimited Text Layer**

|image49|

Despite the clarity of this format transitions matrix, the
reclassification tools in QGIS require a very specific format for the
reclassification table. We therefore need to add an additional field and
calculate it to be the required QGIS syntax. This field will then be
saved into a new CSV file which can be used by the QGIS geoprocessing
tool.

-  In the Geoprocessing toolbox search for **Field Calculator**

In the field calculator add a new **string** field called
**QGIS\_syntax** with length **30**.

In the **expression builder** paste in the following text. Note that we
are taking the Landcover code for year 1 and multiplying it by 1000 (as
described above) and summing it with the landcover code for year 2
before combining it with the rest of the QGIS syntax

("from\_code" \*1000 + "to\_code") \|\| ' = ' \|\| "impact\_code" \|\| '
' \|\| "impact"

|image50|

The resultant table should look like this:

|image51|

-  Next search for the **List unique values** tool in the geoprocessing
   toolbox, this will be used to export the new column, **QGIS\_syntax**
   to a new csv file

-  Select the **transitions\_matrix\_QGIS** as the input layer

-  |image52|\ Select the **QGIS\_syntax** field in the target field

|image53|

-  Save the unique values to a new csv file e.g.
   **transition\_matrix\_for\_qgis.csv**

-  Click **Run**

-  Outside QGIS, open a windows explorer window navigate to the csv file
   and open in notepad

-  Remove the header row and save the file as
   **transition\_matrix\_for\_qgis.txt**

-  **Return to QGIS**

**Option 2: Generate a transitions matrix using a national LULC**


If are using a national land cover transition matrix you can prepare a
transitions table in the same format as the default transitions table in
Excel or you can generate a csv file from the unique combinations for
the LULC types using the combined LULC dataset for the two years. We
illustrate this below (although we are using the default UN-SEEA classes
for illustration purposes only)

-  In the processing toolbox search for **Raster Layer** **Unique Values
   Report**

-  Select the combined LULC dataset for year 1 and year 2 as the input
   layer e.g. **SEEA\_LULC2000\_2015\_BND\_AOI\_EqArea.tif**

-  Set the Unique values report to a new output table **e.g.
   UNSEAA\_2000\_20015\_trans.csv**

|image54|

The resultant table looks like this:

|image55|

Delete the count and m2 columns by clicking on the **toggle editing
button** on the top menu bar of the attribute table and then click the
Delete Field button. Select the **“\ *count”*** and **“\ *m2***\ *”*
fields and click **OK** to delete

|image56| |image57|

-  Click on the **toggle editing button** on the top menu bar again to
   save the changes

We can then add the to and from codes and descriptions.

In the Attribute Table, click the “\ **Open** **Field Calculator”**
button in the top bar.

|image58|

-  Enter the Field name as **from\_code**.

-  In the Result field type, choose **Whole Number (Integer).** In
   Output field length enter 3.

-  In the Expression window enter the expression: "value" / 1000

   |image59|

-  Click \ **OK**

The result looks like this:

|image60|

In the Attribute Table, select “\ **Open** **Field Calculator”** in the
top bar again.

-  Enter the Field name as **from\_desc**.

-  In the Result field type, choose **Text**\ ( **String)**. In Output
   field length enter **100**.

-  In the Expression window enter the below expression, replacing the
   names of the default UN-SEEEA LULC classes by the names of the
   national LULC legend. This expression uses the \ **CASE** statement
   to assign a value based on multiple conditions.

    CASE

    WHEN "from\_code" =10 THEN 'Inland water bodies'

    WHEN "from\_code" =1 THEN 'Artificial Surfaces'

    WHEN "from\_code" =2 THEN 'Cropland'

    WHEN "from\_code" =3 THEN 'Grassland'

    WHEN "from\_code" =4 THEN 'Tree-covered areas'

    WHEN "from\_code" =5 THEN 'Shrub-covered areas'

    WHEN "from\_code" =6 THEN 'Shrubs and/or herbaceous vegetation,
    aquatic or regularly flooded'

    WHEN "from\_code" =7 THEN 'Sparsely natural vegetated areas'

    WHEN "from\_code" =8 THEN 'Terrestrial barren land'

    WHEN "from\_code" =9 THEN 'Permanent snow and glaciers'

    END

    |image61|

-  Click \ **OK **

    The result looks like this:

    |image62|

-  In the Geoprocessing toolbox search for **Field Calculator**

-  Enter the Field name as **to\_code**.

-  In the Result field type, choose **Whole Number (Integer).** In
   Output field length enter 3.

-  In the Expression window enter the expression: "value" -
   ("from\_code" \*1000)

|image63|

-  Click **OK**

The result looks like this:

|image64|

In the Attribute Table, select “\ **Open** **Field Calculator”** in the
top bar again.

-  Enter the Field name as to\_desc.

-  In the Result field type, choose **Text**\ (**String)**. In Output
   field length enter **100**

-  In the Expression window enter the below expression. Again, replacing
   the names of the default UN-SEEEA LULC classes by the names of the
   national LULC legend. This expression uses the \ **CASE** statement
   to assign a value based on multiple conditions.

    CASE

    WHEN "to\_code" =10 THEN 'Inland water bodies'

    WHEN "to\_code" =1 THEN 'Artificial Surfaces'

    WHEN "to\_code" =2 THEN 'Cropland'

    WHEN "to\_code" =3 THEN 'Grassland'

    WHEN "to\_code" =4 THEN 'Tree-covered areas'

    WHEN "to\_code" =5 THEN 'Shrub-covered areas'

    WHEN "to\_code" =6 THEN 'Shrubs and/or herbaceous vegetation,
    aquatic or regularly flooded'

    WHEN "to\_code" =7 THEN 'Sparsely natural vegetated areas'

    WHEN "to\_code" =8 THEN 'Terrestrial barren land'

    WHEN "from\_code" =9 THEN 'Permanent snow and glaciers'

    END

|image65|

|image66|

-  Click \ **OK.**

-  The result looks like this


-  Next click the **New Field** button to add the following 2 fields

    |image67| |image68|

Users can then either manually enter the impact (stable, degradation or
improving) and impact\_codes (0,-1,1) or use the select button to select
groups of transitions and calculate to particular impact types

e.g. select those landcover types that have not changed between year 1
and year 2 and calculate as impact code = 0 and impact = “stable”

-  Click on the **Select features** **using and expression** button

|image69|

-  In the expression box enter the expression **“from\_code” =
   “to\_code”**

-  Click **Select features**

|image70|

The selected features are highlighted in blue:

|image71|

-  Click on the **Open field calculator** button

-  Tick **Update existing field**

-  Choose the **impact** field

-  In the expression box type **‘stable’**

-  Click **OK**

|image72|

-  |image73|\ Click on the **Open field calculator** button again

-  Tick **Update existing field**

-  Choose the field **impact\_code**

-  In the expression box type **0**

-  Click **OK**

|image74|\ The selected features highlighted in blue are now populated:

**Once all the impact values are populated,** we need to add an
additional field as the reclassification tools in QGIS that will use the
transitions matrix require a very specific format for the
reclassification table. This field will then be saved into a new CSV
file which can be used by the QGIS geoprocessing tool.

-  Click on the **Open field calculator** button

    In the field calculator add a new **string** field called
    **QGIS\_syntax** with length **30**.

    In the **expression window** paste in the following text. Note that
    we are taking the Landcover code for year 1 and multiplying it by
    1000 (as described above) and summing it with the landcover code for
    year 2 before combining it with the rest of the QGIS syntax:

    **("from\_code" \*1000 + "to\_code") \|\| ' = ' \|\| "impact\_code"
    \|\| ' ' \|\| "impact"**

    |image75|

-  Click **OK**

The resultant table should look like this:

|image76|

-  Next search for the **List unique values** tool in the geoprocessing
   toolbox, this will be used to export the new column, **QGIS\_syntax**
   to a new csv file

-  Select the **UNSEA\_2000\_2015\_trans** as the input layer

-  Select the **QGIS\_synta**\ x field in the target field

|image77| |image52|

-  Save the unique values to a new csv file e.g.
   **transition\_matrix\_nat\_for\_qgis.csv**

-  Click **Run**

***Important*** ***Note:** Be careful if using this same table for other
time periods as it is based on transitions between two specified time
periods. E.g. in this case 2000 and 2015. There may be other possible
transitions that are not present in this time period but may be possible
for other years. Therefore, before using this transitions matrix for
other time periods either check for missing entries and manually add
them to this table or generate a new transitions table for the new time
period.*


Step-by-step equivalent of Tool B3 Reclassify LULC transitions to impact
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Reclassify LULC transitions using the transitions matrix
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The next step is to reclassify the outputs from step 5.2 (i.e. the
combined landcover datasets for year1 and year 2), first for the
baseline period **UNSEEA\_LULC2000\_2015\_EqArea.tif** and **then for
the 2018 reporting period UNSEEA\_LULC2015\_2018\_EqArea.tif.** We will
use the transitions matrix generated in the previous steps (5.3.1 or
5.3.2). In this example we use the default transitions matrix (from
5.3.1) but the steps are the same if a national transitions matrix is
being used.

-  In the processing toolbox search **for r.reclass**

-  Set the input raster layer to **UNSEEA\_LULC2000\_2015\_EqArea.tif**

-  Set the file containing the reclass rules by navigating to the
   transitions matrix e.g. **transition\_matrix\_for\_qgis.csv**

-  Set the GRASS GIS 7 Region extent to
   **UNSEEA\_LULC2000\_2015\_EqArea.tif**

-  Set the cellsize to be the same as UNSEEA\_LULC2000\_2015\_EqArea.tif
   e.g. in this case **307.896977**

-  Save the reclassified file to a new name e.g.
   **UNSEEA\_LULC2000\_2015\_EqArea\_reclassed\_impact.tif**

   |image78|

-  Click **Run**

   **(you can the two ignore the 2 warning messages that appear in red–
   these do not affect the correct generation of the outputs**

   **“**\ WARNING: Concurrent mapset locking is not supported on
   Windows”

   **“**\ ERROR 6:
   C:\\workspace\\MGCI\\outputs\\UNSEEA\_LULC2000\_2015\_EqArea\_reclassed\_impact.tif,
   band 1: SetColorTable() only supported for Byte or UInt16 bands in
   TIFF format.”)

-  Double-click on the output and change the symbology to
   **paletted/unique** values and click the **Classify** button to show
   the classes present in the output layer.

    |image79|

   (you can also change the label to indicate 0 = stable -1 =
   degradation and 1 = improving)

   |image80|

   *The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

-  Repeat the above step for the next reporting period i.e. using 2015
   landcover (year 1) and 2018 landcover (year2) i.e. using the layer
   **UNSEEA\_LULC2015\_2018\_EqArea.tif**

Step-by-step equivalent of Tool B4 Combine Bioclimatic belts, LULC transitions and impact layers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Combine landcover transitions, impact and bioclimatic belts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We now have all the layers we need for generating statistics. To make it
easier we will again sum the layers together using different factors to
change the values in some of the datasets.

We have the following datasets which we need to combine to generate the
proportion of degraded mountain area disaggregated by LULC transitions,
impact status and bioclimatic belt:

-  LULC transitions (which in our case using have values 1001-10010
   where LULC for year 1 has already been multiplied by 1000 and summed
   with year 2 values)

   **We will leave these LULC transitions dataset values as they are. **

-  Bioclimatic belts (which have values 1-4 representing the 4
   bioclimatic belts)

   **We will multiply the bioclimatic belts by 100,000**

-  LULC transition impact status (values -1, 0 and 1)

   **We will change the impact status by adding 2 to each of the values
   and multiplying by 1,000,000 thus changing values -1 to 1,000,000
   (degradation) 0 to 2,000,000 (stable) and 1 to 3,000,000
   (improving)**

-  In the processing toolbox search for the **raster calculator **

-  In the expression box use the following expression (where the first
   dataset is the LULC transitions e.g. in this example for the baseline
   period, the second dataset is the Bioclimatic Belts dataset that was
   resampled to the resolution of the LULC dataset in the processing for
   sub-indicator a and the third dataset is the impact status):

   "UNSEEA\_LULC2000\_2015\_EqArea@1" +
   ("MNTBelts\_BND\_AOI\_ResampledNN\_EqArea@1" \*100000) +
   (("UNSEEA\_LULC2000\_2015\_EqArea\_reclassed\_impact@1" +2)\*1000000)

   |image81|

-  Set the reference dataset as the UNSEEA\_LULC2000\_2015\_EqArea@1
   which is a quick way to determine the output extent, cellsize and
   projection of the output dataset.

-  Set the output dataset as e.g.
   **UNSEEA\_LULC2000\_2015\_MTN\_combined\_.tif**

-  |image82|

   *The boundaries and names shown, and the designations used on this map do not imply official endorsement or acceptance by the United Nations.*

 Click **Run.** The output is added to the table of
   contents and the annotated legend below illustrates the meanings of
   the values

   |image83|

-  Repeat the above step for the next reporting period i.e. using 2015
   landcover (year 1) and 2018 landcover (year2)

Step-by-step equivalent of Tool B5 Generate planimetric and real surface area statistics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

NOTE: the step by step instructions only calculate planimetric area. For real Surface Area statistics the toolbox must be used.

Computation of Proportion of degraded mountain area
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Generate area statistics for each land cover transition**

The data are now combined and in format we can use to generate the
statistics required for the sub-indicator 15.4.2b reporting. The
**Raster layer unique values** **report** tool will automatically
calculate planimetric area in the output and contain all the
disaggregation’s we require.

This output is the main statistics table from the analysis, from which
other summary statistics tables will be generated.

-  In the \ **processing toolbox** search for **Raster layer unique
   values report**

-  Double click on the **Raster layer unique values report**.

-  Set the input layer to the combined layer created in the previous
   step

   e.g. **UNSEEA\_LULC2000\_2015\_MTN\_combined\_.tif**.

-  Under the Unique values table click on ... and choose Save to File….
   Enter a name for the file, in this case
   **subIndicator\_b\_Areas\_COL\_basline2000\_2015.gpkg**.

   |image84|

-  Click \ **Run**.

Now the **subIndicator\_b\_Areas\_COL\_basline2000\_2015** layer will be
added to the Layers panel. Right-click on the layer and click \ **Open
Attribute Table**. The column m2 contains the area for each class in
square meters.

|image85|

Let’s convert the area to square kilometers. In the Processing Toolbox,
search and select \ **Vector table >> Field Calculator.**

-  In the Field Calculator dialog, select
   the \ **subIndicator\_b\_Areas\_COL\_basline2000\_2015** layer

-  Enter the Field name as **Area\_sqkm**.

-  In the Result field type choose **Float  **

-  In the Expression window, enter the below expression. This will
   convert the sqmt to sqkm and round the result to 2 decimal places.
   Under the Calculated click on **…** and choose Save To File… . Enter
   the name as **subIndicator\_b\_Areas\_COL\_basline2000\_2015\_sqkm**

   round("m2"/1e6, 2)

|image86|

-  Click \ **Run.**

Now the **subIndicator\_b\_Areas\_COL\_basline2000\_2015\_sqkm** will be
loaded in canvas. Open the Attribute table and examine the newly
added area\_sqkm column.

As indicated before the Value column contains numbers for each unique
class combination. To make the results easier to interpret. Let’s also
re-add all the descriptive attributes

In the Attribute Table, click the “\ **Open** **Field Calculator”**
button in the top bar.

-  Enter the Field name as **BioclimaticBelt**.

-  In the Result field type, choose **Text (string).** In Output field
   length enter **100**.

-  In the Expression window enter the below expression. This expression
   uses the \ **CASE** statement to assign a value based on multiple
   conditions. In this case it extracts the second string of the value
   field, which indicate the type of land cover, to assign the name of
   the land cover in the new field name called “\ **BioclimaticBelt”**

   CASE

   WHEN (substr("value",2,1))=1 THEN 'Nival'

WHEN (substr("value",2,1))=2 THEN 'Alpine'

WHEN (substr("value",2,1))=3 THEN 'Montane'

WHEN (substr("value",2,1))=4 THEN 'Remaining Mountain Area'

END

|image87|

-  Click on the Save button on the attribute menu to save the edits.

In the Attribute Table, click the “\ **Open** **Field Calculator”**
button in the top bar again.

-  Enter the Field name as **LULC\_transition**.

-  In the Result field type, choose **Whole Number (Integer).**.

-  In the Expression window enter the expression: substr("value",3,5)

   |image88|

-  Click **OK**

-  Click on the **Save** button on the attribute menu to save the edits.

-  Click on the **toggle editing** button to turn off the attribute
   editing

We can now use the LULC\_transitions field to join on the rest of the
attributes from the transitions matrix file.

-  Open the transitions\_matrix\_for\_QGIS.csv file . It should be the
   one containing the following fields. We are going to use the
   **Value** field in this file to join to the **LULC\_transition**
   field in our statistic file
   (subIndicator\_b\_Areas\_COL\_basline2000\_2015\_sqkm)

|image89|

-  Right click and select properties on the statistics file

   i.e. **subIndicator\_b\_Areas\_COL\_basline2000\_2015\_sqkm**

-  Click on the **joins tab** and click on the **green + button**

-  For the join layer pick the **transitions matrix** that you opened
   above

-  For the join field pick **Value**

-  For the target field pick **LULC\_transition**

|image90|

-  Click **OK** then **OK** again

-  You should see that a join has been added in the top panel

   |image91|

-  Click **OK** to close the join window

-  Open the attribute table of the statistics file again and you should
   now see that it includes the joined fields. (i.e. the
   subIndicator\_b\_Areas\_COL\_basline2000\_2015\_sqkm file\ **)**

   |image92|

-  These are only temporarily joined so we need to save as a new file.
   We will use the refactor field tool as this allows us to remove the
   joinfield preface (in this example
   **transition\_matrix\_for\_qgis\_**)that was added to the joined on
   fields and also set the correct output types for the other fields (as
   below)

|image93|

-  Save the refactored file to a new name within the geopackage

   e.g. subInd\_b\_Areas\_COL\_basline2000\_2015\_sqkm\_joined

Step-by-step equivalent of Tool B6 B6 Formatting to reporting tables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps are covered by this tool:

Calculate area statistics and format statistics to reporting format
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-  From the main menu click on **Plugins>>Manage and install plugins**

-  Search for **stats** and click on **Group Stats** then click on
   **Install Plugin**

|image94|

-  From the main menu bar click on **Vector>> Groupstats >> Group
   stats**

|image95|

-  Drag the **Area\_sqkm** field into the **Value** box

-  Drag **sum** into the Value box

-  Drag **BioclimaticBelt,** and **to\_desc** into the **Rows** box

-  Drag **impact** into the **Columns** box

-  Click **Calculate**

|image96|

A summary table will appear in the **Group Stats** window

-  From the Group stats menu click **Data>>copy all to clipboard**

-  Next open **Microsoft Excel** with a new blank worksheet

-  **Paste** the copied clipboard contents into the excel worksheet

   |image97|

-  Highlight the headings **Degradation, Improving and Stable** and
   shift them down one cell

-  Highlight the entire first row and delete (with the heading None and
   impact)

-  Add 3 new columns at the end called **Total, ProportionDegraded,
   ProportionNetDegraded, %Degraded and %NetDegraded.**

   |image98|

-  Calculate Total to be the sum of columns C to E

-  Calculate ProportionDegraded to be column C dived by column F

-  Calculate ProportionNetDegraded to be column C minus column D and
   diving it by column F

-  Calculate %Degraded and %Net Degraded to be column G and H multiplied
   by 100, respectively.

    |image99|

-  **Next insert pivot table and summarise by Bioclimatic Belt to sum
   the Degradation values, Improving values and Total Mountain Area**

   |image100|

-  Again add and calculate columns for **ProportionDegraded,
   ProportionNetDegraded, %Degraded and %NetDegraded**

-  Save to **.xlsx format e.g. COL\_2000\_2015\_SDG15\_4\_2b.xls**

-  Repeat the above step for the next reporting period i.e. using 2015
   landcover (year 1) and 2018 landcover (year2) and any other reporting
   periods.

**END**

Generate multiband raster to help with spatial interrogation of results and QA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the gdal merge tool to combine all the input rasters into a single
multi-band raster

|image101|

https://gis.stackexchange.com/questions/62005/how-to-rename-the-band-names-of-a-layer-stack

https://issues.qgis.org/issues/17128

Looking at this plugin:

|image102|

.. [1]
   At the time of writing the Long Term Release of QGIS is Version 3.22
   'Białowieża'

.. [2]
   IPBES defines land degradation as “the many human-caused processes
   that drive the **decline or loss in biodiversity**, **ecosystem
   functions** or **ecosystem services** in any terrestrial and
   associated aquatic ecosystems” (IPBES, 2018)

.. |image1| image:: ../media_QGIS/image1.png
   :width: 1200
.. |image2| image:: ../media_QGIS/image2.png
   :width: 1200
.. |image3| image:: ../media_QGIS/image3.png
   :width: 1200
.. |image4| image:: ../media_QGIS/image4.png
   :width: 1200
.. |image5| image:: ../media_QGIS/image5.png
   :width: 1200
.. |image6| image:: ../media_QGIS/image6.png
   :width: 1200
.. |image7| image:: ../media_QGIS/image7.png
   :width: 1200
.. |image8| image:: ../media_QGIS/image8.png
   :width: 1200
.. |image9| image:: ../media_QGIS/image9.png
   :width: 1200
.. |image10| image:: ../media_QGIS/image10.png
   :width: 1200
.. |image11| image:: ../media_QGIS/image11.png
   :width: 1200
.. |image12| image:: ../media_QGIS/image12.png
   :width: 400
.. |image13| image:: ../media_QGIS/image13.png
   :width: 1200
.. |image14| image:: ../media_QGIS/image14.png
   :width: 1200
.. |image15| image:: ../media_QGIS/image15.png
   :width: 1200
.. |image16| image:: ../media_QGIS/image16.png
   :width: 1200
.. |image17| image:: ../media_QGIS/image17.png
   :width: 1200
.. |image9| image:: ../media_QGIS/image9.png
   :width: 1200
.. |image18| image:: ../media_QGIS/image18.png
   :width: 1200
.. |image19| image:: ../media_QGIS/image19.png
   :width: 600
.. |image20| image:: ../media_QGIS/image20.png
   :width: 600
.. |image21| image:: ../media_QGIS/image21.png
   :width: 1200
.. |image12| image:: ../media_QGIS/image12.png
   :width: 400
.. |image22| image:: ../media_QGIS/image22.png
   :width: 1200
.. |image23| image:: ../media_QGIS/image23.png
   :width: 1200
.. |image24| image:: ../media_QGIS/image24.png
   :width: 1000
.. |image25| image:: ../media_QGIS/image25.png
   :width: 1200
.. |image26| image:: ../media_QGIS/image26.png
   :width: 1200
.. |image27| image:: ../media_QGIS/image27.png
   :width: 400
.. |image28| image:: ../media_QGIS/image28.png
   :width: 1200
.. |image29| image:: ../media_QGIS/image29.png
   :width: 1200
.. |image30| image:: ../media_QGIS/image30.png
   :width: 600
.. |image31| image:: ../media_QGIS/image31.png
   :width: 1200
.. |image32| image:: ../media_QGIS/image32.png
   :width: 1200
.. |image33| image:: ../media_QGIS/image33.png
    :width: 1200
.. |image34| image:: ../media_QGIS/image34.png
   :width: 1200
.. |image35| image:: ../media_QGIS/image35.png
   :width: 1200
.. |image36| image:: ../media_QGIS/image36.png
   :width: 1200
.. |image37| image:: ../media_QGIS/image37.png
   :width: 1200
.. |image38| image:: ../media_QGIS/image38.png
   :width: 1200
.. |image39| image:: ../media_QGIS/image39.png
   :width: 1200
.. |image40| image:: ../media_QGIS/image40.png
   :width: 1200
.. |image41| image:: ../media_QGIS/image41.png
   :width: 1200
.. |image42| image:: ../media_QGIS/image42.png
   :width: 1200
.. |image43| image:: ../media_QGIS/image43.png
   :width: 1200
.. |image44| image:: ../media_QGIS/image44.png
   :width: 1200
.. |image45| image:: ../media_QGIS/image45.png
   :width: 1200
.. |image46| image:: ../media_QGIS/image46.png
   :width: 1200
.. |image47| image:: ../media_QGIS/image47.png
    :width: 600
.. |image48| image:: ../media_QGIS/image48.png
   :width: 1200
.. |image49| image:: ../media_QGIS/image49.png
   :width: 1200
.. |image50| image:: ../media_QGIS/image50.png
   :width: 1200
.. |image51| image:: ../media_QGIS/image51.png
   :width: 1200
.. |image52| image:: ../media_QGIS/image52.png
   :width: 400
.. |image53| image:: ../media_QGIS/image53.png
   :width: 1000
.. |image54| image:: ../media_QGIS/image54.png
   :width: 1000
.. |image55| image:: ../media_QGIS/image55.png
   :width: 1200
.. |image56| image:: ../media_QGIS/image56.png
    :width: 1200
.. |image57| image:: ../media_QGIS/image57.png
   :width: 400
.. |image58| image:: ../media_QGIS/image58.png
   :width: 1200
.. |image59| image:: ../media_QGIS/image59.png
   :width: 1200
.. |image60| image:: ../media_QGIS/image60.png
   :width: 1000
.. |image61| image:: ../media_QGIS/image61.png
   :width: 1200
.. |image62| image:: ../media_QGIS/image62.png
   :width: 1200
.. |image63| image:: ../media_QGIS/image63.png
   :width: 1200
.. |image64| image:: ../media_QGIS/image64.png
   :width: 1200
.. |image65| image:: ../media_QGIS/image65.png
   :width: 1200
.. |image66| image:: ../media_QGIS/image66.png
   :width: 1200
.. |image67| image:: ../media_QGIS/image67.png
   :width: 600
.. |image68| image:: ../media_QGIS/image68.png
   :width: 600
.. |image69| image:: ../media_QGIS/image69.png
   :width: 1200
.. |image70| image:: ../media_QGIS/image70.png
   :width: 1200
.. |image71| image:: ../media_QGIS/image71.png
   :width: 1200
.. |image72| image:: ../media_QGIS/image72.png
   :width: 1200
.. |image73| image:: ../media_QGIS/image73.png
   :width: 1200
.. |image74| image:: ../media_QGIS/image74.png
   :width: 1200
.. |image75| image:: ../media_QGIS/image75.png
   :width: 1200
.. |image76| image:: ../media_QGIS/image76.png
   :width: 1200
.. |image77| image:: ../media_QGIS/image77.png
   :width: 1200
.. |image52| image:: ../media_QGIS/image52.png
   :width: 600
.. |image78| image:: ../media_QGIS/image78.png
   :width: 1200
.. |image79| image:: ../media_QGIS/image79.png
   :width:1200
.. |image80| image:: ../media_QGIS/image80.png
   :width: 1200
.. |image81| image:: ../media_QGIS/image81.png
   :width: 1200
.. |image82| image:: ../media_QGIS/image82.png
   :width: 800
.. |image83| image:: ../media_QGIS/image83.png
   :width: 1000
.. |image84| image:: ../media_QGIS/image84.png
   :width: 1200
.. |image85| image:: ../media_QGIS/image85.png
   :width: 800
.. |image86| image:: ../media_QGIS/image86.png
   :width: 1200
.. |image87| image:: ../media_QGIS/image87.png
    :width: 1200
.. |image88| image:: ../media_QGIS/image88.png
   :width: 1200
.. |image89| image:: ../media_QGIS/image89.png
   :width: 1200
.. |image90| image:: ../media_QGIS/image90.png
   :width: 1200
.. |image91| image:: ../media_QGIS/image91.png
   :width: 1200
.. |image92| image:: ../media_QGIS/image92.png
   :width: 1200
.. |image93| image:: ../media_QGIS/image93.png
   :width: 1200
.. |image94| image:: ../media_QGIS/image94.png
   :width: 1200
.. |image95| image:: ../media_QGIS/image95.png
   :width: 1200
.. |image96| image:: ../media_QGIS/image96.png
   :width: 1200
.. |image97| image:: ../media_QGIS/image97.png
   :width: 1200
.. |image98| image:: ../media_QGIS/image98.png
    :width: 1200
.. |image99| image:: ../media_QGIS/image99.png
    :width: 1200
.. |image100| image:: ../media_QGIS/image100.png
   :width: 1200
.. |image101| image:: ../media_QGIS/image101.png
   :width: 1200
.. |image102| image:: ../media_QGIS/image102.png
   :width: 1200


.. |image9orig| image:: ../media_QGIS/image11_install_plugins.png
   :width: 5.52160in
   :height: 0.94805in
.. |image10orig| image:: ../media_QGIS/image12_processingRprovider.png
   :width: 6.26806in
   :height: 3.70278in
.. |image12orig| image:: ../media_QGIS/image14_processingtoolboxR.png
   :width: 4.42653in
   :height: 4.71816in
.. |image13orig| image:: ../media_QGIS/image15_Rscripts.png
   :width: 3.44840in
   :height: 1.83359in
.. |image15orig| image:: ../media_QGIS/image17_processingtoolbox.png
   :width: 3.21875in
   :height: 1.13542in
.. |image16orig| image:: ../media_QGIS/image18_processingsettings.png
   :width: 6.26806in
   :height: 2.56667in
.. |image17orig| image:: ../media_QGIS/image19_processingtoolboxR2.png
   :width: 2.32263in
   :height: 0.97904in
.. |image18orig| image:: ../media_QGIS/image20_QGISRscriptcollection1.png
   :width: 6.26806in
   :height: 3.45417in
.. |image19orig| image:: ../media_QGIS/image21_QGISRscriptcollection2.png
   :width: 5.21948in
   :height: 1.75024in
.. |image30orig| image:: ../media_QGIS/image32_Rscripts2.png
   :width: 3.37547in
   :height: 4.79234in
