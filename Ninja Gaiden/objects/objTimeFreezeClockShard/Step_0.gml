/// @description Movement
if (side == 0)
{
	xOffset--;
}
else
{
	xOffset++;
}
grav += 0.25;
y += grav;
timer++;