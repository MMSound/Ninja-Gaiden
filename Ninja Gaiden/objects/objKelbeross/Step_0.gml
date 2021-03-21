/// @description Control iframes
event_inherited();

if (iFrameTimer > 0)
{
	canBeHit = false;
	visible = (iFrameTimer % 2 == 0);
	iFrameTimer--;
}
else
{
	canBeHit = true;
	visible = true;
}