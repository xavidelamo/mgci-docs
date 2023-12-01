Background
==========
SDG Indicator 15.4.2 is one of the two indicators under SDG Target 15.4, which aims to "*ensure the conservation of mountain ecosystems, including their biodiversity, to enhance their capacity to provide benefits which are essential for sustainable development*". The Food and Agriculture Organization (FAO) of the United Nations is the custodian agency of this indicator.

The indicator is composed of two sub-indicators to monitor progress towards the conservation of mountain ecosystems.


Overview of computation of Sub-Indicator a) Mountain Green Cover Index
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Sub-indicator 15.4.2a**, Mountain Green Cover Index (MGCI), is designed to measure the extent and changes of green cover - i.e. forest, shrubs, trees, pasture land, cropland, etc. – in mountain areas. MGCI is defined as the percentage of green cover over the total surface of the mountain area of a given country and for given reporting year. The aim of the index is to monitor the evolution of the green cover and thus assess the status of conservation of mountain ecosystems.

.. math::

    MGCI = (Mountain Green Cover Area)/(Total Mountain Area)

Where:

- **Mountain Green Cover Area n** = Sum of areas (in km2) covered by (1) tree-covered areas, (2) croplands,(3) grasslands, (4) shrub-covered areas and (5) shrubs and/or herbaceous vegetation, aquatic or regularly flooded classes in the reporting period n
- **Total mountain area** = Total area of mountains (in km2). In both the numerator and denominator, mountain area is defined according to UNEP-WCMC (2002).


Overview of computation of Sub-Indicator b) Proportion of degraded mountain land
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Sub-indicator 15.4.2b**, Proportion of degraded mountain land, is designed to monitor the extent of degraded mountain land as a result of land cover change of a given country and for given reporting year. Similarly to sub-indicator ‘’trends in land cover” under SDG Indicator 15.3.1 (Sims et al. 2021), mountain ecosystem degradation and recovery is assessed based on the definition of land cover type transitions that constitute degradation, as either improving, stable or degraded. The definition of degradation adopted for the computation of this indicator is the one established Intergovernmental Science-Policy Platform on Biodiversity and Ecosystem Services (IPBES)footnote reference [1]_.

.. math::

   Proportion Of Degraded Mountain Land = \\
   (Degraded Mountain Area n) / (Total Mountain Area) * 100

Where:

- **Degraded mountain area n** = Total degraded mountain area (in km2) in the reporting period n. This is, the sum of the areas where land cover change is considered to constitute degradation from the baseline period. Degraded mountain land will be assessed based on the land cover transition matrix in Annex 1.
- **Total mountain area** = Total area of mountains (in km2). In both the numerator and denominator, mountain area is defined according to UNEP-WCMC (2002).

If the country/region has no mountain area, it will be assigned value NA

.. [1]IPBES defines land degradation as “the many human-caused processes that drive the decline or loss in biodiversity, ecosystem functions or ecosystem services in any terrestrial and associated aquatic ecosystems” (IPBES, 2018)


**Disaggregation:**

Both of these sub-indicators are disaggregated by mountain bioclimatic belts as defined by Körner et al. (2011). In addition, sub-indicator 15.4.2a is
disaggregated by the 10 SEEA classes based on UN Statistical Division (2014).  Those values are reported both as proportions (percent) and area (in square kilometres)


|imageworkflow|

Figure 1: Simplified Workflow (still need to edit and upload latest)


Overview of Mountain Area Map
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Several methodologies have been developed in the last decades to consistently classify and map global mountain systems, using a variety of parameters such as elevation, topography, climate and ecology.

For the purposes of standardization and international comparability of nationally derived-estimates, this indicator adheres to the UNEP-WCMC mountain definition (UNEP-WCMC, 2002). The UNEP-WCMC method defines total global mountain area as the sum of seven classes (commonly known as ‘Kapos mountain classes’), based on elevation, slope and local elevation ranges parameters. The mapping of mountain areas using this methodology requires a Digital Elevation Model (DEM).

For disaggregation purposes, this mountain area is subdivided into bioclimatic belts as defined by Körner et al. (2011). Körner et al. subdivides mountains vertically into seven bioclimatic belts based on average temperatures, therefore accounting the latitudinal change in elevation of thermally similar areas in the world’s mountains. For the purposes of this indicator, these seven bioclimatic belts are aggregated into four (Nival, Alpine, Montane and Remaining mountain areas), as illustrated in Table 1.

**Table 1.** Mountain bioclimatic belts as defined by Körner et al. (2011) and reclassification for data disaggregation of SDG Indicator 15.4.2. Growing season is defined as the number of days between daily mean temperature exceeds 0.9 °C then falls below 0.9 °C

