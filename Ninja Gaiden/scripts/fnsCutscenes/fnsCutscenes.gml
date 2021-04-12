//this script contains cutscene dialogues
//IMPORTANT: call each function in its respective cutscene object

/// @description menu text in different languages (just for testing)
function scr_menu_text()
{
	dialogue[0][ENG] = "English Text";
	dialogue[0][JPN] = "Japanese Text";
	dialogue[0][ESP] = "Spanish Text";
	dialogue[0][ITA] = "Italian Text";
	dialogue[0][ROM] = "Romanian Text";
	dialogue[0][RUS] = "Russian Text";
	dialogue[0][UKR] = "Ukrainian Text";
}

/// @description create a sequence on a given layer
function sequence_create_layer(_x, _y, _seq, _layer)
{
	var _layerName = is_undefined(_layer) ? "Assets" : _layer;
	var _layerID = layer_get_id(_layerName);
	
	if (layer_exists(_layerID))
	{
		return layer_sequence_create(_layerID, _x, _y, _seq);
	}
}

/// @description create a textbox
function textbox_create(_text, _x, _y)
{
	if (is_undefined(_x))
	{
		_x = 96;
	}
	if (is_undefined(_y))
	{
		_y = 152;
	}
	var _box = instance_create_depth((global.viewX + _x), (global.viewY + _y), (depth - 2), objTextbox);
		_box.myText = _text;
}