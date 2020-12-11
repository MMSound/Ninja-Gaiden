/// @description End of boss fight
global.bossPhase = 2;
global.bossHealth = 0;

if (global.playerHealth == 0)
{
	event_inherited();
}