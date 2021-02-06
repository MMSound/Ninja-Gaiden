/// @description Changing frame
if (!game_paused())
{
	if (timer % 4 == 0)
	{
		image_index++;
	}
	
	timer++;
}