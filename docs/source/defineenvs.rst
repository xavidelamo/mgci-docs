
Defining analysis environments and data selection 
------------------------------------------------------

Defining projections to be used for the analysis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEM data are usually delivered in geographic coordinate system (EPSG:
4326). For generation of the mountain descriptor layer slope and area
need to be calculated from the DEM. There is no single map projection
that can be used as slope generation requires a projection with
different properties (equidistant) compared to the area calculation
(equal area). In selecting the projection, we therefore need to consider
the spatial properties we need to preserve. i.e. area and distance.

With all map projections there will always be some distortions of area,
shape, distance and direction and therefore careful selection of
projection is important. There are no projections which fully preserve
both area and distance so selection should ensure that any distortions
are minimized. To minimise errors, it is important not to project the
DEM multiple times as it degrades the data and introduces additional
errors, so each projection needs to be done from the source DEM.

Depending on whether the analysis is undertaken using GEE in SEPAL or
using desktop software (QGIS or R) influences the way the analysis is
undertaken. However, comparisons have been made to ensure that the
methods are as closely aligned as possible.

The main difference between the desktop and GEE approach is that GEE
recommends that processing is undertaken in geographic coordinate system
and only the statistics at the end are calculated in an equal area
projection.

For R and QGIS an equal area projection is required for most steps in
the analysis. Universal Transverse Mercator (UTM) is a good option for
countries covering only one UTM zone as both distance and area are
minimized within the zone but as distortion increases outside the UTM
zone an alternative projection is required for countries covering more
than one zone. Lambert Azimuthal Equal Area projection (with a central
meridian and central latitude set to the centre of the country) is good
solution for these countries as area calculations result in figures
similar to those if data within each UTM zone were projected and
calculated separately for their respective zone. Documentation for the
Lambert Azimuthal Equal Area projection indicates that shapes,
directions, angles, and distances are generally distorted, but area
distortion is minimised. If countries wish to choose an alternative
National projection, they should ensure that it has equal area
properties.

Overview of slope calculation methods 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Selected slope method for QGIS and R:**

