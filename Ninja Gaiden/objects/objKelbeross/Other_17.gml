/// @description Getting killed
event_inherited();

//hit the controller
if (instance_exists(objKelberossController))
{
	entity_damage(objKelberossController, 1);
}