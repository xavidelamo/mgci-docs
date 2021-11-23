Introduction to MGCI
====================

The Mountain Green Cover Index (MGCI) is designed to measure the
extent and the changes of green vegetation in mountain areas - i.e.
forest, shrubs, trees, pasture land, crop land, etc. – in order to
monitor progress towards the mountain target. MGCI is defined as the
percentage of green cover over the total surface of the mountain
region of a given country and for given reporting year. The aim of
the index is to monitor the evolution of the green cover and thus
assess the status of conservation of mountain ecosystems.

Please see the full metadata
`here <https://unstats.un.org/sdgs/metadata/files/Metadata-15-04-02.pdf>`_
for further information about the indicator.

The purpose of this document is explain the workflow and provide
countries with detailed technical guidance on how to develop a
nationally relevant mountain layer using the Kapos mountain method,
use a nationally relevant landcover map and compute the MGCI to
standard reporting tables required for the submission to FAO for
this indicator. and as well as providing some best practice in
combining layers at different resolutions. The standardisation of
the guidance will also help enable consistency of reporting between
countries and enable FAO to make the necessary regional and global
summaries.

**The workflow and guidance are provided to enable users to choose
from 3 different software:**

- Step-by-Step instructions in **QGIS (with R integration)**
- Step-by-Step instruction in **R** (plus and R-Script)
- SEPAL app: Users can register and log into the SEPAL data portal where a user-friendly interface will guide
   technicians through a series of menu-driven steps to prepare the
   mountain and vegetation descriptor layers before running the MGCI
   calculations. Users will be given the choice to upload their own data
   or choose from data already uploaded to the tool. The MGCI will be
   computed and outputs formatted to standard reporting tables.

Figure X: Simplified Workflow

Overview of Mountain Descriptor layer
-------------------------------------

Mountains can be defined with reference to a variety of parameters, such
as climate, elevation, ecology (Körner, Paulsen, & Spehn, 2011)
(Karagulle, et al., 2017). This methodology adheres to the UNEP- WCMC
mountain definition, relying in turn on the mountain description
proposed by (Kapos, Rhind, Edwards, Prince, & Ravilious, 2000). This
description classifies mountains according to altitude, slope and
elevation range into 6 categories.

+----------------------+-------------------------------------------------------------------------------------------------------------+
| **Mountain Class**   | **Description**                                                                                             |
+======================+=============================================================================================================+
| 1                    | Elevation > 4.500 meters                                                                                    |
+----------------------+-------------------------------------------------------------------------------------------------------------+
| 2                    | Elevation 3.500–4.500 meters                                                                                |
+----------------------+-------------------------------------------------------------------------------------------------------------+
| 3                    | Elevation 2.500–3.500 meters                                                                                |
+----------------------+-------------------------------------------------------------------------------------------------------------+
| 4                    | Elevation 1.500–2.500 meters and slope > 2                                                                  |
+----------------------+-------------------------------------------------------------------------------------------------------------+
| 5                    | Elevation 1.000–1.500 meters and slope > 5 or local elevation range (LER 7 kilometer radius) > 300 meters   |
+----------------------+-------------------------------------------------------------------------------------------------------------+
| 6                    | Elevation 300–1.000 meters and local elevation range (7 kilometer radius) > 300 meters                      |
+----------------------+-------------------------------------------------------------------------------------------------------------+

*Please note that (as per the methodology description in Kapos et. al.
2000), Inner isolated areas (<=25km2 in size) that don't meet criteria
but are surrounded by mountains are identified and merged into whichever
class they are surrounded by.*

Overview of Vegetation Descriptor layer
---------------------------------------

The vegetation descriptor layer categorizes land cover into green and
non-green areas. Green vegetation includes both natural vegetation and
vegetation resulting from anthropic activity (e.g. crops, afforestation,
etc.). Non-green areas include very sparsely vegetated areas, bare land,
water, permanent ice/snow and urban areas. The vegetation description
layer can be derived in different ways, but remote sensing based land
cover maps are the most convenient data source for this purpose, as they
provide the required information on green and non-green areas in a
spatially explicit manner and allow for comparison over time through
land cover change analysis. Currently, FAO uses land cover time series
produced by the European Space Agency (ESA) under the Climate Change
Initiative (CCI) as a general solution. The original CCI classes are
re-classified into six IPCC classes and further into binary
green/non-green cover classes as follows:

