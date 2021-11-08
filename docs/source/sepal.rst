SEPAL-MGCI
==========

Definition 
----------

The Mountain Green Cover Index (MGCI) is designed to measure the extent and the changes of green vegetation in mountain areas - i.e. forest, shrubs, trees, pastureland, cropland, etc. – to monitor progress towards the mountain target. MGCI is defined as the percentage of green cover over the total surface of the mountain region of a given country and for a given reporting year. The index aims to monitor the evolution of the green cover and thus assess the status of conservation of mountain ecosystems.

The SEPAL-MGCI module will allow you to calculate this index by following the 4 steps that are described below. 

    
Requirements
------------

To run the MGCI SEPAL module you will need a web browser, an Internet connection, and a SEPAL and Google Earth Engine (GEE) account:

- SEPAL: is the environment where the module is deployed and therefore displayed. To create an account, please follow the `registration steps <https://docs.sepal.io/en/latest/setup/register.html#sign-up-to-sepal>`_ and then familiarize yourself with the tool by exploring its interface.
- GEE: the module has been built under the GEE Python API, which means that all the computational steps are done through the GEE servers. Please follow the `registration steps <https://docs.sepal.io/en/latest/setup/gee.html#create-a-gee-account>`_ and don't forget to `initialize the home folder <https://docs.sepal.io/en/latest/setup/gee.html#initialize-the-home-folder>`_.
- Connect your SEPAL and GEE accounts: the last step is to connect both accounts, you can achieve this by following the `step-by-step <https://docs.sepal.io/en/latest/setup/gee.html#connection-between-gee-and-sepal>`_.

SEPAL interface
---------------

If you are new to SEPAL, you would like to take a look over the interface and familiarize yourself with the main tools. A detailed description of the features can be consulted in the `interface documentation <https://docs.sepal.io/en/latest/setup/presentation.html#sepal-interface>`_. 

- Use the `apps tab <https://docs.sepal.io/en/latest/setup/presentation.html#apps-tab>`_ and navigate through the pages, or type into the search box the "Mountain Green Cover Index" module. 

- Click over the app drawer and wait patiently until the module is displayed in your session, which should look like the below image:


MGCI Module
-----------

A SEPAL module is divided into two main sections:

- Process drawers: where you can find the steps or sections that are designed to be used to accomplish the goal of the module. The MGCI module has therefore four main steps, and the index will be calculated based on the user inputs:

  - Area of interest selection
  - Mountain descriptor
  - Vegetation descriptor
  - MGCI results

- Help drawers: used to describe the tool, objectives and give a background about how it was developed.
    
  - Source code: the module was developed under an MIT license, which means that the development is freely accessible and the code is public. It will link you to the GitHub repository of the module.
  - Wiki: it will point to the latest documentation. If you have any problems, this is the place where you can start learning the workflow and features of the module.
  - Bug report: no tool is perfect and we are not exempt from bugs, fortunately, our team is always aware and constat alert to fix anything that is supposed to work well, so this section can be used to report any unexpected result or behavior. To report an error please follow the `contribution guidelines <https://github.com/dfguerrerom/sepal_mgci/blob/master/CONTRIBUTE.md>`_.


Area of interest (AOI)
----------------------
The calculation of the MGCI will be restricted to a specific area of interest, in this step, you will have the option to choose between a predefined list of administrative layers or to use a custom dataset. The available options are described below:
 
- Predefined layers: 
   - Country/province
   - Administrative level 1
   - Administrative level 2
- Custom layers
   - Vector file
   - Drawn shapes on the map
   - Google Earth Engine Asset
   
After selecting the desired area, click over the :guilabel:`Select these inputs` button and the map will show up your selection.

.. note:: 

    You can only select one area of interest. In some cases, depending on the input data, the process could take longer (see `_processing <processing>`).

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/1_aoi_selection.PNG
   :align: center
   :width: 600


Mountain descriptor layer 
-------------------------

Mountains can be defined with reference to a variety of parameters, such as climate, elevation, ecology (Körner et al., 2011) (Karagulle et al., 2017). This methodology adheres to the UNEP- WCMC mountain definition, relying in turn on the mountain description proposed by Kapos et al. (2000).
   
The global mountain descriptor layer is based on the mountain classification proposed by Kapos et al. (2000):