+----------------------+-----------------------+------------------+-------------------------------+
| **Bioclimatic**      |**Growning season**    |**Growing season**|**Bioclimatic belts adopted**  |
|  **Belts**           | **mean temperature**  |  **length**      | **for SDG Indicator 15.4.2**  |
+======================+=======================+==================+===============================+
| Nival                | < 3.5 °C              | < 10 days        | Nival                         |
+----------------------+-----------------------+------------------+-------------------------------+
| Upper alpine         | < 3.5 °C              | > 10 days &      |                               |
|                      |                       | < 54 days        | Alpine                        |
+----------------------+-----------------------+------------------+                               |
| Lower alpine         | < 6.4°C               | < 54 days        |                               |
+----------------------+-----------------------+------------------+-------------------------------+
|...........................................................................THE TREELINE..........|
+----------------------+-----------------------+------------------+-------------------------------+
| Upper montane        | > 6.4°C & ≤ 10 °C     | ---              | Montane                       |
+----------------------+-----------------------+                  |                               |
| Lower montane        | > 10 °C & ≤ 15 °C     |                  |                               |
+----------------------+-----------------------+------------------+-------------------------------+
| Remaining mountain   | > 15 °C               | ---              | Remaining mountain            |
| area with frost      |                       |                  | area                          |
+----------------------+-----------------------+                  |                               |
| Remaining mountain   |                       |                  |                               |
| area without frost   | > 15 °C               |                  |                               |
+----------------------+-----------------------+------------------+-------------------------------+


A global mountain area map sub-divided by bioclimatic belts has been developed by FAO and made available to national authorities to facilitate the computation of this indicator. This map is the result of combining a global mountain area map developed from the Global Multi-Resolution Terrain Elevation Data (GMTED2010), following the UNEP-WCMC methodology (Ravilious et al. 2021) and a mountain bioclimatic belt map created by the Global Mountain Biodiversity Assessment

Overview of the land cover data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Land cover refers to the observed physical cover of the Earth’s surface. It includes vegetation and manmade features as well as bare rock, bare soil and inland water surfaces (FAO-GTOS, 2009). The primary units for characterizing land cover are categories (e.g. Forest or Open Water). These categories must be defined following a standardized land cover
classification in order to identify land cover changes consistently over time.

Several global standards of land cover classifications have been developed by international initiatives for this purpose. For the purposes of standardization and harmonization when reporting on SDG Indicator 15.4.2, this indicator has adapted the land cover classification established by the United Nations Statistical Commission’s System of Environmental and Economic Accounting (UN-SEEA)(UN Statistical Division, 2014) by selecting the most relevant SEEA classes for mountain ecosystems and aggregating all croplands classes in the following classification (Table 2).


**Table 2 Adapted UN-SEEA land cover classification for the computation and aggregate reporting on SDG Indicator 15.4.2.**

