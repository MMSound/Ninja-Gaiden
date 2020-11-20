/// @description Collide with Ryu and update center
if (instance_exists(objPlayer))
{
	centerX = objPlayer.x;
}
if (place_meeting_player(x, y))
{
	destroy_self();
}