For slope generation in the Mountain Descriptor layer (in QGIS and R) we
explored various options including the methods outlined on We explored
various methods but in the end opted we opted to project the DEM to an
equidistant projection to enable a consistent approach to be taken by
all countries and the method used in the 2002 Kapos mountain layer
generation. Whilst with this method error increases away from a defined
central latitude and longitude, we found that other errors were
occurring when using the conformal Mercator approach described on
gis.stackexchange [#f3]_ which we were not able to resolve. The later
approach used a simple expression was used for its scale distortion.
This method assumed that scale is correct at the equator and that its
distortion equals the secant of the latitude, or in other words, a slope
map can be generated showing percent slope which can then be divided by
the cosine of the latitude to correct the distortion of scale. 
Another technique for slope calculation which we rejected was to
calculate slope from the DEM without projecting (i.e., using geographic
coordinate system) using GDAL and a scale factor to calculate slope based on a ratio
of vertical to horizontal units.  We dismissed this method as other users
have indicated distortions increase with distance from the equator resulting
in wrong slope calculations particularly near the poles. 

.. rubric:: Footnotes

.. [#f3] further discussion can be found at https://gis.stackexchange.com/questions/14750/using-srtm-global-dem-for-slope-calculation/40456#40456. 

**Selected slope method for GEE:**

For ease of implementation in Google Earth Engine we opted for using a
Terrain Analysis in Google Earth Engine (TAGEE) module developed by
Safanelli et. al (2020). The module uses spheroid geometries meaning
that the DEM does not need to be projected to do the slope calculation.

Defining an area of interest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An area of interest (AOI) needs to be defined at the outset of this
analysis. Due to the nature of the calculations of the mountain
descriptor layer and the real surface area layer this needs to go beyond
the boundary of the country by at least 7km as the calculations look at
focal cells around an individual pixel in the DEM dataset. We suggest
users buffer the bounding box of the country boundary out by 10km.

Choice of LULC dataset and data access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is preferable that a National LULC map is used as the vegetation
descriptor layer for their MGCI analysis however countries can choose a
regional or global dataset if no national dataset is available. The
global 300m global landcover product produced by the European Space
Agency (ESA) Climate Change Initiative (CCI) can be used if no
appropriate National level dataset is available. This LULC dataset can
be downloaded from
https://cds.climate.copernicus.eu/cdsapp#!/dataset/satellite-land-cover?tab=overview.4

For the Global ESA CCI dataset users must register to download the
required dataset and accept terms and conditions before they are
directed to download the data.

|image31|

Choice of DEM and data access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Development of the mountain descriptor layer requires a Digital
Elevation Model (DEM). The selection of which DEM to use for the
mountain descriptor layer will be done by the countries. We do not
advise countries which DEM to choose although table X provides some
suggestions for open access sources. DEM selection may be influenced by
several factors including:

-  resolution of landcover dataset being used as the vegetation
   descriptor layer

-  a country’s standard DEM or knowledge of which DEM most accurately
   represents mountain for the country

-  the processing power required to generate a DEM at the higher
   resolutions – particularly for larger or under-resourced countries.

Countries may want to pay particular attention to the scale of their
chosen LULC dataset when selecting the resolution of their DEM.
Selecting a DEM that is of similar resolution to the LULC dataset is
likely to be the best option. Otherwise selecting a higher resolution
and aggregating the resultant mountain descriptor layer to the
resolution of the LULC dataset. UNEP-WCMC has evaluated the effects of
DEM resolution on the area of mountain in the mountain descriptor layer
and the effects of scaling up from finer to coarser resolutions. The
results showed that whilst there were differences in the mountain areas
(km:sup:`2`) between classes relative to the areas derived from the
native data, the difference was not statistically different.

+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| **NAME**                                         | **Version**   | **COVERAGE**                                                                                                                                                                                                                                                                                                         | **DESCRIPTION**                                                                                                                                                                                                                                                                                                                                                       | **GEE DATASET LINK**                                                                  | **DOWNLOAD LINK**                                                                                                                                                        | **FORMAT**                 | **30 arc seconds (~1km)**   | **15 arc seconds (~500m)**   | **7.5 arc seconds (~230m)**   | **3 arc seconds (~90m)**   | **1 arc seconds (~30m)**   | **CITATION**                                                                                                                                                                                                                                              |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Copernicus DEM                                   |               | There are two instances of Copernicus DEM named GLO-30 Public and GLO-90. GLO-90 provides worldwide coverage at 90 meters. GLO-30 Public provides limited worldwide coverage at 30 meters because a small subset of tiles covering specific countries are not yet released to the public.                            | The Copernicus DEM is a Digital Surface Model (DSM) which represents the surface of the Earth including buildings, infrastructure and vegetation. The newly-released DEM that is upgrade because it has better vertical accuracy, it’s globally consistent, and it’s newer than the most widely-used near-global DEM dataset, SRTM.                                   | not available                                                                         | https://copernicus-dem-30m.s3.amazonaws.com/readme.html                                                                                                                  | Cloud Optimized GeoTIFFs   |                             |                              |                               | P                          | P                          | European Space Agency, Sinergise (2021). Copernicus Global Digital Elevation Model. Distributed by OpenTopography. https://doi.org/10.5069/G9028PQB Accessed: 2021-11-01                                                                                  |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | or                                                                                                                                                                       |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | https://registry.opendata.aws/copernicus-dem/                                                                                                                            |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NASADEM                                          | 1             | 1° by 1° tiles and consist of all land between 60° N and 56° S latitude                                                                                                                                                                                                                                              | NASADEM is a reprocessing of STRM data, with improved accuracy by incorporating auxiliary data from ASTER GDEM, ICESat GLAS, and PRISM datasets. The most significant processing improvements involve void reduction through improved phase unwrapping and using ICESat GLAS data for control.                                                                        | https://developers.google.com/earth-engine/datasets/catalog/NASA\_NASADEM\_HGT\_001   | https://doi.org/10.5067/MEaSUREs/NASADEM/NASADEM\_HGT.001                                                                                                                | SRTM HGT                   |                             |                              |                               |                            | P                          | NASA JPL. NASADEM Merged DEM Global 1 arc second V001. 2020, distributed by NASA EOSDIS Land Processes DAAC, https://doi.org/10.5067/MEaSUREs/NASADEM/NASADEM\_HGT.001. Accessed YYYY-MM-DD.                                                              |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | and                                                                                                                                                                      |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | https://e4ftl01.cr.usgs.gov/MEASURES/NASADEM\_HGT.001/2000.02.11/                                                                                                        |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ASTER GDEM                                       | 3             | land surfaces between 83°N and 83°S latitudes.                                                                                                                                                                                                                                                                       | GDEM coverage spans from 83 degrees north latitude to 83 degrees south, encompassing 99 percent of Earth's landmass. The improved GDEM V3 adds additional stereo-pairs, improving coverage and reducing the occurrence of artifacts. The refined production algorithm provides improved spatial resolution, increased horizontal and vertical accuracy.               | not available                                                                         | https://gdemdl.aster.jspacesystems.or.jp/index\_en.html                                                                                                                  | GeoTIFFs                   |                             |                              |                               |                            | P                          |                                                                                                                                                                                                                                                           |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Shuttle Radar Topography Mission (SRTM) Global   | 4             | Global (minus polar regions)                                                                                                                                                                                                                                                                                         | Shuttle Radar Topography Mission (SRTM) 30-meter digital elevation model. SRTM Digital Elevation Data Version 4. This version of the SRTM digital elevation data has been processed to fill data voids, and to facilitate its ease of use.                                                                                                                            | ee.Image("CGIAR/SRTM90\_V4")                                                          | https://srtm.csi.cgiar.org/srtmdata/                                                                                                                                     | GeoTIFFs                   |                             |                              |                               |                            | P                          | Jarvis A., H.I. Reuter, A. Nelson, E. Guevara, 2008, Hole-filled seamless SRTM data V4, International Centre for Tropical Agriculture (CIAT), available from http://srtm.csi.cgiar.org.                                                                   |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            | REFERENCES                                                                                                                                                                                                                                                |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            | Reuter H.I, A. Nelson, A. Jarvis, 2007, An evaluation of void filling interpolation methods for SRTM data, International Journal of Geographic Information Science, 21:9, 983-1008.                                                                       |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Shuttle Radar Topography Mission (SRTM) Global   | 3             | Global (minus polar regions)                                                                                                                                                                                                                                                                                         | SRTM Version 3: Elimination of the voids in the NASA SRTM DEM with elevation data primarily from the ASTER GDEM2 (Global Digital Elevation Model Version 2) and secondarily from the USGS GMTED2010 elevation model or the USGS National Elevation Dataset (NED).                                                                                                     | not available                                                                         | https://doi.org/10.5069/G9445JDF                                                                                                                                         | GeoTIFFs                   |                             |                              |                               | P                          | P                          | NASA Shuttle Radar Topography Mission (SRTM)(2013). Shuttle Radar Topography Mission (SRTM) Global. Distributed by OpenTopography. https://doi.org/10.5069/G9445JDF Accessed: 2021-11-01                                                                  |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| MERIT DEM                                        |               | covers land areas between 90N-60S                                                                                                                                                                                                                                                                                    | MERIT DEM a high accuracy global DEM at 3 arc second resolution (~90 m at the equator) produced by eliminating major error components from existing DEMs (NASA SRTM3 DEM, JAXA AW3D DEM, Viewfinder Panoramas DEM). MERIT DEM separates absolute bias, stripe noise, speckle noise and tree height bias using multiple satellite datasets and filtering techniques.   | ee.Image("MERIT/DEM/v1\_0\_3")                                                        | http://hydro.iis.u-tokyo.ac.jp/~yamadai/MERIT\_DEM/                                                                                                                      | GeoTIFFs                   |                             |                              |                               | P                          |                            | Yamazaki D., D. Ikeshima, R. Tawatari, T. Yamaguchi, F. O'Loughlin, J.C. Neal, C.C. Sampson, S. Kanae & P.D. Bates. A high accuracy map of global terrain elevations Geophysical Research Letters, vol.44, pp.5844-5853, 2017 doi: 10.1002/2017GL072874   |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GMTED                                            |               | This new product suite provides                                                                                                                                                                                                                                                                                      | Global Multi-resolution Terrain Elevation Data (GMTED2010), elevation dataset of choice for global and continental scale applications it incorporates the current best available global elevation data.                                                                                                                                                               | ee.Image("USGS/GMTED2010")                                                            | https://www.usgs.gov/core-science-systems/eros/coastal-changes-and-impacts/gmted2010?qt-science\_support\_page\_related\_con=0#qt-science\_support\_page\_related\_con   | GeoTIFFs                   | P                           | P                            | P                             |                            |                            | Danielson, J.J., and Gesch, D.B., 2011, Global multi-resolution terrain elevation data 2010 (GMTED2010): U.S. Geological Survey Open-File Report 2011–1073, 26 p.                                                                                         |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               | global coverage of all land areas from lat 84°N to 56°S formost products, and coverage from 84°N to 90°S for several products. Some areas, namely Greenland and Antarctica, do not have data available at the 15- and 7.5-arc-second resolutions because the input source data do not support that level of detail   |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | or                                                                                                                                                                       |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | https://earthexplorer.usgs.gov/                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GTOPO30                                          |               | Global coverage of all land areas                                                                                                                                                                                                                                                                                    | Older 1km resolution dataset. Not recommended for use as has now been superceded by newer products. Included in this table for reference as it was used as the source DEM for development of the Kapos Mountains maps in 2000 and 2002.                                                                                                                               | ee.Image("USGS/GTOPO30")                                                              | https://doi.org//10.5066/F7DF6PQS                                                                                                                                        | ArcInfo Grid               | P                           |                              |                               |                            |                            | **U.S. Geological Survey, 1996, GTOPO30.. https://doi.org/10.5066/F7DF6PQS **                                                                                                                                                                             |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | or                                                                                                                                                                       |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       |                                                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
|                                                  |               |                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                       |                                                                                       | https://earthexplorer.usgs.gov/                                                                                                                                          |                            |                             |                              |                               |                            |                            |                                                                                                                                                                                                                                                           |
+--------------------------------------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+-----------------------------+------------------------------+-------------------------------+----------------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Table X: Sources of DEM datasets with open access. Sources ranging from
coarse scale data at 1km resolution down to finer 30m resolution. The
most recent globally consistent product available at 90m and 30m
resolutions is the Copernicus DEM which is a Digital Surface Model (DSM)
which represents the surface of the Earth including buildings,
infrastructure and vegetation.

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
