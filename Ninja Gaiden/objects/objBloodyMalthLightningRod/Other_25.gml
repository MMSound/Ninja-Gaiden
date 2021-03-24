/// @description Flicker
if (animTimer < 30)
{
	visible = !visible;
	canHit = false;
}
else
{
	visible = true;
	canHit = true;
}
animTimer++;