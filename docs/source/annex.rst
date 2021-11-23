.. contents:: **Table of Contents**

Annexes
======================

Installing R (additional screengrabs to support users)
------------------------------------------------------

Download and install R from https://www.r-project.org/ and then install:

-  In an internet browser window navigate to **r-project.org**

|image140|

-  Click on **download R**

This will take you to https://cran.r-project.org/mirrors.html where you
can select the download location for the software depending on where in
the world you are located.

|image141|

|image142|

In this example we will navigate to one of the UK CRAN mirror sites.

-  Click on
   `**https://www.stats.bris.ac.uk/R/** <https://www.stats.bris.ac.uk/R/>`__

|image143|

-  Choose to **Install R for the first time**. Click on **Download R
   for…** (in this example Download R for Windows)

|image144|

-  Click to **Download R4.1.1 for Windows.** If you have an existing
   install, please refer to the R FAQs. However, it does indicate that
   the easiest thing for most people is to uninstall the old version of
   R and do a fresh install of the new version.

|image145|

-  Double click on the installer |image146|\ and follow the instructions
   presented in the screen grabs below

|image147|

-  Select language and click ok

|image148|

-  Click Next

|image149|

-  Click Next

|image150|

-  Untick either 32 bit or 64 bit depending on your system. (If you are
   unsure look at the system information under settings on your PC)

-  Click Next

|image151|

-  Click Next

|image152|

-  Click Next

|image153|

-  Click Next

|image154|

|image155|

-  Click Finish when the installation is complete

Installing RStudio (additional screengrabs to support users)
------------------------------------------------------------

Download and RStudio Desktop from
https://www.rstudio.com/products/rstudio/ and then install:

-  In an internet browser window navigate to
   `**https://www.rstudio.com/products/rstudio/** <https://www.rstudio.com/products/rstudio/>`__

|image156|

-  Click on **RStudio Desktop**

|image157|

-  Click on download **RStudio Desktop**

|image158|

-  Click to download the **Free** **RStudio Desktop**

|image159|

-  Click **Download** **RStudio for Windows**

-  Double click on the installer |image160| and follow the instructions
   presented in the screen grabs below

|image161|

-  Click Next

|image162|

-  Click Next

|image163|

-  Click Next

|image164|

-  Click Install

|image165|

-  Click Finish when the installation is complete

1. 

2. 

3. 

Accessing DEM data
------------------

**Open topography**

https://portal.opentopography.org/dataCatalog?group=global

**Copernicus** **SRTM** **30m or 90m**

https://copernicus-dem-30m.s3.amazonaws.com/readme.html

**USGS SRTM (USGS) 30m or 90m**

https://www.usgs.gov/centers/eros/science/usgs-eros-archive-digital-elevation-shuttle-radar-topography-mission-srtm-non?qt-science_center_objects=0#qt-science_center_objects

**GMTED: 230m 500m or 1km**

https://www.usgs.gov/core-science-systems/eros/coastal-changes-and-impacts/gmted2010?qt-science_support_page_related_con=0#qt-science_support_page_related_con

**CGIAR SRTM: 90m, 250m, 500m, and 1 km**

-  | **Bulk download (90m, 250m, 500m, and 1 km):**
   |  `https://drive.google.com/drive/folders/0B\_J08t5spvd8RWRmYmtFa2puZEE <https://goo.gl/T9YY2W>`__

-  | **Use in Google Earth Engine:**
   | https://developers.google.com/earth-engine/datasets/catalog/CGIAR_SRTM90_V4

Downloading DEM data from USGS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Downloading DEM data from Copernicus 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Install the AWS cli client for free https://aws.amazon.com/cli/

Full instructions for the command line interface are here
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html

Open a windows cmd prompt and check it is installed correctly by typing
**aws –version**

aws s3 cp s3://copernicus-dem-30m/tileList.txt test.txt
--no-sign-request

aws s3 cp s3://copernicus-dem-90m/tileList.txt test.txt
--no-sign-request

see https://copernicus-dem-30m.s3.amazonaws.com/readme.html

download the tile boundaries for ease of identifying tiles of interest

add dem tiles boundaries to QGIS as vector layers

add in gaul admin boundaries and zoom to area of interest

select tiles covering area of interest. Make sure tiles cover all
country boundary

|image166|

Right click on the layer and show attribute table

Change to show only select features

|image167|

In this case we have 12 tiles of interest

Copy all the selected rows to clipboard by using Ctrl + C

Paste into excel (adjust row height and column width to see data clearly

|image168|

Column b contains all the tile names you need to get from the AWS

Delete column A and row1 containing the headers

Now in cell B1 type the following formula:

For 30m:

="aws s3 cp s3://copernicus-dem-30m/"&A1&"/"&A1&".tif"&" "& A1&".tif
--no-sign-request"

Or for 90m:

="aws s3 cp s3://copernicus-dem-90m/"&A1&"/"&A1&".tif"&" "& A1&".tif
--no-sign-request"

And double click on the cell to copy the formula to the rest of the tile
rows

Output should look like this

|image169|

Now copy the cells in column b cells and paste into the command prompt
window

The DEM tiles should now be downloaded.

.. [1]
   At the time of writing the Long Term Release of QGIS is Version
   3.16.9 LTR 'Hannover'.

.. [2]
   | One technique for slope calculation which we rejected was to
     calculate slope from the DEM without projecting (i.e., using
     geographic coordinate system) and a scale factor to calculate slope
     based on a ratio of vertical to horizontal units. We dismissed this
     method as other users have indicated distortions increase with
     distance from the equator resulting in wrong slope calculations
     particularly near the poles. See
     https://gis.stackexchange.com/questions/14750/using-srtm-global-dem-for-slope-calculation/40456#40456.
   | For countries covering more than one UTM Zone we also explored the
     use of an azimuthal equidistant projection for slope computation.
     Slope near the origin of the projection is accurate but
     progressively gets less accurate with distance from the origin.

.. [3]
   More information can be found on these slope calculation methods on a
   gis.stackexchange.com
   https://gis.stackexchange.com/questions/14750/using-srtm-global-dem-for-slope-calculation

.. [4]
   Source:
   https://gis.stackexchange.com/questions/13445/creating-latitude-grid-from-dem

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
