/// @description Moving

//basically the point of this little exercise is to figure out how to properly do movement rounding

//FIRST you set the xspeed
xspeed = (moveSpeed * image_xscale);

//THEN you round
round_velocity();

//FINALLY you do the move_x stuff >>but use xspeedInt<<
//you can do any operations here BUT you MUST USE xspeedInt to do so
if (!move_x(xspeedInt, true))
{
	image_xscale *= -1;
}

/*possibly for an updated version of this engine, we want to structure it like so:
event_user(15); //set the xspeed and shit here
round_velocity();
if (!move_x(xspeedInt))
	set the collision variables in this step (function like xcoll and ycoll in megamix, just for 
	the purposes of checking collisions on the front and bottom)
event_user(7);*/