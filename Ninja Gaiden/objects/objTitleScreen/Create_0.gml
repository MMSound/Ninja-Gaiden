/// @description Variables
blinkTimer = 0;
drawText = true;

playedSFX = false;

subPhase = 0;

currentLevel = 0;

levelArray[0] = [rmOpening, "C-0"];
levelArray[1] = [rmAct1Scene1, "1-1"];
levelArray[2] = [rmAct1Segue, "B-1"];
levelArray[3] = [rmCutscene1, "C-1"];
levelArray[4] = [rmCutscene2, "C-2"];
levelArray[5] = [rmAct2Scene1, "2-1"];
levelArray[6] = [rmAct2Scene2, "2-2"];
levelArray[7] = [rmAct2Segue, "B-2"];
levelArray[8] = [rmCutscene3, "C-3"];
levelArray[9] = [rmCutscene4, "C-4"];
levelArray[10] = [rmAct3Scene1, "3-1"];
levelArray[11] = [rmAct3Scene2, "3-2"];
levelArray[12] = [rmAct3Segue, "B-3"];
levelArray[13] = [rmCutscene5, "C-5"];
levelArray[14] = [rmCutscene6, "C-6"];
levelArray[15] = [rmCutscene7, "C-7"];
levelArray[16] = [rmAct4Scene1, "4-1"];
levelArray[17] = [rmCutscene8, "C-8"];
levelArray[18] = [rmAct4Scene2, "4-2"];
levelArray[19] = [rmAct4Scene3, "4-3"];
levelArray[20] = [rmAct4Segue, "B-4"];
levelArray[21] = [rmCutscene9, "C-9"];
levelArray[22] = [rmAct5Scene1, "5-1"];
levelArray[23] = [rmAct5Scene2, "5-2"];
levelArray[24] = [rmAct5Scene3, "5-3"];
levelArray[25] = [rmCutscene10, "C-A"];
levelArray[26] = [rmAct5Segue, "B-5"];
levelArray[27] = [rmCutscene11, "C-B"];
levelArray[28] = [rmAct6Scene1, "6-1"];
levelArray[29] = [rmAct6Scene2, "6-2"];
levelArray[30] = [rmAct6Scene3, "6-3"];
levelArray[31] = [rmCutscene12, "C-C"];
levelArray[32] = [rmAct6Segue1, "B-6"];
levelArray[33] = [rmCutscene13, "C-D"];
levelArray[34] = [rmAct6Segue2, "B-7"];
levelArray[35] = [rmCutscene14, "C-E"];
levelArray[36] = [rmAct6Segue3, "B-8"];
levelArray[37] = [rmEnding, "C-F"];

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