+---------------------------------------------------+--------------------+---------------------+
| ESA CCI class                                     | IPCC class         | Green / Non green   |
+===================================================+====================+=====================+
| 50, 60, 61, 62, 70, 71, 72, 80, 81, 82, 90, 100   | Forest\ :sup:`1`   | Green               |
+---------------------------------------------------+--------------------+---------------------+
| 110, 120, 121, 122, 130, 140,                     | Grassland          | Green               |
+---------------------------------------------------+--------------------+---------------------+
| 10,11, 12, 20, 30, 40                             | Cropland           | Green               |
+---------------------------------------------------+--------------------+---------------------+
| 160, 170, 180                                     | Wetland            | Non Green           |
+---------------------------------------------------+--------------------+---------------------+
| 190                                               | Settlement         | Non Green           |
+---------------------------------------------------+--------------------+---------------------+
| 150, 151, 152, 153, 200, 201, 202, 210, 220       | Other land         |  Non Green          |
+---------------------------------------------------+--------------------+---------------------+

:sup:`1` Please note, that here the term “Forest” refers to land cover,
not necessarily land use

Overview of computation of Mountain Green Cover Index
-----------------------------------------------------

Planimetric area calculation vs Real surface area calculation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To improve the accuracy of the mountain green cover index calculation a
decision has been made by FAO to calculate area using the standard
planimetric area and an additional real surface area. The real surface
area takes into account the third dimension of mountain surfaces
(Jenness 2004), giving a better and more accurate estimate of the true
mountain area in a country (Bian et al., 2020). For the purposes of the
MGCI, elevation data is used to calculate the real surface area
following the triangulation method developed by Jenness (2004).

|image2|

Disaggregation and standardised reporting tables 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The results of the MGCI are output to standard reporting tables in
tables using the following fields:

|image3|

Three levels of reporting are required

- Aggregated mountain green cover Index by Kapos mountain class

|image4|

- Area of mountain and area of green cover area within each Kapos
   mountain class

|image5|

- Area of mountain and green cover within each LULC class area and
   Kapos mountain class

|image6|

Potential / known limitations of current methodology
----------------------------------------------------

The indicator can be calculated using freely available Earth Observation
data and simple GIS operations that can be processed in free and open
source software (FOSS) GIS. Potential limitations of the above described
methodology are related mainly to the quality of the land cover data.
The ESA CCI land cover maps are currently available at 300 meter
resolution which limits their applicability in the monitoring of small
and highly heterogeneous landscapes. Therefore, if countries have
national land cover maps of higher spatial resolution and comparable or
better quality, FAO advises using them, following the same methodology
presented here, for the generation of MGCI values.

Regarding the interpretation of the indicator, although in the great
majority of cases the desired direction is an increase in green mountain
cover which reflects restriction of damage to natural ecosystems and
possibly even the expansion of forest, shrubland and grasslands through
conservation efforts, in more limited cases, an increase in the
indicator value in high elevation classes may also signify the
encroachment of vegetation on areas previously covered by glaciers or
other permanent or semi-permanent ice or snow layers, as a result of
global warming due to climate change. Such a change can be tracked with
the current methodology and flagged accordingly at the level of
disaggregated data by land cover type and elevation class, to
distinguish this case from the general desired trend of increasing
mountain green cover.

Acknowledgements
----------------

We would like to express our special thanks to Jeff Jenness from Jenness Enterprises, GIS Analysis and Application Design, for his help in the development of the real surface area.


.. |image2| image:: media_QGIS/image2.png
   :width: 2.35625in

.. |image3| image:: media_QGIS/image3.png
   :width: 2.35625in

.. |image4| image:: media_QGIS/image4.png
   :width: 2.35625in

.. |image5| image:: media_QGIS/image5.png
   :width: 2.35625in

.. |image6| image:: media_QGIS/image6.png
   :width: 2.35625in
