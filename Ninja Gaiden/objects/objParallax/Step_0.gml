/// @description Set image speed if paused
if (!game_paused())
{
	image_speed = imgSpd;
}
else
{
	image_speed = 0;
}