1. Introduction to MGCI
=======================

    The Mountain Green Cover Index (MGCI) is designed to measure the
    extent and the changes of green vegetation in mountain areas - i.e.
    forest, shrubs, trees, pasture land, crop land, etc. – in order to
    monitor progress towards the mountain target. MGCI is defined as the
    percentage of green cover over the total surface of the mountain
    region of a given country and for given reporting year. The aim of
    the index is to monitor the evolution of the green cover and thus
    assess the status of conservation of mountain ecosystems.

    Please see the full metadata
    `here <https://unstats.un.org/sdgs/metadata/files/Metadata-15-04-02.pdf>`__
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

1) Step-by-Step instructions in **QGIS (with R integration)**

2) Step-by-Step instruction in **R** (plus and R-Script)

3) **Google Earth Engine App**: Users can register and log into the
   SEPAL data portal where a user-friendly interface will guide
   technicians through a series of menu-driven steps to prepare the
   mountain and vegetation descriptor layers before running the MGCI
   calculations. Users will be given the choice to upload their own data
   or choose from data already uploaded to the tool. The MGCI will be
   computed and outputs formatted to standard reporting tables.

|imageworkflow|

Figure 1: Simplified Workflow

1.1 Overview of Mountain Descriptor layer
-----------------------------------------

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

1.2 Overview of Vegetation Descriptor layer
-------------------------------------------

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

**1.3 Overview of computation of Mountain Green Cover Index** 
--------------------------------------------------------------

1.3.1 Planimetric area calculation vs Real surface area calculation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To improve the accuracy of the mountain green cover index calculation a
decision has been made by FAO to calculate area using the standard
planimetric area and an additional real surface area. The real surface
area takes into account the third dimension of mountain surfaces
(Jenness 2004), giving a better and more accurate estimate of the true
mountain area in a country (Bian et al., 2020). For the purposes of the
MGCI, elevation data is used to calculate the real surface area
following the triangulation method developed by Jenness (2004).

|image0|

1.3.2 Disaggregation and standardised reporting tables 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The results of the MGCI are output to standard reporting tables in
tables using the following fields:

|image1|

Three levels of reporting are required

1) Aggregated mountain green cover Index by Kapos mountain class

|image2|

1) Area of mountain and area of green cover area within each Kapos
   mountain class

|image3|

1) Area of mountain and green cover within each LULC class area and
   Kapos mountain class

|image4|

1.4 Potential / known limitations of current methodology
--------------------------------------------------------

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

.. |image0| image:: media_QGIS/image2.png
   :width: 6.26806in
   :height: 3.16875in
.. |image1| image:: media_QGIS/image3.png
   :width: 6.26806in
   :height: 5.06528in
.. |image2| image:: media_QGIS/image4.png
   :width: 6.26806in
   :height: 0.81458in
.. |image3| image:: media_QGIS/image5.png
   :width: 6.26806in
   :height: 1.65347in
.. |image4| image:: media_QGIS/image6.png
   :width: 6.26806in
   :height: 3.97847in
.. |image5| image:: media_QGIS/image7.png
   :width: 5.97917in
   :height: 4.25867in
.. |image6| image:: media_QGIS/image8.png
   :width: 6.03472in
   :height: 4.75909in
.. |image7| image:: media_QGIS/image9.png
   :width: 6.26806in
   :height: 4.46458in
.. |image8| image:: media_QGIS/image10.png
   :width: 6.26806in
   :height: 3.33742in
.. |image9| image:: media_QGIS/image11.png
   :width: 5.52160in
   :height: 0.94805in
.. |image10| image:: media_QGIS/image12.png
   :width: 6.26806in
   :height: 3.70278in
.. |image11| image:: media_QGIS/image13.png
   :width: 4.42770in
   :height: 4.71941in
.. |image12| image:: media_QGIS/image14.png
   :width: 4.42653in
   :height: 4.71816in
.. |image13| image:: media_QGIS/image15.png
   :width: 3.44840in
   :height: 1.83359in
.. |image14| image:: media_QGIS/image16.png
   :width: 0.43750in
   :height: 0.35417in
.. |image15| image:: media_QGIS/image17.png
   :width: 3.21875in
   :height: 1.13542in
