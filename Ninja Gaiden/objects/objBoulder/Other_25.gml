/// @description Movement
if (grounded() && hasCollision)
{
	yspeed = -3;
	hasCollision = false;
	hasGravity = false;
}
else if (!hasCollision) //stupid fucking hack (i really need to fix the issue but whatever lmao)
{
	yspeed += 0.25;
}

//resetting
if (timer == 70)
{
	hasGravity = true;
}

if (timer % 3 == 0)
{
	drawArrow = !drawArrow;
}

if (y > (global.viewY + (global.viewH + 48)))
{
	instance_create_depth(xstart, global.viewY, depth, objBoulder);
	instance_destroy(id);
}

timer++;

depth = 50;