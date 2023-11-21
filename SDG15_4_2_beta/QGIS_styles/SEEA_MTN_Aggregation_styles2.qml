<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" version="3.28.10-Firenze" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" enabled="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation symbology="Line" zoffset="0" enabled="0" band="1" zscale="1">
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" is_animated="0" type="line" name="" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="243,166,178,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.6" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" is_animated="0" type="fill" name="" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" enabled="1" pass="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
            <Option type="QString" value="243,166,178,255" name="color"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0.26" name="outline_width"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="solid" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
  </elevation>
  <customproperties>
    <Option type="Map">
      <Option type="bool" value="false" name="WMSBackgroundLayer"/>
      <Option type="bool" value="false" name="WMSPublishDataSourceUrl"/>
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option type="QString" value="Value" name="identify/format"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer opacity="1" alphaBand="-1" nodataColor="" type="paletted" band="1">
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
        <paletteEntry color="#72190e" label="11 ArtificialSurfaces (Non Green)  / Nival" alpha="255" value="11"/>
        <paletteEntry color="#901e12" label="12 ArtificialSurfaces (Non Green) / Alpine" alpha="255" value="12"/>
        <paletteEntry color="#b22316" label="13 ArtificialSurfaces (Non Green) / Montane" alpha="255" value="13"/>
        <paletteEntry color="#d92b1b" label="14 ArtificialSurfaces (Non Green) / Remaining Mountain Area" alpha="255" value="14"/>
        <paletteEntry color="#3d5539" label="21 Cropland (Green) / Nival" alpha="255" value="21"/>
        <paletteEntry color="#577951" label="22 Cropland (Green) / Alpine" alpha="255" value="22"/>
        <paletteEntry color="#709b68" label="23 Cropland (Green) / Montane" alpha="255" value="23"/>
        <paletteEntry color="#90c987" label="24 Cropland (Green) / Remaining Mountain Area" alpha="255" value="24"/>
        <paletteEntry color="#777f67" label="31 Grassland (Green) / Nival" alpha="255" value="31"/>
        <paletteEntry color="#97a182" label="32 Grassland (Green) / Alpine" alpha="255" value="32"/>
        <paletteEntry color="#b8c59f" label="33 Grassland (Green) / Montane" alpha="255" value="33"/>
        <paletteEntry color="#ddecbf" label="34 Grassland (Green) / Remaining Mountain Area" alpha="255" value="34"/>
        <paletteEntry color="#117733" label="41 TreeCoveredAreas (Green) / Nival" alpha="255" value="41"/>
        <paletteEntry color="#159841" label="42 TreeCoveredAreas (Green) / Alpine" alpha="255" value="42"/>
        <paletteEntry color="#19af4b" label="43 TreeCoveredAreas (Green) / Montane" alpha="255" value="43"/>
        <paletteEntry color="#1ed65b" label="44 TreeCoveredAreas (Green) / Remaining Mountain Area" alpha="255" value="44"/>
        <paletteEntry color="#938744" label="51 Shrubland (Green) / Nival" alpha="255" value="51"/>
        <paletteEntry color="#ab9d4f" label="52 Shrubland (Green) / Alpine" alpha="255" value="52"/>
        <paletteEntry color="#c3b35a" label="53 Shrubland (Green) / Montane" alpha="255" value="53"/>
        <paletteEntry color="#ddcc66" label="54 Shrubland (Green) / Remaining Mountain Area" alpha="255" value="54"/>
        <paletteEntry color="#7a9591" label="61 Wetland (Green) / Nival" alpha="255" value="61"/>
        <paletteEntry color="#95b6b2" label="62 Wetland (Green) / Alpine" alpha="255" value="62"/>
        <paletteEntry color="#a2c6c1" label="63 Wetland (Green) / Montane" alpha="255" value="63"/>
        <paletteEntry color="#b5ddd8" label="64 Wetland (Green) / Remaining Mountain Area" alpha="255" value="64"/>
        <paletteEntry color="#f0d435" label="71 SparseVegetation (Non Green) / Nival" alpha="255" value="71"/>
        <paletteEntry color="#ffe138" label="72 SparseVegetation (Non Green) / Alpine" alpha="255" value="72"/>
        <paletteEntry color="#ffee88" label="73 SparseVegetation (Non Green) / Montane" alpha="255" value="73"/>
        <paletteEntry color="#fff5bf" label="74 SparseVegetation (Non Green) / Remaining Mountain Area" alpha="255" value="74"/>
        <paletteEntry color="#a1a1a1" label="81 Bareland (Non Green) / Nival" alpha="255" value="81"/>
        <paletteEntry color="#c1c1c1" label="82 Bareland (Non Green) / Alpine" alpha="255" value="82"/>
        <paletteEntry color="#dddddd" label="83 Bareland (Non Green) / Montane" alpha="255" value="83"/>
        <paletteEntry color="#e7e7e7" label="84 Bareland (Non Green) / Remaining Mountain Area" alpha="255" value="84"/>
        <paletteEntry color="#a28aa3" label="91 PermanentSnowAndGlaciers (Non Green) / Nival" alpha="255" value="91"/>
        <paletteEntry color="#b99eba" label="92 PermanentSnowAndGlaciers (Non Green) / Alpine" alpha="255" value="92"/>
        <paletteEntry color="#dcbbdd" label="93 PermanentSnowAndGlaciers (Non Green) / Montane" alpha="255" value="93"/>
        <paletteEntry color="#e8c5e9" label="94 PermanentSnowAndGlaciers (Non Green) / Remaining Mountain Area" alpha="255" value="94"/>
        <paletteEntry color="#5e8da4" label="101 WaterBodies (Non Green) / Nival" alpha="255" value="101"/>
        <paletteEntry color="#6ca1bc" label="102 WaterBodies (Non Green) / Alpine" alpha="255" value="102"/>
        <paletteEntry color="#7cbad9" label="103 WaterBodies (Non Green) / Montane" alpha="255" value="103"/>
        <paletteEntry color="#88ccee" label="104 WaterBodies (Non Green) / Remaining Mountain Area" alpha="255" value="104"/>
      </colorPalette>
      <colorramp type="randomcolors" name="[source]">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeRed="255" grayscaleMode="0" colorizeGreen="128" colorizeOn="0" colorizeBlue="128" saturation="0" invertColors="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
