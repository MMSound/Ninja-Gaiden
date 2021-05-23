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
	return _box;
}

/// @description kill textboxes
function kill_textboxes()
{
	if (instance_exists(objTextbox))
	{
		with (objTextbox)
		{
			instance_destroy(id);
		}
	}
}

/// @description clear textboxes
function clear_textboxes()
{
	if (instance_exists(objTextbox))
	{
		with (objTextbox)
		{
			isClear = true;
		}
	}
}

/// @description for the japanese diacritics
function japanese_textbox(_line, _x, _y)
{
	if (is_undefined(_x))
	{
		_x = 96;
	}
	if (is_undefined(_y))
	{
		_y = 147;
	}	
	if (global.cutsceneLanguage == JPN)
	{
		textbox_create(myText[_line][420], _x, _y);
	}
}

//why can you not use arguments when calling functions from sequences? hell if i know! that's what this stupid bullshit is for

/// @description play the landing sfx
function play_land_sfx()
{
	play_sfx(sfxLand, false);
}

/// @description play the jump sfx
function play_jump_sfx()
{
	play_sfx(sfxJump, false);
}

/// @description play the parachute sfx
function play_parachute_sfx()
{
	play_sfx(sfxParachuteOpen, false);
}

/// @description play the explosion sfx
function play_explosion_sfx()
{
	play_sfx(sfxMinorExplosion, false);
}