.. |image16| image:: media_QGIS/image18.png
   :width: 6.26806in
   :height: 2.56667in
.. |image17| image:: media_QGIS/image19.png
   :width: 2.32263in
   :height: 0.97904in
.. |image18| image:: media_QGIS/image20.png
   :width: 6.26806in
   :height: 3.45417in
.. |image19| image:: media_QGIS/image21.png
   :width: 5.21948in
   :height: 1.75024in
.. |image20| image:: media_QGIS/image22.png
   :width: 1.95347in
   :height: 2.17361in
.. |image21| image:: media_QGIS/image23.png
   :width: 5.10417in
   :height: 1.21875in
.. |image22| image:: media_QGIS/image24.png
   :width: 5.75000in
   :height: 3.93750in
.. |image23| image:: media_QGIS/image25.png
   :width: 0.29861in
   :height: 0.29276in
.. |image24| image:: media_QGIS/image26.png
   :width: 6.26806in
   :height: 3.40417in
.. |image25| image:: media_QGIS/image27.png
   :width: 6.26806in
   :height: 3.59931in
.. |image26| image:: media_QGIS/image28.png
   :width: 3.18056in
   :height: 2.63633in
.. |image27| image:: media_QGIS/image29.png
   :width: 6.26806in
   :height: 2.40000in
.. |image28| image:: media_QGIS/image30.png
   :width: 5.48788in
   :height: 5.13889in
.. |image29| image:: media_QGIS/image31.png
   :width: 5.43750in
   :height: 3.10009in
.. |image30| image:: media_QGIS/image32.png
   :width: 3.37547in
   :height: 4.79234in
.. |image31| image:: media_QGIS/image33.png
   :width: 6.26806in
   :height: 2.66389in
.. |image32| image:: media_QGIS/image34.png
   :width: 5.65728in
   :height: 1.02917in
.. |image33| image:: media_QGIS/image35.png
   :width: 4.00355in
   :height: 1.62431in
.. |image34| image:: media_QGIS/image36.png
   :width: 1.74534in
   :height: 1.62292in
.. |image35| image:: media_QGIS/image37.png
   :width: 5.29167in
   :height: 6.63899in
.. |image36| image:: media_QGIS/image38.png
   :width: 6.28139in
   :height: 0.35833in
.. |image37| image:: media_QGIS/image39.png
   :width: 6.28125in
   :height: 5.64371in
.. |image38| image:: media_QGIS/image40.png
   :width: 5.73024in
   :height: 0.27500in
.. |image39| image:: media_QGIS/image41.png
   :width: 6.26806in
   :height: 5.45486in
.. |image40| image:: media_QGIS/image42.png
   :width: 2.46597in
   :height: 2.24167in
.. |image41| image:: media_QGIS/image43.png
   :width: 6.26806in
   :height: 2.72569in
.. |image42| image:: media_QGIS/image44.png
   :width: 6.26806in
   :height: 6.17639in
.. |image43| image:: media_QGIS/image45.png
   :width: 6.26806in
   :height: 5.56458in
.. |image44| image:: media_QGIS/image46.png
   :width: 6.26806in
   :height: 1.33194in
.. |image45| image:: media_QGIS/image47.png
   :width: 6.26806in
   :height: 2.48403in
.. |image46| image:: media_QGIS/image48.png
   :width: 6.10502in
   :height: 3.58383in
.. |image47| image:: media_QGIS/image49.png
   :width: 4.54167in
   :height: 2.21453in
.. |image48| image:: media_QGIS/image50.png
   :width: 5.50833in
   :height: 3.71962in
.. |image49| image:: media_QGIS/image51.png
   :width: 3.48021in
   :height: 2.14167in
.. |image50| image:: media_QGIS/image52.png
   :width: 5.49984in
   :height: 6.74167in
.. |image51| image:: media_QGIS/image53.png
   :width: 5.50764in
   :height: 2.87097in
.. |image52| image:: media_QGIS/image54.png
   :width: 5.79167in
   :height: 3.75759in
.. |image53| image:: media_QGIS/image55.png
   :width: 5.79572in
   :height: 3.78333in
.. |image54| image:: media_QGIS/image56.png
   :width: 4.08390in
   :height: 1.31268in
