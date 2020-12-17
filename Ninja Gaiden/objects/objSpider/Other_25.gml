/// @description Movement
if (instance_exists(objPlayer))
{
	if (y < objPlayer.bbox_top)
	{
		move_y(1);
	}
	else if (y > objPlayer.bbox_top)
	{
		move_y(-1);
	}
}

//limit y
y = clamp(y, ystart, room_height);