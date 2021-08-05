<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" maxScale="0" simplifyLocal="1" version="3.20.1-Odense" minScale="100000000" simplifyMaxScale="1" simplifyAlgorithm="0" readOnly="0" labelsEnabled="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationUnit="min" endExpression="" startField="" startExpression="" endField="" fixedDuration="0" accumulate="0" mode="0" durationField="" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 preprocessing="1" type="invertedPolygonRenderer" forceraster="0" enableorderby="0">
    <renderer-v2 type="singleSymbol" forceraster="0" symbollevels="0" enableorderby="0">
      <symbols>
        <symbol force_rhr="0" type="fill" clip_to_extent="1" name="0" alpha="1">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <layer locked="0" pass="0" class="SimpleFill" enabled="1">
            <Option type="Map">
              <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
              <Option type="QString" value="255,255,255,255" name="color"/>
              <Option type="QString" value="bevel" name="joinstyle"/>
              <Option type="QString" value="0,0" name="offset"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
              <Option type="QString" value="MM" name="offset_unit"/>
              <Option type="QString" value="0,0,0,0" name="outline_color"/>
              <Option type="QString" value="solid" name="outline_style"/>
              <Option type="QString" value="0.26" name="outline_width"/>
              <Option type="QString" value="MM" name="outline_width_unit"/>
              <Option type="QString" value="solid" name="style"/>
            </Option>
            <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="color" v="255,255,255,255"/>
            <prop k="joinstyle" v="bevel"/>
            <prop k="offset" v="0,0"/>
            <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="offset_unit" v="MM"/>
            <prop k="outline_color" v="0,0,0,0"/>
            <prop k="outline_style" v="solid"/>
            <prop k="outline_width" v="0.26"/>
            <prop k="outline_width_unit" v="MM"/>
            <prop k="style" v="solid"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
          <layer locked="0" pass="0" class="GeometryGenerator" enabled="1">
            <Option type="Map">
              <Option type="QString" value="Line" name="SymbolType"/>
              <Option type="QString" value="-- UPPER CASE comments below are where you can change things&#xa;&#xa;with_variable(&#xa;&#x9;'raster_layer',&#xa;&#x9;'Peru_d87ce719_d1f9_4816_ad9a_400ad943da82',  -- RASTER LAYER to sample from&#xa;&#x9;-- this collects all the linestrings generated below into one multilinestring&#xa;&#x9;collect_geometries(&#xa;&#x9;&#x9;-- a loop for each y value of the grid&#xa;&#x9;&#x9;array_foreach(&#xa;&#x9;&#x9;&#x9;-- array_foreach loops over all elements of the series generated below&#xa;&#x9;&#x9;&#x9;-- which is a range of numbers from the bottom to the top of y values&#xa;&#x9;&#x9;&#x9;-- of the map canvas extent coordinates.&#xa;&#x9;&#x9;&#x9;-- the result will be an array of linestrings&#xa;&#x9;&#x9;&#x9;generate_series(&#xa;&#x9;&#x9;&#x9;&#x9;y(@map_extent_center)-(@map_extent_height/2), -- bottom y&#xa;&#x9;&#x9;&#x9;&#x9;y(@map_extent_center)+(@map_extent_height/2),  -- top y&#xa;&#x9;&#x9;&#x9;&#x9;@map_extent_height/400  -- stepsize -> HOW MANY LINES&#xa;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#xa;&#x9;&#x9;&#x9;-- we want to enter another loop so we assign the name 'y' to&#xa;&#x9;&#x9;&#x9;-- the current element of the array_foreach loop&#xa;&#x9;&#x9;&#x9;with_variable(&#xa;&#x9;&#x9;&#x9;&#x9;'y',&#xa;&#x9;&#x9;&#x9;&#x9;@element,&#xa;&#x9;&#x9;&#x9;&#x9;&#xa;&#x9;&#x9;&#x9;&#x9;-- now we are ready to generate the line for this y value&#xa;&#x9;&#x9;&#x9;&#x9;make_line(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;-- another loop, this time for the x values. same logic as before&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;-- the result will be an array of points&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;array_foreach(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;generate_series(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;x(@map_extent_center)-(@map_extent_width/2), -- left x&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;x(@map_extent_center)+(@map_extent_width/2),  -- right x&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@map_extent_width/450  -- stepsize -> HOW MANY POINTS PER LINE&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- and here we create each point of the line&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@element,  -- the current value from the loop over the x value range&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@y  -- the y value from the outer loop&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;+   -- will get an additional offset to generate the effect&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- we look for values at _this point_ in the raster, and since&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- the raster might not have any value here, we must use coalesce&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to use a replacement value in those cases&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;coalesce(  -- coalesce to catch raster null values&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;raster_value(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@raster_layer,&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;1,  -- band 1, *snore*&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to look up the raster value we need to look in the right position&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- so we make a sampling point in the same CRS as the raster layer&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;transform( &#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;make_point(@element, @y),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@map_crs,&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;layer_property(@raster_layer,'crs')&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;0  -- coalesce 0 if raster_value gave null&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- here is where we set the scaling factor for the raster -> y values&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- if things are weird, set it to 0 and try small multiplications or divisions&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to see what happens.&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- for metric systems you will want to multiply&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- for geographic coordinates you will want to divide&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)*0.00015  -- user-defined factor for VERTICAL EXAGGERATION&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;)&#xa;&#x9;)&#xa;)  -- wee" name="geometryModifier"/>
            </Option>
            <prop k="SymbolType" v="Line"/>
            <prop k="geometryModifier" v="-- UPPER CASE comments below are where you can change things&#xa;&#xa;with_variable(&#xa;&#x9;'raster_layer',&#xa;&#x9;'Peru_d87ce719_d1f9_4816_ad9a_400ad943da82',  -- RASTER LAYER to sample from&#xa;&#x9;-- this collects all the linestrings generated below into one multilinestring&#xa;&#x9;collect_geometries(&#xa;&#x9;&#x9;-- a loop for each y value of the grid&#xa;&#x9;&#x9;array_foreach(&#xa;&#x9;&#x9;&#x9;-- array_foreach loops over all elements of the series generated below&#xa;&#x9;&#x9;&#x9;-- which is a range of numbers from the bottom to the top of y values&#xa;&#x9;&#x9;&#x9;-- of the map canvas extent coordinates.&#xa;&#x9;&#x9;&#x9;-- the result will be an array of linestrings&#xa;&#x9;&#x9;&#x9;generate_series(&#xa;&#x9;&#x9;&#x9;&#x9;y(@map_extent_center)-(@map_extent_height/2), -- bottom y&#xa;&#x9;&#x9;&#x9;&#x9;y(@map_extent_center)+(@map_extent_height/2),  -- top y&#xa;&#x9;&#x9;&#x9;&#x9;@map_extent_height/400  -- stepsize -> HOW MANY LINES&#xa;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#xa;&#x9;&#x9;&#x9;-- we want to enter another loop so we assign the name 'y' to&#xa;&#x9;&#x9;&#x9;-- the current element of the array_foreach loop&#xa;&#x9;&#x9;&#x9;with_variable(&#xa;&#x9;&#x9;&#x9;&#x9;'y',&#xa;&#x9;&#x9;&#x9;&#x9;@element,&#xa;&#x9;&#x9;&#x9;&#x9;&#xa;&#x9;&#x9;&#x9;&#x9;-- now we are ready to generate the line for this y value&#xa;&#x9;&#x9;&#x9;&#x9;make_line(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;-- another loop, this time for the x values. same logic as before&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;-- the result will be an array of points&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;array_foreach(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;generate_series(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;x(@map_extent_center)-(@map_extent_width/2), -- left x&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;x(@map_extent_center)+(@map_extent_width/2),  -- right x&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@map_extent_width/450  -- stepsize -> HOW MANY POINTS PER LINE&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- and here we create each point of the line&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@element,  -- the current value from the loop over the x value range&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@y  -- the y value from the outer loop&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;+   -- will get an additional offset to generate the effect&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- we look for values at _this point_ in the raster, and since&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- the raster might not have any value here, we must use coalesce&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to use a replacement value in those cases&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;coalesce(  -- coalesce to catch raster null values&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;raster_value(&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@raster_layer,&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;1,  -- band 1, *snore*&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to look up the raster value we need to look in the right position&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- so we make a sampling point in the same CRS as the raster layer&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;transform( &#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;make_point(@element, @y),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;@map_crs,&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;layer_property(@raster_layer,'crs')&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;0  -- coalesce 0 if raster_value gave null&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- here is where we set the scaling factor for the raster -> y values&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- if things are weird, set it to 0 and try small multiplications or divisions&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- to see what happens.&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- for metric systems you will want to multiply&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;-- for geographic coordinates you will want to divide&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)*0.00015  -- user-defined factor for VERTICAL EXAGGERATION&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;&#x9;)&#xa;&#x9;&#x9;)&#xa;&#x9;)&#xa;)  -- wee"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <symbol force_rhr="0" type="line" clip_to_extent="1" name="@0@1" alpha="1">
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <layer locked="0" pass="0" class="SimpleLine" enabled="1">
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
                  <Option type="QString" value="miter" name="joinstyle"/>
                  <Option type="QString" value="0,0,0,255" name="line_color"/>
                  <Option type="QString" value="solid" name="line_style"/>
                  <Option type="QString" value="0.12" name="line_width"/>
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
                <prop k="align_dash_pattern" v="0"/>
                <prop k="capstyle" v="square"/>
                <prop k="customdash" v="5;2"/>
                <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <prop k="customdash_unit" v="MM"/>
                <prop k="dash_pattern_offset" v="0"/>
                <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <prop k="dash_pattern_offset_unit" v="MM"/>
                <prop k="draw_inside_polygon" v="0"/>
                <prop k="joinstyle" v="miter"/>
                <prop k="line_color" v="0,0,0,255"/>
                <prop k="line_style" v="solid"/>
                <prop k="line_width" v="0.12"/>
                <prop k="line_width_unit" v="MM"/>
                <prop k="offset" v="0"/>
                <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <prop k="offset_unit" v="MM"/>
                <prop k="ring_filter" v="0"/>
                <prop k="trim_distance_end" v="0"/>
                <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <prop k="trim_distance_end_unit" v="MM"/>
                <prop k="trim_distance_start" v="0"/>
                <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <prop k="trim_distance_start_unit" v="MM"/>
                <prop k="tweak_dash_pattern_on_corners" v="0"/>
                <prop k="use_custom_dash" v="0"/>
                <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
              </layer>
            </symbol>
          </layer>
        </symbol>
      </symbols>
      <rotation/>
      <sizescale/>
    </renderer-v2>
  </renderer-v2>
  <customproperties>
    <Option/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks type="StringList">
      <Option type="QString" value=""/>
    </activeChecks>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration/>
  <aliases/>
  <defaults/>
  <constraints/>
  <constraintExpressions/>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns/>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable/>
  <labelOnTop/>
  <reuseLastValue/>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression></previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
