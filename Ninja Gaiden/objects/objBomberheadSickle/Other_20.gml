/// @description Collide with walls
if (phase == 1)
{
	if (coll_x(xspeed, objSolid))
	{
		xspeed *= -1;
		xspeed += (2 * -sign(xspeed));
		play_sfx(sfxBomberheadSickleBounce);
	}
	if (coll_y(yspeed, objSolid))
	{
		phase = 2;
		phaseTimer = 0;
		yspeed = 0;
		xspeed = 0;
		play_sfx(sfxBomberheadSickleBounce);
	}
}