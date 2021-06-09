/// @description The End
if (instance_exists(objStaffRoll))
{
	instance_destroy(objStaffRoll);
}
textbox_create("THE END", (global.viewX + 172), (global.viewY + 116));