.. |image55| image:: media_QGIS/image57.png
   :width: 6.26806in
   :height: 9.07222in
.. |image56| image:: media_QGIS/image58.png
   :width: 3.43128in
   :height: 4.10833in
.. |image57| image:: media_QGIS/image54.png
   :width: 6.26806in
   :height: 4.06667in
.. |image58| image:: media_QGIS/image59.png
   :width: 2.63578in
   :height: 1.68774in
.. |image59| image:: media_QGIS/image60.png
   :width: 5.28584in
   :height: 6.92500in
.. |image60| image:: media_QGIS/image61.png
   :width: 4.97917in
   :height: 0.51042in
.. |image61| image:: media_QGIS/image62.png
   :width: 4.84861in
   :height: 7.35000in
.. |image62| image:: media_QGIS/image58.png
   :width: 3.35417in
   :height: 4.01667in
.. |image63| image:: media_QGIS/image54.png
   :width: 6.26806in
   :height: 4.06667in
.. |image64| image:: media_QGIS/image63.png
   :width: 6.21606in
   :height: 2.15833in
.. |image65| image:: media_QGIS/image64.png
   :width: 2.73125in
   :height: 2.93333in
.. |image66| image:: media_QGIS/image65.png
   :width: 6.26806in
   :height: 5.58958in
.. |image67| image:: media_QGIS/image66.png
   :width: 5.72500in
   :height: 4.53763in
.. |image68| image:: media_QGIS/image67.png
   :width: 5.72500in
   :height: 4.09871in
.. |image69| image:: media_QGIS/image68.png
   :width: 6.26806in
   :height: 6.30417in
.. |image70| image:: media_QGIS/image69.png
   :width: 2.16667in
   :height: 2.37500in
.. |image71| image:: media_QGIS/image70.png
   :width: 3.29167in
   :height: 0.96306in
.. |image72| image:: media_QGIS/image71.png
   :width: 5.73333in
   :height: 4.20440in
.. |image73| image:: media_QGIS/image72.png
   :width: 5.70000in
   :height: 5.32741in
.. |image74| image:: media_QGIS/image73.png
   :width: 6.26806in
   :height: 4.20000in
.. |image75| image:: media_QGIS/image74.png
   :width: 5.83333in
   :height: 9.69306in
.. |image76| image:: media_QGIS/image75.png
   :width: 6.26806in
   :height: 4.29028in
.. |image77| image:: media_QGIS/image76.png
   :width: 5.39167in
   :height: 2.82486in
.. |image78| image:: media_QGIS/image77.png
   :width: 2.50000in
   :height: 1.23056in
.. |image79| image:: media_QGIS/image78.png
   :width: 5.73038in
   :height: 5.49167in
.. |image80| image:: media_QGIS/image79.png
   :width: 2.85556in
   :height: 3.19167in
.. |image81| image:: media_QGIS/image80.png
   :width: 2.65833in
   :height: 1.71265in
.. |image82| image:: media_QGIS/image81.png
   :width: 5.73652in
   :height: 4.69167in
.. |image83| image:: media_QGIS/image82.png
   :width: 6.26806in
   :height: 1.17917in
.. |image84| image:: media_QGIS/image83.png
   :width: 2.64583in
   :height: 1.10417in
.. |image85| image:: media_QGIS/image84.png
   :width: 6.23190in
   :height: 5.26667in
.. |image86| image:: media_QGIS/image85.png
   :width: 2.35625in
   :height: 2.03333in
.. |image87| image:: media_QGIS/image86.png
   :width: 6.26806in
   :height: 5.91944in
.. |image88| image:: media_QGIS/image80.png
   :width: 2.65833in
   :height: 1.71250in
.. |image89| image:: media_QGIS/image87.png
   :width: 5.77619in
   :height: 4.87578in
.. |image90| image:: media_QGIS/image88.png
   :width: 6.26806in
   :height: 4.38403in
.. |image91| image:: media_QGIS/image89.png
   :width: 3.06973in
   :height: 3.67361in
.. |image92| image:: media_QGIS/image90.png
   :width: 6.26806in
   :height: 5.98125in
.. |image93| image:: media_QGIS/image91.png
   :width: 1.62500in
   :height: 1.30208in