- Class 1: elevation > 4500 meters
- Class 2: elevation 3500 - 4500 meters
- Class 3: elevation 2500 – 3500 meters
- Class 4: elevation 1500 – 2500 meters and slope ≥ 2
- Class 5: elevation 1,000–1,500 meters and slope ≥ 5 or local elevation range (7 kilometers radius) ≥ 300 meters
- Class 6: elevation 300–1,000 meters and local elevation range (7 kilometers radius) ≥ 300 meters outside 23°N—19°S
- Class 0: Defined to represent the non-mountainous areas.

The mountain description layer used to derive the global estimates was created by the US Geological Survey from a 250 m Digital Elevation Model (DEM) (Sayre et al. 2018)
These datasets may be replaced by nationally relevant data sources when available.

Questionnaire
^^^^^^^^^^^^^

The questionnaire will help you to decide whether to use a custom dataset or a default DEM. By clicking over the desired option, the module will hide or display a text box to insert or select an asset id.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/2_questionaire.PNG
   :align: center
   :width: 300


Custom dataset
::::::::::::::

As all the processing is done in GEE, so all the inputs have to be uploaded as an `earth engine asset <https://developers.google.com/earth-engine/guides/asset_manager>`_. When you are using a custom dataset, it has to be stored in your GEE account (it could be private) or in a third-party account as a public asset. The dropdown menu will query all the assets in your GEE folder that matches the Image type. You can select it from the dropdown or write/paste it directly.

After clicking the button, the module will create the mountain descriptor layer, and it will be automatically displayed on the map.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/2_mountain_descriptor.PNG
   :align: center
   :width: 600


Vegetation descriptor layer
---------------------------

The vegetation descriptor layer categorizes land cover into green and non-green areas. Green vegetation includes both natural vegetation and vegetation resulting from anthropic activity (e.g. crops, afforestation, etc.). Non-green areas include very sparsely vegetated areas, bare land, water, permanent ice/snow, and urban areas. The vegetation description layer can be derived in different ways, but remote sensing-based land cover maps are the most convenient data source for this purpose, as they provide the required information on green and non-green areas in a spatially explicit manner and allow for comparison over time through land cover change analysis.


.. _ipcc_classes:
.. csv-table:: IPCC Classification!
   :header: "CODE", "Description", "Color"
   :widths: auto
   :align: center

   "1","Forest","#044D02"
   "2","Grassland","#F5FF00"
   "3","Cropland","#FF8100"
   "4","Wetland","#0013FF"
   "5","Settlement","#FFFFFF"
   "6","Other land","#FF00DE"
   

Questionnaire
^^^^^^^^^^^^^

The purpose of the questionnaire is to display only the required inputs by the user depending on the answers.

As well as the mountain descriptor layer, this panel will help you to use your land cover/use map in case that you have one or to select the default parameters.


.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/3_questionnaire.PNG
   :align: center
   :width: 600


Use default dataset
:::::::::::::::::::

By selecting default, the module will use the `land cover time series map <http://maps.elie.ucl.ac.be/CCI/viewer/index.php>`_ produced by the European Space Agency (ESA) under the Climate Initiative (CCI) reclassified under the 6 IPCC classes, and you just have to select the year of interest in the dropdown menu, available to select the band.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/3_default.PNG
   :align: center
   :width: 600


Use custom dataset
::::::::::::::::::

As the vegetation layer only has to include the :ref:`six IPCC classes <ipcc_classes>`, the module won't be able to ensure that your custom dataset has these classes, to help in this matter, this section will display a reclassification tool to help you reclassify the values of the land cover/use map.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/3_custom.PNG
   :align: center
   :width: 600


If you do not have a reclassification matrix, —after selecting the dataset and clicking over :guilabel:`get table`— the module will search over all of its pixel values and it will display an interactive table where you can manually reclassify from old pixel values to new ones. As you can see in the below table, the example dataset has values that do not match with the :ref:`IPCC classes <ipcc_classes>`, so with prior knowledge about the dataset, you can use the corresponding combo box that is in the right column to reclassify that specific value. By default, the module will use as target the 6 IPCC classes.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/3_1_reclassify_table.PNG
   :align: center
   :width: 600


.. tip:: After manually reclassifying your dataset, you can use the :guilabel:`save` button to store the table as a CSV file and you can use it later instead of manually filling up the table.

