/// @description Movement
xspeed = (image_xscale * 2);

if (grounded())
{
	if (timer % 120 == 0)
	{
		jump_towards_player();
	}
	else if (coll_x(image_xscale, prtSolidCollision))
	{
		jump_towards_player();
	}
	else if (coll_x(image_xscale, objBoundary))
	{
		jump_towards_player();
	}
}
timer++;

round_velocity();

//animate
if (grounded())
{
	sprite_index = sprRyuRun;
	imgSpd = (1 / 2);
}
else
{
	if (yspeed < 0)
	{
		sprite_index = sprRyuSpinSlash;
		imgSpd = (1 / 2);
	}
	else
	{
		sprite_index = sprGreenNinjaJumpFall;
		imgSpd = (1 / 6);
	}
}