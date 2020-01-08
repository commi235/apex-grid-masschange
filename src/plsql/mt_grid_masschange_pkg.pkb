create or replace package body mt_grid_masschange_pkg
as

  function render
  (
    p_dynamic_action in apex_plugin.t_dynamic_action
  , p_plugin         in apex_plugin.t_plugin
  )
    return apex_plugin.t_dynamic_action_render_result
  as
    l_items   apex_t_varchar2;
    l_fields  apex_t_varchar2;
    l_do_save boolean;

    c_std_sep constant varchar2(1 char) := ',';
    l_return apex_plugin.t_dynamic_action_render_result;
  begin
    l_items :=
      apex_string.split
      (
        p_str => p_dynamic_action.attribute_01
      , p_sep => c_std_sep
      )
    ;

    l_fields :=
      apex_string.split
      (
        p_str => p_dynamic_action.attribute_02
      , p_sep => c_std_sep
      )
    ;

    l_do_save := ( p_dynamic_action.attribute_03 = 'Y' );
    
    l_return.javascript_function :=
      'mtag.grid.masschange.init(' || ')'
    ;

    l_return.attribute_01 := p_dynamic_action.attribute_01;
    l_return.attribute_02 := p_dynamic_action.attribute_02;
    l_return.attribute_03 := p_dynamic_action.attribute_03;

    return l_return;
  end render;

end mt_grid_masschange_pkg;
/