Alternatively, if you have a reclassification table, it means that you do not have to manually fill up all the new values, instead, you could use this table to match the old values with the new ones, if a value in your dataset is not present in the reclassify table, the new value will be empty, so you will have to manually select the new value.

.. tip:: What is a reclassification matrix table?:
    A reclassification matrix is a comma-separated values (CSV) file used to reclassify old pixel values into new ones. The CSV file only has to contain two values per line, the first one refers to the `from` value, while the second is the `target` value.

Display results
^^^^^^^^^^^^^^^

Once you have reclassified the new values or used the default dataset, you can display the land use/cover map in the map by clicking over the "display map" button. Depending on your area of interest, the map should look like this:


.. tip:: Remember that the MGCI is only calculated over the mountain classes, so the vegetation layer will mask out the areas where there is no presence of a mountain class.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/3_3_vegetation_descriptor_2.PNG
   :align: center
   :width: 600


MGCI calculation
----------------

Once you have set the inputs in the previous steps, the module will calculate the area of every IPCC class into each mountain class range as well as the overall result. The module has the option to do the calculation using the planimetric area or the `real surface area <https://www.fs.fed.us/rm/pubs_other/rmrs_2004_jenness_j001.pdf>`_. 


Calculation
^^^^^^^^^^^

Depending on the size of your area of interest and whether you are using the real surface area or not, the process could take longer. As we explained in the previous sections, the calculation of the land cover/use area per mountain class, as well as the MGCI, is done in GEE, which means that the computation is restricted by the GEE available resources, one of these limitations is the time to get the results on the fly (see `computation time out <https://developers.google.com/earth-engine/guides/debugging#timed-out>`_), so any computation that takes more than five minutes will throw an exception.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/4_dashboard_1_calculation.PNG
   :align: center
   :width: 600


To overcome this limitation, the process will be executed as a task —which are operations that are capable of running much longer than the standard timeout (see `gee tasks <https://developers.google.com/earth-engine/guides/playground#tasks-tab>`_ )—. If the computation is created as a task, you will see a similar message as the shown in the below image, and to get the results, please see the :ref:`calculation from task <calculation_from_task>` section, otherwise, the result will be displayed on the dashboard (see :ref:`dashboard <display>`).

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/4_computation_timeout.PNG
   :align: center
   :width: 600


.. _calculation_from_task:
Calculation from task
^^^^^^^^^^^^^^^^^^^^^

If the computation can't be done on the fly, a new file containing the id of the task is created and stored in the `../module_results/sdg_indicators/mgci/tasks` folder. This file will help you to track the status of the task at any moment. To do so, you only have to search this file in your SEPAL environment using the navigator by clicking on the :guilabel:`search file` button, and then clicking over the :guilabel:`Calculate MGCI` button and the result will be displayed if the process status is completed.

.. tip:: an alternative way to track the progress of the task is by using the `GEE task tracker <https://code.earthengine.google.com/tasks>`_, there you can find the tasks that are running on the server.

.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/4_dashboard_tasks.PNG
   :align: center
   :width: 600


.. _display:
Display dashboard
^^^^^^^^^^^^^^^^^

No matter if you the computation is done on the fly or if you have used the task, the dashboard will be rendered in the same way, and this is divided into two sections:

- Overall MGCI: it indicates the overall index for the whole mountain classes.
- Mountain class MGCI: it indicates the index for that specific mountain range.

.. note:: The module will only display the IPCC classes. The user has to reclassify the values from 1 to 6, otherwise, the module will nest those classes into the "other lands" class (6). 


Each section will provide an overall MGCI displayed in a circle along with the summary of the area in each of the IPCC classes, as is shown in the below image.

Export results
^^^^^^^^^^^^^^

After the calculation is done, the export button will become available. To download the report, you just have to fill up the institution that will issue the report and the year of the land use/cover map, and the result will download three files:

- ER_MTN_GRNCOV: Mountain green cover area (skqm).
- ER_MTN_GRNCVI: Mountain Green Cover Index.
- ER_MTN_TOTL: Total mountain area (sqkm)


.. image:: https://raw.githubusercontent.com/dfguerrerom/sepal_mgci/master/doc/img/4_dashboard_export.PNG
   :align: center
   :width: 600

