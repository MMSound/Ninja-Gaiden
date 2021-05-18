/// @description End of boss fight
event_inherited();

if (instance_exists(objMaskedDevilShield))
{
	instance_destroy(objMaskedDevilShield);
}
if (instance_exists(objMaskedDevilShell))
{
	instance_destroy(objMaskedDevilShell);
}
if (instance_exists(myDevil))
{
	myDevil.imgSpd = 0;
	myDevil.phase = 0;
}