.. |image94| image:: media_QGIS/image92.png
   :width: 5.70718in
   :height: 7.59524in
.. |image95| image:: media_QGIS/image93.png
   :width: 6.26806in
   :height: 8.21042in
.. |image96| image:: media_QGIS/image94.png
   :width: 2.14147in
   :height: 0.82576in
.. |image97| image:: media_QGIS/image95.png
   :width: 1.31645in
   :height: 1.62121in
.. |image98| image:: media_QGIS/image96.png
   :width: 1.31509in
   :height: 1.62121in
.. |image99| image:: media_QGIS/image97.png
   :width: 5.78451in
   :height: 5.33333in
.. |image100| image:: media_QGIS/image98.png
   :width: 6.26806in
   :height: 4.53472in
.. |image101| image:: media_QGIS/image99.png
   :width: 6.26806in
   :height: 5.02847in
.. |image102| image:: media_QGIS/image100.png
   :width: 6.26806in
   :height: 5.02986in
.. |image103| image:: media_QGIS/image101.png
   :width: 6.26806in
   :height: 5.02708in
.. |image104| image:: media_QGIS/image101.png
   :width: 6.26806in
   :height: 5.02708in
.. |image105| image:: media_QGIS/image102.png
   :width: 6.26806in
   :height: 5.02847in
.. |image106| image:: media_QGIS/image103.png
   :width: 6.26806in
   :height: 5.24306in
.. |image107| image:: media_QGIS/image104.png
   :width: 6.26806in
   :height: 4.55556in
.. |image108| image:: media_QGIS/image105.png
   :width: 5.97917in
   :height: 4.75366in
.. |image109| image:: media_QGIS/image106.png
   :width: 5.85417in
   :height: 2.86158in
.. |image110| image:: media_QGIS/image107.png
   :width: 6.26806in
   :height: 4.50139in
.. |image111| image:: media_QGIS/image108.png
   :width: 6.26806in
   :height: 5.53472in
.. |image112| image:: media_QGIS/image109.png
   :width: 6.26806in
   :height: 4.48333in
.. |image113| image:: media_QGIS/image110.png
   :width: 6.26806in
   :height: 4.56111in
.. |image114| image:: media_QGIS/image111.png
   :width: 6.26806in
   :height: 4.44792in
.. |image115| image:: media_QGIS/image112.png
   :width: 3.09722in
   :height: 1.37500in
.. |image116| image:: media_QGIS/image113.png
   :width: 6.26806in
   :height: 4.59236in
.. |image117| image:: media_QGIS/image114.png
   :width: 6.26806in
   :height: 4.45694in
.. |image118| image:: media_QGIS/image115.png
   :width: 6.26806in
   :height: 4.60278in
.. |image119| image:: media_QGIS/image116.png
   :width: 6.26806in
   :height: 3.34861in
.. |image120| image:: media_QGIS/image117.png
   :width: 6.26806in
   :height: 6.40000in
.. |image121| image:: media_QGIS/image118.png
   :width: 6.26806in
   :height: 3.95486in
.. |image122| image:: media_QGIS/image119.png
   :width: 6.26806in
   :height: 3.39167in
.. |image123| image:: media_QGIS/image120.png
   :width: 6.26806in
   :height: 5.17708in
.. |image124| image:: media_QGIS/image121.png
   :width: 6.26806in
   :height: 4.38403in
.. |image125| image:: media_QGIS/image122.png
   :width: 6.26806in
   :height: 5.07500in
.. |image126| image:: media_QGIS/image123.png
   :width: 6.26806in
   :height: 5.04306in
.. |image127| image:: media_QGIS/image124.png
   :width: 6.26806in
   :height: 5.04375in
.. |image128| image:: media_QGIS/image125.png
   :width: 6.26806in
   :height: 5.05625in
.. |image129| image:: media_QGIS/image126.png
   :width: 6.26806in
   :height: 5.05208in
.. |image130| image:: media_QGIS/image127.png
   :width: 5.71528in
   :height: 0.77630in
.. |image131| image:: media_QGIS/image128.png
   :width: 5.22222in
   :height: 3.12836in
.. |image132| image:: media_QGIS/image129.png
   :width: 6.26806in
   :height: 1.42500in