.. table::
    :widths: 30 50

    +---------------------------------------+--------------------------------------------------------------+
    | **Land cover class**                  | **Description**                                              |
    +=======================================+==============================================================+
    | 1. Artificial surfaces                | The class is composed of any type of areas                   |
    |                                       | with a predominant artificial surface. Any urban             |
    |                                       | or related feature is included in this class, for            |
    |                                       | example, urban parks (parks, parkland and laws).             |
    |                                       | The class also includes industrial areas, and waste          |
    |                                       | dump deposit and extraction sites.                           |
    +---------------------------------------+--------------------------------------------------------------+
    | 2. Croplands                          | The class is composed of cultivated vegetation, including    |
    |                                       | herbaceous plants, trees and/or shurbs. It includes:         |
    |                                       |- Herbaceous crops used for hay. All the non-perennial        |
    |                                       |  crops that do not last for more than two growing seasons    |
    |                                       |  and crops like sugar cane, where the upper part of the      |
    |                                       |  plant is regularly harvested while the root system can      |
    |                                       |  remain for more than one year in the field, are included    |
    |                                       |  in this class.                                              |
    |                                       |                                                              |
    |                                       |- All types of orchards and plantations (fruit trees,         |
    |                                       |  coffee and tea plantation, oil palms, rubber plantation,    |
    |                                       |  Christmas trees, etc.).                                     |
    |                                       |                                                              |
    |                                       |- Multiple or layered crops, including areas with two         |
    |                                       |  layers of different crops and/or areas with the presence    |
    |                                       |  of one important layer of natural vegetation (mainly        |
    |                                       |  trees) that covers one layer of cultivated crop.            |
    +---------------------------------------+--------------------------------------------------------------+
    | 3. Grasslands                         | This class includes any geographical area dominated by       |
    |                                       | natural herbaceous plants (grasslands, prairies, steppes     |
    |                                       | and savannahs) with a cover of 10 per cent or more,          |
    |                                       | irrespective of different human and/or animal activities,    |
    |                                       | such as grazing or selective fire management. Woody plants   |
    |                                       | (trees and/or shrubs) can be present, assuming their cover   |
    |                                       | is less that 10 per cent.                                    |
    +---------------------------------------+--------------------------------------------------------------+
    | 4. Tree-covered areas                 | This class includes any geographical area dominated by       |
    |                                       | natural tree plants with a cover of 10 per cent or more.     |
    |                                       | Other types of plants (shrubs and/or herbs) can be present,  |
    |                                       | even with a density higher than that of trees. Areas planted |
    |                                       | with trees for afforestation purposes and forest plantations |
    |                                       | are included in this class. This class includes areas        |
    |                                       | seasonally or permanently flooded with freshwater.           |
    +---------------------------------------+--------------------------------------------------------------+
    | 5. Shrub-covered areas                | This class includes any geographical area dominated by       |
    |                                       | natural shrubs having a cover of 10 per cent or more.        |
    |                                       | Trees can be present in scattered form if their cover is     |
    |                                       | less than 10 per cent. Herbaceous plants can also be present |
    |                                       | at any density. The class includes shrub-covered areas       |
    |                                       | permanently or regularly flooded by inland fresh water.      |
    +---------------------------------------+--------------------------------------------------------------+
    | 6. Shubs and/or herbaceous vegetation,| This class includes any geographical area dominated by       |
    |    aquatic or regularly flooded       | natural herbaceous vegetation (cover of 10 per cent or more) |
    |                                       | that is permanently or regularly flooded by fresh or brackish|
    |                                       | water (swamps, marsh areas, etc.). Flooding must persist for |
    |                                       | at least two months per year to be considered regular.       |
    |                                       | Woody vegetation (trees and/or shrubs) can be present if     |
    |                                       | their cover is less than 10 per cent.                        |
    +---------------------------------------+--------------------------------------------------------------+
    | 7. Sparsely natural vegetated areas   | This class includes any geographical areas were the cover of |
    |                                       | natural vegetation is between 2 per cent and 10 per cent.    |
    |                                       | This includes permanently or regularly flooded areas.        |
    +---------------------------------------+--------------------------------------------------------------+
    | 8. Terrestrial barren land            | This class includes any geographical area dominated by       |
    |                                       | natural abiotic surfaces (bare soil, sand, rocks, etc.)      |
    |                                       | where the natural vegetation is absent or almost absent      |
    |                                       | (covers less than 2 per cent). The class includes areas      |
    |                                       | regularly flooded by inland water (lake shores, river banks, |
    |                                       | salt flats, etc.).                                           |
    +---------------------------------------+--------------------------------------------------------------+
    | 9. Permanent snow and glaciers        | This class includes any geographical area covered by snow    |
    |                                       | or glaciers persistently for 10 months or more.              |
    +---------------------------------------+--------------------------------------------------------------+
    | 10. Inland water bodies               | This class includes any geographical area covered for most of|
    |                                       | the year by inland water bodies. In some cases, the water can|
    |                                       | be frozen for part of the year (less than 10 months). Because|
    |                                       | the geographical extent of water bodies can change,          |
    |                                       | boundaries must be set consistently with those set by class  |
    |                                       | 8, according to the dominant situation during the year and/or|
    |                                       | across multiple years.                                       |
    +---------------------------------------+--------------------------------------------------------------+

Land cover maps developed by relevant national authorities will generally provide the most relevant data source to compute this indicator. However, in certain cases, such data may not be available. In those cases, various regional or global products provide a viable alternative.

The global default source of land cover data for this indicator is the European Space Agency Climate Change Initiative (ESA-CCI) Land Cover product (ESA, 2017). The ESA-CCI product consists of a series of annual Land Cover maps at 300 m resolution, providing 22 land cover classes based on 300m MERIS, 1km SPOT – VEGETATION, 1km PROBA –V and 1km AVHRR. The ESA CCI adheres to the Cover Classification System of the United Nations Food and Agriculture Organization (UN FAO) (Santoro et al. 2015). Annual updates are currently available from 1992 to 2020. Additional years will be made available by the European Space Agency


