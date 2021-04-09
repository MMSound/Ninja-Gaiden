/// @description End of boss fight
event_inherited();

if (!global.beatenGame)
{
	global.beatenGame = true;
	save_load_game(0);
}