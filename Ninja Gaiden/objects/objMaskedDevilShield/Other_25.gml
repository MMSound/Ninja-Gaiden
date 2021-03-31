/// @description Move
if (radius < 32)
{
	radius++;
}

theta -= (moveSpeed * image_xscale);
if (theta >= 360)
{
	theta -= 360;
}

x = (centerX + radius * cos(degtorad(theta + (thetaOffset * (360 / myCore.shieldTotal)))));
y = (centerY - radius * sin(degtorad(theta + (thetaOffset * (360 / myCore.shieldTotal)))));