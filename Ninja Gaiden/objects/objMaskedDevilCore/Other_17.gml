/// @description End of boss fight
event_inherited();

if (instance_exists(objMaskedDevilShield))
{
	instance_destroy(objMaskedDevilShield);
}