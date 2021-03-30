/// @description Getting hit
event_inherited();
with (objMaskedDevilShield)
{
	instance_destroy();
}
initialShield = false;
shieldCount = 0;
if (hitsLeft > 0)
{
	hitsLeft--;
}