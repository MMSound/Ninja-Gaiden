//this script contains camera-related function

/// @description set position of camera in a section-sympathetic way
function camera_set_position(_x, _y) 
{
	_x = clamp(_x, 0, (room_width - global.viewW));
	_y = clamp(_y, 0, (room_height - global.viewH));
	camera_set_view_pos(view_camera[0], _x, _y);
	global.viewX = _x;
	global.viewY = _y;
}