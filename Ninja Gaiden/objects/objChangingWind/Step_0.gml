/// @description Changing direction
event_inherited();

if (!game_paused())
{
	if (timer % 150 == 0)
	{
		moveDir += changeDir;
		if (moveDir == 1)
		{
			changeDir = -1;
		}
		else if (moveDir == -1)
		{
			changeDir = 1;
		}
	}
	
	if (instance_exists(inst_59CDF9F))
	{
		inst_59CDF9F.xspeed = moveDir;
	}
	
	timer++;
}