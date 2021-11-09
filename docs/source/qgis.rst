MGCI QGIS workflow
==================
Definition 
----------

The Mountain Green Cover Index (MGCI) is designed to measure the extent and the changes of green vegetation in mountain areas - i.e. forest, shrubs, trees, pastureland, cropland, etc. – to monitor progress towards the mountain target. MGCI is defined as the percentage of green cover over the total surface of the mountain region of a given country and for a given reporting year. The index aims to monitor the evolution of the green cover and thus assess the status of conservation of mountain ecosystems.
2. Initial set-up 
===============

2.1 Software Installation 
--------------------------

2.1.1 R software and packages installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Download and install R from https://www.r-project.org/ and then
   download and install RStudio Desktop from
   https://www.rstudio.com/products/rstudio/. Once the later has been
   completed, open RStudio in your computer.

2. Click on ‘File’ (top left corner) and then on ‘Open File…’. Select
   the file named ‘XXXXXXXX’ Click on …….to run and install all the
   packages and check that there are no errors.

3. Ensure the ‘sp ‘and ‘raster’ packages are correctly installed. Two of
   the options to do so are:
 -  install.packages("name\_of\_package")

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
    bellow on the R Console:

 -  install.packages("installr") #you’ll have to select the CRAN mirror
    for use in this session depending on your geographical location

    |image7|

 -  library(installr)

 -  updateR() # and answer the questions to complete the update. The
    final set of questions are about copying your R packages to the new
    version of R.

    |image8|

2.1.2 QGIS software and plugins
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

    Click **Install Plugin** and then **Close**

|image11|

|image12|

    Once installed R will appear as a processing tool in the processing
    toolbox and an R Scripts button in the Processing Toolbox Menu.
    Users may find that the R scripts button is missing at this stage.

-  Click the arrow next to the **R** Tools to expand the R toolset.

The toolset should look similar to the below with a few example scripts.

|image13|

and the processing Toolbox Menu with the missing R scripts |image14|
button

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

-  |image20|\ To check that the R integration is correctly installed and
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
