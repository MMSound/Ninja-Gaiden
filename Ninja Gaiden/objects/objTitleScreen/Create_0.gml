/// @description Variables
blinkTimer = 0;
drawText = true;

playedSFX = false;

subPhase = 0;

//drawing stuff
drawPhase = 0;
logoY = (global.viewY + 160);
logoColorIndex = 6;

global.uiColorIndex = 4;

//menu stuff
currentOption = 0;

optionsText[0] = "NEW GAME";
optionsText[1] = file_exists("game.ngsav") ? "CONTINUE" : "---";
optionsText[2] = "OPTIONS";
if (global.beatenGame)
{
	optionsText[3] = "SOUND TEST";
}