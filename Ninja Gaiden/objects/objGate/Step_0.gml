/// @description Check if there's crystals
var _advance = true;
for (var i = 0; i < instance_number(objGuardianCrystal); i++)
{
	if (instance_find(objGuardianCrystal, i).visible)
	{
		_advance = false;
	}
}
if (_advance)
{
	instance_destroy(id);
}