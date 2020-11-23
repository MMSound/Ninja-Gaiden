/// @description Move
if (!game_paused())
{
	yspeed += grav;
	x += (xspeed * xDir);
	y += yspeed;
	if (timer % 2 == 0)
	{
		visible = !visible;
	}
	timer++;
}