prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.45'
,p_default_workspace_id=>1481951694367239
,p_default_application_id=>103
,p_default_owner=>'MOKLEIN'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_mt_ag_apex_grid_masschange
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(6280450187858140)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.MT-AG.APEX.GRID-MASSCHANGE'
,p_display_name=>'Grid Masschange'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#mtag.grid.masschange.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  function render',
'  (',
'    p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin',
'  )',
'    return apex_plugin.t_dynamic_action_render_result',
'  as',
'    l_return apex_plugin.t_dynamic_action_render_result;',
'  begin',
'    ',
'    l_return.javascript_function :=',
'      ''mtag.grid.masschange''',
'    ;',
'',
'    -- Selected Page Items and mapping mechanic can simply be passed through',
'    l_return.attribute_01 := p_dynamic_action.attribute_01;',
'    l_return.attribute_02 := p_dynamic_action.attribute_02;',
'',
'    -- For Grid Columns we first check if automatic mapping is enabled.',
'    -- JavaScript code will not use attribute 02, instead we prepare attribute 03 beforehand.',
'    -- Attribute 02 is still included to avoid confusion during debugging.',
'    if p_dynamic_action.attribute_02 = ''Y'' then',
'      l_return.attribute_03 := regexp_replace(p_dynamic_action.attribute_01, ''[pP][[:digit:]]+_'');',
'    else',
'      l_return.attribute_03 := p_dynamic_action.attribute_03;',
'    end if;',
'',
'    l_return.attribute_04 := p_dynamic_action.attribute_04;',
'',
'    return l_return;',
'  end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'REGION:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select the page items you want values pulled from.<br />',
'Use automatic mapping or define mapping manual.<br />',
'Finally decide if Interactive Grid save action should be run immediately.<br  />',
'Affected Element must be set to a Interactive Grid region.'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/commi235/apex-grid-masschange'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6281449467875380)
,p_plugin_id=>wwv_flow_api.id(6280450187858140)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Items'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Select the items to retrieve values from.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6290754750896008)
,p_plugin_id=>wwv_flow_api.id(6280450187858140)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Map by Page Item Name'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Setting this to "Yes" will use the Page Item Names to determine Grid columns.<br />',
'This is done by using regex "P|p\d+_" on the string of selected page items.<br />',
'So "P1_ENAME,P1_SAL" becomes "ENAME,SAL".<br />',
'If you want to define a custom mapping set this to "No" and specify Grid columns manually.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6290209573887160)
,p_plugin_id=>wwv_flow_api.id(6280450187858140)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Grid Columns'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(6290754750896008)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_text_case=>'UPPER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Name the grid columns to be set separated by ",".<br />',
'Make sure you name the columns in the exact same order that you used for items above.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6291445369912449)
,p_plugin_id=>wwv_flow_api.id(6280450187858140)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Trigger Save'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Define if you want to immediately trigger the Grid''s save action.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A676C6F62616C2061706578202A2F0D0A0D0A766172206D746167203D206D746167207C7C207B7D3B0D0A6D7461672E67726964203D206D7461672E67726964207C7C207B7D3B0D0A0D0A2866756E6374696F6E28242C20726567696F6E2C20697465';
wwv_flow_api.g_varchar2_table(2) := '6D2C2067726964297B0D0A0D0A202066756E6374696F6E205F65786563282070526567696F6E49642C20704974656D732C2070436F6C756D6E732C2070446F536176652029207B0D0A20202020766172206C526567696F6E203D20726567696F6E282070';
wwv_flow_api.g_varchar2_table(3) := '526567696F6E496420293B0D0A20202020766172206C43757272656E744D6F64656C203D206C526567696F6E2E63616C6C282267657443757272656E745669657722292E6D6F64656C3B0D0A202020206966202820216C43757272656E744D6F64656C20';
wwv_flow_api.g_varchar2_table(4) := '29207B0D0A202020202020636F6E736F6C652E6572726F722820224E6F206D6F64656C20666F756E64206F6E20726567696F6E21222C206C526567696F6E293B0D0A202020207D20656C7365207B0D0A202020202020766172206C53656C656374656452';
wwv_flow_api.g_varchar2_table(5) := '65636F726473203D206C526567696F6E2E63616C6C282267657453656C65637465645265636F72647322293B0D0A0D0A20202020202069662028206C53656C65637465645265636F7264732E6C656E677468203E20302029207B0D0A0D0A202020202020';
wwv_flow_api.g_varchar2_table(6) := '2020766172206C4974656D56616C756573203D205B5D3B0D0A2020202020202020666F7220286C657420696E646578203D20303B20696E646578203C20704974656D732E6C656E6774683B20696E6465782B2B29207B0D0A202020202020202020206C49';
wwv_flow_api.g_varchar2_table(7) := '74656D56616C7565735B696E6465785D203D206974656D2820704974656D735B696E6465785D20292E67657456616C756528293B202020202020202020200D0A20202020202020207D0D0A0D0A2020202020202020666F7220286C657420696E64657820';
wwv_flow_api.g_varchar2_table(8) := '3D20303B20696E646578203C206C53656C65637465645265636F7264732E6C656E6774683B20696E6465782B2B29207B0D0A202020202020202020206C6574206C5265636F72644964203D206C43757272656E744D6F64656C2E6765745265636F726449';
wwv_flow_api.g_varchar2_table(9) := '6428206C53656C65637465645265636F7264735B696E6465785D20293B0D0A20202020202020202020666F7220286C657420696E646578203D20303B20696E646578203C2070436F6C756D6E732E6C656E6774683B20696E6465782B2B29207B0D0A2020';
wwv_flow_api.g_varchar2_table(10) := '2020202020202020202069662028206C43757272656E744D6F64656C2E6765744669656C644B6579282070436F6C756D6E735B696E6465785D20292029207B0D0A20202020202020202020202020206C43757272656E744D6F64656C2E7365745265636F';
wwv_flow_api.g_varchar2_table(11) := '726456616C756528206C5265636F726449642C2070436F6C756D6E735B696E6465785D2C206C4974656D56616C7565735B696E6465785D293B20202020202020202020202020200D0A2020202020202020202020207D20656C7365207B0D0A2020202020';
wwv_flow_api.g_varchar2_table(12) := '202020202020202020636F6E736F6C652E7761726E282022556E6B6E6F776E206669656C642E222C2070436F6C756D6E735B696E6465785D20293B0D0A2020202020202020202020207D0D0A202020202020202020207D0D0A20202020202020207D0D0A';
wwv_flow_api.g_varchar2_table(13) := '2020202020207D20656C7365207B0D0A2020202020202020636F6E736F6C652E7761726E2820224E6F2073656C6563746564207265636F72647320666F756E642E2220293B0D0A2020202020207D0D0A202020202020696620282070446F536176652029';
wwv_flow_api.g_varchar2_table(14) := '207B0D0A20202020202020206C526567696F6E2E63616C6C2822676574416374696F6E7322292E696E766F6B6528227361766522293B0D0A2020202020207D0D0A202020207D0D0A20207D0D0A0D0A2020677269642E6D6173736368616E6765203D2066';
wwv_flow_api.g_varchar2_table(15) := '756E6374696F6E2829207B0D0A0D0A20202020766172206C526567696F6E4964203D202020746869732E616374696F6E2E6166666563746564526567696F6E49642C0D0A20202020202020206C4974656D73202020203D202020746869732E616374696F';
wwv_flow_api.g_varchar2_table(16) := '6E2E61747472696275746530312E73706C697428222C22292C0D0A20202020202020206C4175746F4D617020203D202020746869732E616374696F6E2E61747472696275746530322C202F2F206F6E6C7920696E636C7564656420746F20686176652063';
wwv_flow_api.g_varchar2_table(17) := '6F6D706C6574652073657474696E67732E204E6F7420757365642E0D0A20202020202020206C436F6C756D6E7320203D202020746869732E616374696F6E2E61747472696275746530332E73706C697428222C22292C0D0A20202020202020206C446F53';
wwv_flow_api.g_varchar2_table(18) := '6176652020203D202820746869732E616374696F6E2E6174747269627574653034203D3D2022592220293B0D0A0D0A202020205F6578656328206C526567696F6E49642C206C4974656D732C206C436F6C756D6E732C206C446F5361766520293B0D0A20';
wwv_flow_api.g_varchar2_table(19) := '2020200D0A20207D0D0A0D0A20206D7461672E67726964203D20677269643B0D0A7D2928617065782E6A51756572792C20617065782E726567696F6E2C20617065782E6974656D2C206D7461672E67726964290D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6281060593860806)
,p_plugin_id=>wwv_flow_api.id(6280450187858140)
,p_file_name=>'mtag.grid.masschange.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
