<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.22.15-Białowieża" minScale="1e+08" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" fetchMode="0" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option name="WMSBackgroundLayer" type="bool" value="false"/>
      <Option name="WMSPublishDataSourceUrl" type="bool" value="false"/>
      <Option name="embeddedWidgets/count" type="int" value="0"/>
      <Option name="identify/format" type="QString" value="Value"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour" enabled="false"/>
    </provider>
    <rasterrenderer alphaBand="-1" band="1" nodataColor="" type="paletted" opacity="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry color="#72190e" label="1 ArtificialSurfaces (Non Green)" alpha="255" value="1"/>
        <paletteEntry color="#90c987" label="2 Cropland (Green)" alpha="255" value="2"/>
        <paletteEntry color="#ddecbf" label="3 Grassland (Green)" alpha="255" value="3"/>
        <paletteEntry color="#117733" label="4 TreeCoveredAreas (Green)" alpha="255" value="4"/>
        <paletteEntry color="#ddcc66" label="5 Shrubland (Green)" alpha="255" value="5"/>
        <paletteEntry color="#b5ddd8" label="6 Wetland (Green)" alpha="255" value="6"/>
        <paletteEntry color="#ffee88" label="7 SparseVegetation (Non Green)" alpha="255" value="7"/>
        <paletteEntry color="#dddddd" label="8 Bareland (Non Green)" alpha="255" value="8"/>
        <paletteEntry color="#caaccb" label="9 PermanentSnowAndGlaciers (Non Green)" alpha="255" value="9"/>
        <paletteEntry color="#88ccee" label="10 WaterBodies (Non Green)" alpha="255" value="10"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeBlue="128" saturation="0" grayscaleMode="0" colorizeGreen="128" colorizeStrength="100" colorizeOn="0" invertColors="0" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
