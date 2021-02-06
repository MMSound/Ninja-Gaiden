/// @description Variables
event_inherited();

image_speed = 0;

//we wanna move others up 16 pixels
with (objSubtitle)
{
	if (id != other.id)
	{
		drawY -= 8;
	}
}