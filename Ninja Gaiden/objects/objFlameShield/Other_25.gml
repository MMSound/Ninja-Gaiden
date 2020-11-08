/// @description Control flames position

//adjust radius
if (radius > 16)
{
	radius -= 1;
}

//a circle but horizontally
theta -= (moveSpeed * image_xscale);
if (theta >= 360)
{
	theta -= 360;
}
theta += thetaOffset;

x = ((centerX + radius * cos(degtorad(theta))));
y = ((centerY - radius * sin(degtorad(theta))));

//slow down as time goes on
if (lifeTimer % 60 == 0)
{
	if (moveSpeed > 0)
	{
		moveSpeed--;
	}
}