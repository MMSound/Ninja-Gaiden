/// @description End of boss fight
event_inherited();

if (instance_exists(objBloodyMalthBigLightning))
{
	instance_destroy(objBloodyMalthBigLightning);
}
if (instance_exists(objBloodyMalthLightningRod))
{
	instance_destroy(objBloodyMalthLightningRod);
}