
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
explored various options but in the end opted we opted to project the DEM to an
equidistant projection to enable a consistent approach to be taken by
all countries and this was the method used in the 2002 Kapos mountain layer
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

Understanding scale vs resolution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The scale of a vector dataset is usually expressed in a similar way to paper maps, i.e. in a ratio to show the amount of reduction from the real world e.g.  1:50,000. A country’s vector LULC map will have been created at a particular scale. determined by the Minimum Mapping Unit. i.e. the size of the smallest feature. A nominal scale is will have been assigned to the dataset to reflect the scale at which the data were collected and mapped. Conversion to raster requires this scale to be converted to a resolution, i.e. an appropriate pixel size for the scale of the data.                                                              |

To calculate map scale there are two parameters:  ground resolution and screen resolution.  

.. math:: scale = 1: (resolution * PPI / 0.0254)  or    resolution = scale * 0.0254/PPI 

**Where**:   

**resolution** =  ground resolution (the size in (m) that a pixel represents. 

**PPI** =  the screen resolution (pixels number that every inch contains on the screen (default 96dpi). 

**0.0254** = (m/inch),  the unit conversion between meter and inches. 

**scale** = nominal scale of vector dataset                                                                                                                        

Some examples are provided in the table below:        

|imagescale_table| 

(source: https://enonline.supermap.com/iExpress9D/Appendix/scale.htm)


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

|image33|

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
(km\ :sup:`2`\ between classes relative to the areas derived from the
native data, the difference was not statistically different.



|image167|

Table 1: Sources of DEM datasets with open access. Sources ranging from
coarse scale data at 1km resolution down to finer 30m resolution. The
most recent globally consistent product available at 90m and 30m
resolutions is the Copernicus DEM which is a Digital Surface Model (DSM)
which represents the surface of the Earth including buildings,
infrastructure and vegetation.



.. |image33| image:: media_QGIS/image33.png
   :width: 1200

.. |image167| image:: media_QGIS/image167.png
   :width: 1200
   
.. |imagescale_table| image:: media_QGIS/scale_table.png
   :width: 500
