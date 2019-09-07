///@func update_slot_config(fromSlot, config)
///@param fromSlot
///@param config
var _fromSlot = argument[0];
var _config = argument[1];
if (is_undefined(_fromSlot)) { _fromSlot = true; }

var toUpdate = _fromSlot ? config : owner.config;

toUpdate.selected = _config;