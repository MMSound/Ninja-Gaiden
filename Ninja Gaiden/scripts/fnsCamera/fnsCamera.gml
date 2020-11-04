//this script contains camera-related function

/// @description set position of camera in a section-sympathetic way
function camera_set_position(_x, _y) 
{
	_x = clamp(_x, global.sectionL, (global.sectionR - global.viewW));
	_y = clamp(_y, global.sectionT, (global.sectionB - global.viewH));
	camera_set_view_pos(view_camera[0], _x, _y);
	global.viewX = _x;
	global.viewY = _y;
}

/// @description sets the current bounds of a section
function section_set_bounds(_section)
{
	if (is_undefined(_section))
	{
		_section = global.currentSection;
	}
	global.sectionL = _section.x;
	global.sectionR = (_section.bbox_right + 1);
	global.sectionT = _section.y;
	global.sectionB = (_section.bbox_bottom + 1);
}