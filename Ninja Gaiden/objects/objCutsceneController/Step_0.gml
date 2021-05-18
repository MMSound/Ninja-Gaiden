/// @description Skipping
if (global.inputPausePressed || global.inputJumpPressed)
{
	room_transition(nextRoom);
}

//setting the section
if (place_meeting(x, y, objSection))
{
	var _section = instance_place(x, y, objSection);
	if (global.currentSection != _section)
	{
		global.currentSection = _section;
		section_set_bounds();
	}
}