Planimetric area calculation vs Real surface area calculation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Area calculation is an important component of the methodology to calculate SDG Indicator 15.4.2. Many of the algorithms used by default in some of the most widely used geospatial software tools and cloud-based platforms calculate area values based on 2-dimensional representations of the features on the Earth’s surface, commonly known as planimetric maps. In mountain regions, this method is known to significantly underestimate area values due to the complex topography of mountain landscapes. To address this, methods have been developed to take into account the third dimension of mountain surfaces through the use of digital elevation models and, in this way, obtain closer estimates of the real surface area of mountain regions.

To improve the accuracy of the calculation of SDG Indicator 15.4.2, this analytical workflow allows users to calculate indicator values based on both, planimetric area and real surface area. The method used to calculate real surface area values is based on Jenness (2004).

|image2|



Potential / known limitations of current methodology
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Recognizing that this indicator cannot fully capture the complexity of mountain ecosystems across the world, national authorities are encouraged to use other relevant national or sub-national indicators, data, and information to strengthen their interpretation, as well as taking into account the following limitations:

- Sub-indicator 15.4.2a should be interpreted with care given that: 1) lack of green cover does not necessarily mean that a particular mountain area is degraded (i.e. areas of permanent snow and ice, scree slopes and natural sparsely vegetated areas above the tree line, 2) it does not capture significant drivers of change such as conversion of natural areas to cropland or pastureland, and 3) increase in green cover may due to impacts of climate change in mountain areas (i.e. increase in green cover due to snow and glacier retreat due to global warming).

- Because land cover refers to the naturally stable aspects of land and the structure of its key elements, transient aspects such as changes in vegetation phenology, snow or flooding dynamics cannot be captured by land cover transitions as measured in sub-indicator 15.4.2b. In the context of SDG Target 15.4, this is particularly relevant for snow cover dynamics (snow cover duration within a year).

- Both sub-indicators are not able to capture ecosystem degradation drivers that do not necessarily result in changes in land cover.

- Area estimations based on remote-sensing-derived land cover maps via pixel counting may lead to biased area estimates due to map errors. National authorities are encouraged to further refine those estimates by comparing them against reference datasets and applying bias corrections.


Further information on the methdolofy is available at ` <https://unstats.un.org/sdgs/metadata/files/Metadata-15-04-02.pdf>`.


Acknowledgements
^^^^^^^^^^^^^^^^

We would like to express our special thanks to Jeff Jenness from Jenness Enterprises, GIS Analysis and Application Design, for his help in the development of the real surface area.

References
^^^^^^^^^^

Jenness, J.S. (2004). Calculating landscape surface area from digital elevation models. Wildlife Society Bulletin, 32: 829-839

IPBES (2018): Summary for policymakers of the assessment report on land degradation and restoration of the Intergovernmental Science-Policy Platform on Biodiversity and Ecosystem Services. R. Scholes, L. Montanarella, A. Brainich, N. Barger, B. ten Brink, M. Cantele, B. Erasmus, J. Fisher, T. Gardner, T. G. Holland, F. Kohler, J. S. Kotiaho, G. Von Maltitz, G. Nangendo, R. Pandit, J. Parrotta, M. D. Potts, S. Prince, M. Sankaran and L. Willemen (eds.). IPBES secretariat, Bonn, Germany. 44 pages.

Sims, N.C., Newnham, G.J., England, J.R., Guerschman, J., Cox, S.J.D., Roxburgh, S.H., Viscarra Rossel, R.A., Fritz, S. and Wheeler, I. (2021). Good Practice Guidance. SDG Indicator 15.3.1, Proportion of Land That Is Degraded Over Total Land Area. Version 2.0. United Nations Convention to Combat Desertification, Bonn, Germany.

Körner, C., Paulsen, J., & Spehn, E. (2011). A definition of mountains and their bioclimatic belts for global comparisons of biodiversity data. Alpine Botany, 121, 73-78.

UNEP-WCMC (2002). Mountain Watch: Environmental change and sustainable development in mountains. Cambridge, UK

UN Statistical Division (2014). System of Environmental Economic Accounting 2012 — Central Framework. New York, USA.

UN Statistical Division (2014). System of Environmental Economic Accounting 2012 — Central Framework. New York, USA.

.. |image2| image:: media_QGIS/image2_orig.png
   :width: 700
.. |image3| image:: media_QGIS/image3_orig.png
   :width: 700
.. |image4| image:: media_QGIS/image4_orig.png
   :width: 700
.. |image5| image:: media_QGIS/image5_orig.png
   :width: 700
.. |image6| image:: media_QGIS/image6_orig.png
   :width: 700
.. |imageworkflow| image:: media_QGIS/MGCI_workflow_revision_DRAFT.png
   :width: 900
