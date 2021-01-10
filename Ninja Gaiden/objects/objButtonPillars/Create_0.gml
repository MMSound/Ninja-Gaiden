/// @description Variables
init_movement();

otherPillar = noone;
myBoundary = noone;

if (collision_rectangle(bbox_left, (bbox_top - 16), bbox_right, bbox_bottom, objButtonPillarBoundary, false, true))
{
	myBoundary = collision_rectangle(bbox_left, (bbox_top - 16), bbox_right, bbox_bottom, objButtonPillarBoundary, false, true);
}

topBound = myBoundary.y;
bottomBound = ((myBoundary.y + (myBoundary.image_yscale * 16)+ 8));

timer = 0;

depth = 150;