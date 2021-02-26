/// @description Move
if (!game_paused())
{
	//horizontal
	x += xspeed;
	
	//vertical
	yspeed += grav;
	y += yspeed;
	
	drawBlink = !drawBlink;
}