<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.28.11-Firenze" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation zoffset="0" symbology="Line" enabled="0" band="1" zscale="1">
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol clip_to_extent="1" alpha="1" is_animated="0" type="line" frame_rate="10" name="" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" locked="0" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="190,207,80,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.6"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol clip_to_extent="1" alpha="1" is_animated="0" type="fill" frame_rate="10" name="" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" locked="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="190,207,80,255"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="35,35,35,255"/>
            <Option type="QString" name="outline_style" value="no"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
  </elevation>
  <customproperties>
    <Option type="Map">
      <Option type="bool" name="WMSBackgroundLayer" value="false"/>
      <Option type="bool" name="WMSPublishDataSourceUrl" value="false"/>
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option type="QString" name="identify/format" value="Value"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option type="QString" name="name" value=""/>
      <Option name="properties"/>
      <Option type="QString" name="type" value="collection"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling enabled="false" maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer type="paletted" opacity="1" band="1" nodataColor="" alphaBand="-1">
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
        <paletteEntry alpha="255" label="1001" color="#73a2c9" value="1001"/>
        <paletteEntry alpha="255" label="2001" color="#9d78e7" value="2001"/>
        <paletteEntry alpha="255" label="2002" color="#5889eb" value="2002"/>
        <paletteEntry alpha="255" label="2003" color="#2b1ac8" value="2003"/>
        <paletteEntry alpha="255" label="2004" color="#ce8244" value="2004"/>
        <paletteEntry alpha="255" label="2005" color="#8545d9" value="2005"/>
        <paletteEntry alpha="255" label="2006" color="#6dca8c" value="2006"/>
        <paletteEntry alpha="255" label="2007" color="#aaed25" value="2007"/>
        <paletteEntry alpha="255" label="2010" color="#9846db" value="2010"/>
        <paletteEntry alpha="255" label="3001" color="#6a45ef" value="3001"/>
        <paletteEntry alpha="255" label="3002" color="#c13cd3" value="3002"/>
        <paletteEntry alpha="255" label="3003" color="#becf3c" value="3003"/>
        <paletteEntry alpha="255" label="3004" color="#c965e8" value="3004"/>
        <paletteEntry alpha="255" label="3005" color="#ca59bf" value="3005"/>
        <paletteEntry alpha="255" label="3006" color="#caad45" value="3006"/>
        <paletteEntry alpha="255" label="3007" color="#afeb82" value="3007"/>
        <paletteEntry alpha="255" label="3010" color="#e281e2" value="3010"/>
        <paletteEntry alpha="255" label="4001" color="#d22799" value="4001"/>
        <paletteEntry alpha="255" label="4002" color="#efc164" value="4002"/>
        <paletteEntry alpha="255" label="4003" color="#ed587b" value="4003"/>
        <paletteEntry alpha="255" label="4004" color="#ef734d" value="4004"/>
        <paletteEntry alpha="255" label="4005" color="#cd27a9" value="4005"/>
        <paletteEntry alpha="255" label="4006" color="#98ee30" value="4006"/>
        <paletteEntry alpha="255" label="4007" color="#47dc47" value="4007"/>
        <paletteEntry alpha="255" label="4008" color="#dd5b6a" value="4008"/>
        <paletteEntry alpha="255" label="4010" color="#ec67b2" value="4010"/>
        <paletteEntry alpha="255" label="5001" color="#95d376" value="5001"/>
        <paletteEntry alpha="255" label="5002" color="#1eef4b" value="5002"/>
        <paletteEntry alpha="255" label="5003" color="#eaa03f" value="5003"/>
        <paletteEntry alpha="255" label="5004" color="#2137df" value="5004"/>
        <paletteEntry alpha="255" label="5005" color="#478adc" value="5005"/>
        <paletteEntry alpha="255" label="5010" color="#395ed9" value="5010"/>
        <paletteEntry alpha="255" label="6001" color="#82e2cd" value="6001"/>
        <paletteEntry alpha="255" label="6003" color="#63e5d6" value="6003"/>
        <paletteEntry alpha="255" label="6004" color="#b8cd73" value="6004"/>
        <paletteEntry alpha="255" label="6005" color="#42a1d1" value="6005"/>
        <paletteEntry alpha="255" label="6006" color="#ce3077" value="6006"/>
        <paletteEntry alpha="255" label="6010" color="#dc1010" value="6010"/>
        <paletteEntry alpha="255" label="7001" color="#e7618e" value="7001"/>
        <paletteEntry alpha="255" label="7002" color="#e1956e" value="7002"/>
        <paletteEntry alpha="255" label="7003" color="#c9c93d" value="7003"/>
        <paletteEntry alpha="255" label="7004" color="#2ccc97" value="7004"/>
        <paletteEntry alpha="255" label="7007" color="#7acfda" value="7007"/>
        <paletteEntry alpha="255" label="8001" color="#4be021" value="8001"/>
        <paletteEntry alpha="255" label="8008" color="#45b8d8" value="8008"/>
        <paletteEntry alpha="255" label="9009" color="#de2b13" value="9009"/>
        <paletteEntry alpha="255" label="10001" color="#2d2dd8" value="10001"/>
        <paletteEntry alpha="255" label="10002" color="#2ecc85" value="10002"/>
        <paletteEntry alpha="255" label="10003" color="#6ec962" value="10003"/>
        <paletteEntry alpha="255" label="10004" color="#78d4a1" value="10004"/>
        <paletteEntry alpha="255" label="10005" color="#68cb74" value="10005"/>
        <paletteEntry alpha="255" label="10006" color="#e6d433" value="10006"/>
        <paletteEntry alpha="255" label="10008" color="#8d0ecd" value="10008"/>
        <paletteEntry alpha="255" label="10010" color="#73e7e7" value="10010"/>
      </colorPalette>
      <colorramp type="randomcolors" name="[source]">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation colorizeGreen="128" saturation="0" colorizeBlue="128" grayscaleMode="0" colorizeStrength="100" invertColors="0" colorizeOn="0" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
