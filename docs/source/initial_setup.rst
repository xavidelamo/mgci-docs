Initial set-up
=================

R software and packages installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Download and install R from https://www.r-project.org/ and then
   download and install RStudio Desktop from
   https://www.rstudio.com/products/rstudio/. Once the later has been
   completed, open RStudio in your computer.

2. Click on ‘File’ (top left corner) and then on ‘Open File…’. Select
   the file named ‘XXXXXXXX’ Click on …….to run and install all the
   packages and check that there are no errors.

3. Ensure the ‘sp ‘and ‘raster’ packages are correctly installed. Two of
   the options to do so are:
    -   install.packages("name\_of\_package")
    -  library(name\_of\_package)

       Or
    -  (if(!require("name\_of\_package")) install.packages("name\_of\_package")

A step-by-step guide on how to install R and R Studio (with images) can be found in Annex X.
If you are not installing R and R studio from scratch, please make sure that your installations are upgraded. It is important to use the current version of R software (R-4.1.1 at the time of writing). The R version can be easily checked on the text within the ‘R Console’ box at the beginning of a new session (see Figure XX for standalone R and Figure ZZ for R Studio).

|image5|

|image6|

If you are running R on Windows, package ‘installr’ allows you to
quickly update the R version and the packages saved in your library
(please check
https://www.r-statistics.com/2015/06/a-step-by-step-screenshots-tutorial-for-upgrading-r-on-windows/
for a step-by-step tutorial on how to do this or type the lines
below on the R Console:

- install.packages("installr")

  *you’ll have to select the CRAN mirror for use in this session depending on your geographical location*

 |image7|
- library(installr)

- updateR()

  *Answer the questions to complete the update. The final set of questions are about copying your R packages to the new version of R.*

 |image8|

QGIS software and plugins
^^^^^^^^^^^^^^^^^^^^^^^^^

We suggest users use the Long-Term Release version1 [1]_ of QGIS to
undertake their analysis as this is most stable versions and users are
less likely to incur technical difficulties and bugs.

There are various installers depending on your operating system but for
most users we recommend the QGIS Standalone Installer. Full instructions
are on their website
`https://qgis.org/en/site/forusers/download.html# <https://qgis.org/en/site/forusers/download.html>`__

Whilst the MGCI analysis runs entirely within the QGIS interface, users
wishing to use QGIS for the MGCI analysis are also required to install R
software (as outlined above). R scripts can be run from within the QGIS
interface. The R script will be only be used for calculating real
surface area during the MGCI calculation. Real surface area can be
calculated using one of the ready to use SAGA tools in the processing
toolbox, however after initial testing we found the results differed
from the GEE and R methods and therefore due to the need for consistency
between calculation methods for this SDG indicator, the best and easiest
method was to integrate the ‘surfaceArea’ function from package ‘sp in R
software.

Once QGIS and R are both correctly installed users will need to install
the following plugins:

1. **Processing R Provider:** This plugin essentially allows R scripts
   to be used directly within the QGIS processing toolbox with the
   simple addition of some QGIS header information placed at the top of
   the script to making the R script behave exactly like other
   processing tools in the QGIS processing toolbox. The header
   information allows graphical fields to be set in the processing
   dialogue window when running the tool e.g. the input raster, a
   specific field or the location and name of an output raster. Some
   header information is used to tell QGIS to either pass information to
   R and from QGIS about the tool to enable the R processing to happen
   within the QGIS interface.

-  From the QGIS Menu Toolbar click on **Plugins>>Manage and Install
   Plugins**

|image9|

-  From the Plugin dialogue window search for **processing R**

|image10|

-  Click **Install Plugin** and then **Close**

|image11|

|image12|

Once installed R will appear as a processing tool in the processing
toolbox and an R Scripts button in the Processing Toolbox Menu.
Users may find that the R scripts button is missing at this stage.

-  Click the arrow next to the **R** Tools to expand the R toolset.

The toolset should look similar to the below with a few example scripts.

|image13|

and the processing Toolbox Menu should look like this with the missing R scripts button |image14|

|image15|

-  From the QGIS main menu click on **settings>>
   options>>processing>>providers**

-  expand **R** to see the R setting

|image16|

If you operating system is 64 bit, tick **Use 64bit version**

-  Check the **R folder** is pointing to the correct location (where it
   is installed on your computer)

-  Click okay

-  Save the QGIS project and re-open to activate the changes.

You should now see that the R script button has appeared on the
processing toolbox menu

|image17|

Next add additional resources to the R processing toolbox

-  To add other R resources click on **plugins>>resource
   sharing>>resource sharing**

    |image18|

-  Click on **All Collections** on the left hand panel and click **QGIS
   R script collection (QGIS Official Repository)** then click
   **Install**

    |image19|

A wider collection of scripts should now be present in the R-scripts
collection. These are not required for MGCI but useful for R-Integration
with QGIS.

    |image20|
To check that the R integration is correctly installed and
working check that a new script can be created by clicking **‘Create
New R script’** button at the top of the Processing toolbox.

-  Click the **Open Script** button and open the real surface area R
   script that has been adapted to run in QGIS. The file is called
   **RSA\_R\_script\_with\_QGIS\_headers \_final\_v1.rsx** script (to be
   provided)

   |image21|

   The RSA script should open

   |image22|

Note that the script header indicates that the R script will appear
under the **Raster Processing group** in the R toolset in the QGIS
Processing Toolbox, the name of the tool will be **Create RSA raster
v1.**

-  Click the **Save** **script as** button |image23| to save the script
   in your QGIS rscripts folder. Save the script as
   **RSA\_R\_script\_with\_QGIS\_headers\_final\_v1.rsx**

|image24|

-  Click **Save**

-  Add a sample raster (to be provided) to your QGIS project and run the
   following steps to check that the QGIS R-installation is working
   correctly for the RSA script.

|image25|

-  In the Processing Toolbox, double click on the **Create RSA Raster
   V1** tool to open the tool dialogue

    |image26|

|image27|

-  Leave the output to save to a temporary file

-  Click **Run**

    If R has been installed correctly the script should run with no
    errors and an output should be generated which is one cell less in
    all directions compared to the input

-  To make it easier to check the output change the symbology on the
   output to shade **Singleband/Pseudocolor**

|image28|

 The temporary output should look like the below. The reason that the
 layer is one cell less all the way round is that the real surface
 area uses 8 surrounding cells around each cell in the calculation
 and the reason that when processing the data for calculating the
 mountain and real surface area layers that the area of interest
 needs to be defined large than the boundary of the country.

 |image29|

 **Resource sharing plugin:** This plugin is a useful R related
 plugin (which is not essential for the MGCI but useful for users
 wishing to integrate R with QGIS).

 Once the resource sharing plugin is installed some scripts should
 also be visible. They are grouped into several categories as in the
 screengrab below.

 |image30|

 For further information see the following sections of the QGIS user
 manual at

-  https://docs.qgis.org/3.16/en/docs/user_manual/processing/3rdParty.html#r-scripts

-  docs.qgis.org/3.16/en/docs/user\_manual/processing/3rdParty.html#index-5


QGIS custom toolbox download and installation
----------------------------------------------

Users will also need to download the SDG_15_4_2_beta_Toolbox and set of templates and style files from the SDG_15_4_2_beta repository.
In a web browser navigate to the SDG15.4.2 beta repository using the following URL: https://github.com/corinnar/mgci-docs

|setup1|

Next open a file explorer window and navigate to the folder where you have downloaded the file. At this stage we would recomment you move the zip file to a sensible location with a short and simple file structure. e.g. in this example we have moved the downloaded zip file to c:\workspace. Right-click on the file named mgci-docs-MGCI_DML.zip and click on 7-ZIP >> Extract here

|setup2|


Once unzipped you should see a folder of the same name (mgci-docs-MGCI_DML). Navigate inslide this folder and you should see the following file structure and a zip file called SDG15_4_2_beta.zip.

|setup2b|

Right-click on SDG15_4_2_beta.zip and clcik on 7-ZIP >> Extract file . Note we are clicking on extract files this time and not extract here as we want to make some modifications to the path we are unzipping to.

|setup3|

you should see the unzip files window below. Do NOT click OK yet as we want to make some changes

|setup4|

First remove 'mgci-docs-MGCI_DML' from the extract to path and then tick Eliminate duplication of root folder

|setup5|

|setup6|

Click okay once you have done these steps. You should now have a folder set up for the QGIS processing. Please do not alter the folder structure as the tools rely on these to remain intact.

|setup7|

The next step is to go into the input_data folder and unzip the Global mountains map. Right-click on SDG1542_WorldMountainMap.zip and click on 7-ZIP >> Extract here

|setup8|

You are now ready to open the QGIS project. Double-click to SDG_15_4_2_beta.qgz to open the project

|setup9|

Next (once QGIS is open) there are a few steps that need to be undertaken to set up the QGIS project correctly and to link it to the custom toolbox and scripts.


From the QGIS main menu goto settings>>options>>Data Sources and change the 'Representation of null values from Null to NA (this will ensure  the correct NA representation of Null values in the output reporting tables)

|setup10|


In the same settings window click on processing>>general and change the 'Results group name' to OUTPUTS. Put this in capitals as this is how it will then appear in the QGIS table of contents. It means that any outputs from geoprocessing tools will be stored under this group heading and makes it easier to distinguish from the INPUT data.

|setup11|

In the same settings>>processing window, shrink down the general tab and expand Models. Double click on the models path to expose the three dots. Click on this and click add. Navigate to the QGIS models folder in the SDG15_4_2_beta folder. e.g. in this example C:\workspace\SDG15_4_2_beta\QGIS_models . Then click okay.

|setup12|

In the same settings>>processing>>providers window, shrink down the Models tab and expand R. Double click on the models path to expose the three dots. Click on this and click add. Navigate to the R_scripts folder in the SDG15_4_2_beta folder. e.g. in this example C:\workspace\SDG15_4_2_beta\R_scriptss . Then click okay.

|setup13|

Next double-click on the R folder path and navigate to where you have installed your R software. This is to tell QGIS where to run R from.

|setup14|

Once done click OK to close the setting window and return to the main QGIS interface.

On the righ-hand side of QGIS you should see the processing Toolbox. (If it is not visible, from the main menu select View>>panels>>processing toolbox). In the processing toolbox if you expand models and R you should see the SDG15.4.2 models and scripts present.  It is from the toolbox that you will run the tools if you choose to use the SDG_15_4_2_beta toolbox rather than undertaking the manual steps.

|setup15|


.. |setup1| image:: media_toolbox/setup1.png
   :width: 800
.. |setup2| image:: media_toolbox/setup2.png
   :width: 800
.. |setup3| image:: media_toolbox/setup3.png
   :width: 800
.. |setup4| image:: media_toolbox/setup4.png
   :width: 800
.. |setup5| image:: media_toolbox/setup5.png
   :width: 800
.. |setup6| image:: media_toolbox/setup6.png
   :width: 800
.. |setup7| image:: media_toolbox/setup7.png
   :width: 800
.. |setup8| image:: media_toolbox/setup8.png
   :width: 800
.. |setup9| image:: media_toolbox/setup9.png
   :width: 800
.. |setup10| image:: media_toolbox/setup10.png
   :width: 800
.. |setup11| image:: media_toolbox/setup11.png
   :width: 800
.. |setup12| image:: media_toolbox/setup12.png
   :width: 800
.. |setup13| image:: media_toolbox/setup13.png
   :width: 800
.. |setup14| image:: media_toolbox/setup14.png
   :width: 800
.. |setup15| image:: media_toolbox/setup15.png
   :width: 800

.. |image0| image:: media_QGIS/image2_orig.png
   :width: 6.26806in
   :height: 3.16875in
.. |image1| image:: media_QGIS/image3_orig.png
   :width: 6.26806in
   :height: 5.06528in
.. |image2| image:: media_QGIS/image4_orig.png
   :width: 6.26806in
   :height: 0.81458in
.. |image3| image:: media_QGIS/image5_orig.png
   :width: 6.26806in
   :height: 1.65347in
.. |image4| image:: media_QGIS/image6_orig.png
   :width: 6.26806in
   :height: 3.97847in
.. |image5| image:: media_QGIS/image7_orig.png
   :width: 5.97917in
   :height: 4.25867in
.. |image6| image:: media_QGIS/image8_orig.png
   :width: 6.03472in
   :height: 4.75909in
.. |image7| image:: media_QGIS/image9_orig.png
   :width: 6.26806in
   :height: 4.46458in
.. |image8| image:: media_QGIS/image10_orig.png
   :width: 6.26806in
   :height: 3.33742in
.. |image9| image:: media_QGIS/image11_orig.png
   :width: 5.52160in
   :height: 0.94805in
.. |image10| image:: media_QGIS/image12_orig.png
   :width: 6.26806in
   :height: 3.70278in
.. |image11| image:: media_QGIS/image13_orig.png
   :width: 4.42770in
   :height: 4.71941in
.. |image12| image:: media_QGIS/image14_orig.png
   :width: 4.42653in
   :height: 4.71816in
.. |image13| image:: media_QGIS/image15_orig.png
   :width: 3.44840in
   :height: 1.83359in
.. |image14| image:: media_QGIS/image16_orig.png
   :width: 0.43750in
   :height: 0.35417in
.. |image15| image:: media_QGIS/image17_orig.png
   :width: 3.21875in
   :height: 1.13542in
.. |image16| image:: media_QGIS/image18_orig.png
   :width: 6.26806in
   :height: 2.56667in
.. |image17| image:: media_QGIS/image19_orig.png
   :width: 2.32263in
   :height: 0.97904in
.. |image18| image:: media_QGIS/image20_orig.png
   :width: 6.26806in
   :height: 3.45417in
.. |image19| image:: media_QGIS/image21_orig.png
   :width: 5.21948in
   :height: 1.75024in
.. |image20| image:: media_QGIS/image22_orig.png
   :width: 1.95347in
   :height: 2.17361in
.. |image21| image:: media_QGIS/image23_orig.png
   :width: 5.10417in
   :height: 1.21875in
.. |image22| image:: media_QGIS/image24_orig.png
   :width: 5.75000in
   :height: 3.93750in
.. |image23| image:: media_QGIS/image25_orig.png
   :width: 0.29861in
   :height: 0.29276in
.. |image24| image:: media_QGIS/image26_orig.png
   :width: 6.26806in
   :height: 3.40417in
.. |image25| image:: media_QGIS/image27_orig.png
   :width: 6.26806in
   :height: 3.59931in
.. |image26| image:: media_QGIS/image28_orig.png
   :width: 3.18056in
   :height: 2.63633in
.. |image27| image:: media_QGIS/image29_orig.png
   :width: 6.26806in
   :height: 2.40000in
.. |image28| image:: media_QGIS/image30_orig.png
   :width: 5.48788in
   :height: 5.13889in
.. |image29| image:: media_QGIS/image31_orig.png
   :width: 5.43750in
   :height: 3.10009in
.. |image30| image:: media_QGIS/image32_orig.png
   :width: 3.37547in
   :height: 4.79234in
