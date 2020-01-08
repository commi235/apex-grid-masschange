/*global apex */

var mtag = mtag || {};
mtag.grid = mtag.grid || {};

(function($, region, item, grid){

  function _exec( pRegionId, pItems, pColumns, pDoSave ) {
    var lRegion = region( pRegionId );
    var lCurrentModel = lRegion.call("getCurrentView").model;
    if ( !lCurrentModel ) {
      console.error( "No model found on region!", lRegion);
    } else {
      var lSelectedRecords = lRegion.call("getSelectedRecords");

      if ( lSelectedRecords.length > 0 ) {

        var lItemValues = [];
        for (let index = 0; index < pItems.length; index++) {
          lItemValues[index] = item( pItems[index] ).getValue();          
        }

        for (let index = 0; index < lSelectedRecords.length; index++) {
          let lRecordId = lCurrentModel.getRecordId( lSelectedRecords[index] );
          for (let index = 0; index < pColumns.length; index++) {
            lCurrentModel.setRecordValue( lRecordId, pColumns[index], lItemValues[index]);
          }
        }

      } else {
        console.warn( "No selected records found." );
      }
      if ( pDoSave ) {
        lRegion.call("getActions").invoke("save");
      }
    }
  }

  grid.masschange = function( pContext ) {

    var lRegionId = this.action.affectedRegionId,
        lItems    = this.action.attribute01.split(","),
        lColumns  = this.action.attribute02.split(","),
        lDoSave   = (this.action.attribute03 == "Y");

    _exec( lRegionId, lItems, lColumns, lDoSave );
    
  }

  mtag.grid = grid;
})(apex.jQuery, apex.region, apex.item, mtag.grid)