.. |image133| image:: media_QGIS/image130.png
   :width: 6.26806in
   :height: 5.07083in
.. |image134| image:: media_QGIS/image131.png
   :width: 6.26806in
   :height: 3.82639in
.. |image135| image:: media_QGIS/image132.png
   :width: 1.74653in
   :height: 1.97917in
.. |image136| image:: media_QGIS/image133.png
   :width: 4.58472in
   :height: 2.31944in
.. |image137| image:: media_QGIS/image134.png
   :width: 6.26806in
   :height: 3.19861in
.. |image138| image:: media_QGIS/image135.png
   :width: 6.26806in
   :height: 6.41458in
.. |image139| image:: media_QGIS/image136.png
   :width: 6.26806in
   :height: 4.29028in
.. |image140| image:: media_QGIS/image137.png
   :width: 6.10208in
   :height: 3.16513in
.. |image141| image:: media_QGIS/image138.png
   :width: 6.10208in
   :height: 3.16056in
.. |image142| image:: media_QGIS/image139.png
   :width: 6.13889in
   :height: 0.51146in
.. |image143| image:: media_QGIS/image140.png
   :width: 6.14021in
   :height: 4.06549in
.. |image144| image:: media_QGIS/image141.png
   :width: 6.13092in
   :height: 1.95833in
.. |image145| image:: media_QGIS/image142.png
   :width: 6.13869in
   :height: 1.52778in
.. |image146| image:: media_QGIS/image143.png
   :width: 1.38205in
   :height: 0.21154in
.. |image147| image:: media_QGIS/image144.png
   :width: 3.60467in
   :height: 2.18781in
.. |image148| image:: media_QGIS/image145.png
   :width: 5.75000in
   :height: 4.76172in
.. |image149| image:: media_QGIS/image146.png
   :width: 5.71528in
   :height: 4.75941in
.. |image150| image:: media_QGIS/image147.png
   :width: 5.70139in
   :height: 4.76269in
.. |image151| image:: media_QGIS/image148.png
   :width: 6.02167in
   :height: 4.97986in
.. |image152| image:: media_QGIS/image149.png
   :width: 5.70833in
   :height: 4.72891in
.. |image153| image:: media_QGIS/image150.png
   :width: 5.93833in
   :height: 4.95903in
.. |image154| image:: media_QGIS/image151.png
   :width: 5.99042in
   :height: 5.01112in
.. |image155| image:: media_QGIS/image152.png
   :width: 6.00084in
   :height: 4.91735in
.. |image156| image:: media_QGIS/image153.png
   :width: 6.26806in
   :height: 2.67639in
.. |image157| image:: media_QGIS/image154.png
   :width: 6.26806in
   :height: 4.40000in
.. |image158| image:: media_QGIS/image155.png
   :width: 5.43001in
   :height: 2.79001in
.. |image159| image:: media_QGIS/image156.png
   :width: 5.07668in
   :height: 3.08334in
.. |image160| image:: media_QGIS/image157.png
   :width: 2.07279in
   :height: 0.21970in
.. |image161| image:: media_QGIS/image158.png
   :width: 6.26806in
   :height: 4.84861in
.. |image162| image:: media_QGIS/image159.png
   :width: 6.26806in
   :height: 4.88403in
.. |image163| image:: media_QGIS/image160.png
   :width: 6.26806in
   :height: 4.86875in
.. |image164| image:: media_QGIS/image161.png
   :width: 6.26806in
   :height: 4.86875in
.. |image165| image:: media_QGIS/image162.png
   :width: 6.26806in
   :height: 4.89653in
.. |image166| image:: media_QGIS/image163.png
   :width: 6.26806in
   :height: 6.27569in
.. |image167| image:: media_QGIS/image164.png
   :width: 5.33408in
   :height: 5.05279in
.. |image168| image:: media_QGIS/image165.png
   :width: 6.26806in
   :height: 4.42014in
.. |image169| image:: media_QGIS/image166.png
   :width: 6.26806in
   :height: 1.02222in
.. |imageworkflow| image:: media_QGIS/MGCI_workflow_Beta_simplified_workflow.png
   :width: 6.26806in
   :height: 1.02222in
   
