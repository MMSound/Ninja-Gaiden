/// @description Control flames position

//adjust radius
if (radius > 16)
{
	radius -= 1;
}

//a circle but horizontally
theta -= (8 * image_xscale);
if (theta >= 360)
{
	theta -= 360;
}
theta += thetaOffset;

x = ((centerX + radius * cos(degtorad(theta))));
y = ((centerY - radius * sin(degtorad(theta))));