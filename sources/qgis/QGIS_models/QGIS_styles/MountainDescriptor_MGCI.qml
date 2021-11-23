<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08" version="3.16.11-Hannover">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal enabled="0" fetchMode="0" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer classificationMax="6" alphaBand="-1" classificationMin="0" opacity="1" nodataColor="" band="1" type="singlebandpseudocolor">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader colorRampType="INTERPOLATED" clip="0" minimumValue="0" classificationMode="1" maximumValue="6" labelPrecision="0">
          <colorramp type="gradient" name="[source]">
            <prop k="color1" v="166,97,26,255"/>
            <prop k="color2" v="1,133,113,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.25;223,194,125,255:0.5;245,245,245,255:0.75;128,205,193,255"/>
          </colorramp>
          <item alpha="255" value="0" color="#292929" label="Non-mountain "/>
          <item alpha="255" value="1" color="#789cfd" label="1 Elevation > 4.500 meters"/>
          <item alpha="255" value="2" color="#aa66cd" label="2 Elevation 3.500–4.500 meters"/>
          <item alpha="255" value="3" color="#e6affe" label="3 Elevation 2.500–3.500 meters"/>
          <item alpha="255" value="4" color="#b1ba84" label="4 Elevation 1.500–2.500 meters and slope >= 2"/>
          <item alpha="255" value="5" color="#adff2f" label="5 Elevation 1.000–1.500 meters and slope >= 5 or local elevation range (LER 7 kilometer radius) > 300 meters"/>
          <item alpha="255" value="6" color="#c5d6fc" label="6 Elevation 300–1.000 meters and local elevation range (7 kilometer radius) > 300 meters"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation grayscaleMode="0" colorizeGreen="128" saturation="0" colorizeBlue="128" colorizeStrength="100" colorizeOn="0" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
