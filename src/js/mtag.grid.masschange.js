/*global apex */

var mtag = mtag || {};

(function($, region, item, grid){

  var _region, _fields, _items, _execSave;

  function _init( regionId, fields, items, execSave ) {
    _region   = region( regionId );
    _fields   = fields;
    _items    = items;
    _execSave = execSave;
  }

  function _exec() {
    var currentModel = _region.call("getCurrentView").model;
    if ( !currentModel ) {
      console.error( "No model found on region!", _region);
    } else {
      var selectedRecords = _region.call("getSelectedRecords");

      if ( selectedRecords.length > 0 ) {
        var itemValues = [];
        for (let index = 0; index < _items.length; index++) {
          itemValues[index] = item( _items[index] ).getValue();          
        }

        selectedRecords.each( function(){
          let curRecordId = currentModel.getRecordId( this );
          for (let index = 0; index < fields.length; index++) {
            currentModel.setRecordValue( curRecordId, fields[index], itemValues[index]);
          }
        });
      } else {
        console.warn( "No selected records found." );
      }
      if ( _execSave ) {
        _region.call("getActions").invoke("save");
      }
    }
  }

  grid.masschange = {
    init : _init,
    exec : _exec
  };
  mtag.grid = grid;
})(apex.jQuery, apex.region, apex.item, mtag.grid || {})
