create or replace package body mt_grid_masschange_pkg
as

  function render
  (
    p_dynamic_action in apex_plugin.t_dynamic_action
  , p_plugin         in apex_plugin.t_plugin
  )
    return apex_plugin.t_dynamic_action_render_result
  as
    l_return apex_plugin.t_dynamic_action_render_result;
  begin
    
    l_return.javascript_function :=
      'mtag.grid.masschange'
    ;

    -- Selected Page Items and mapping mechanic can simply be passed through
    l_return.attribute_01 := p_dynamic_action.attribute_01;
    -- Attribute 02 defines if automatic mapping should be used
    l_return.attribute_02 := p_dynamic_action.attribute_02;

    -- For Grid Columns we first check if automatic mapping is enabled.
    -- JavaScript code will not use attribute 02, instead we prepare attribute 03 beforehand based on selected seeting.
    -- Attribute 02 is still included to avoid confusion during debugging.
    if p_dynamic_action.attribute_02 = 'Y' then
      l_return.attribute_03 := regexp_replace(p_dynamic_action.attribute_01, '[pP][[:digit:]]+_');
    else
      l_return.attribute_03 := p_dynamic_action.attribute_03;
    end if;

    -- Attribute 04 simply defines if the Grid save action should be called immediately
    l_return.attribute_04 := p_dynamic_action.attribute_04;

    return l_return;
  end render;

end mt_grid_masschange_pkg;
/
