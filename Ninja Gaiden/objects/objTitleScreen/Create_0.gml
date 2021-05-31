/// @description Variables
blinkTimer = 0;
drawText = true;

currentDemoLevel = rmActCardI; //make sure to make this go to the act card when we finish the title screen
currentCutscene = rmCutscene14;

playedSFX = false;

//drawing stuff
drawPhase = 0;
logoY = (global.viewY + 160);
logoColorIndex = 6;

//level select stuff
isLevelSelect = false;
selectedLevel = 0;

levelSelect[0] = rmActCardI;
levelSelect[1] = rmAct2Scene1;
levelSelect[2] = rmAct2Scene2;
levelSelect[3] = rmAct3Scene1;
levelSelect[4] = rmAct3Scene2;
levelSelect[5] = rmAct4Scene1;
levelSelect[6] = rmAct4Scene2;
levelSelect[7] = rmAct4Scene3;
levelSelect[8] = rmAct5Scene1;
levelSelect[9] = rmAct5Scene2;
levelSelect[10] = rmAct5Scene3;
levelSelect[11] = rmAct6Scene1;
levelSelect[12] = rmAct6Scene2;
levelSelect[13] = rmAct6Scene3;
levelSelect[14] = rmAct1Segue;
levelSelect[15] = rmAct2Segue;
levelSelect[16] = rmAct3Segue;
levelSelect[17] = rmAct4Segue;
levelSelect[18] = rmAct5Segue;
levelSelect[19] = rmAct6Segue1;
levelSelect[20] = rmAct6Segue2;
levelSelect[21] = rmAct6Segue3;

cutsceneSelect[0] = rmCutscene1;
cutsceneSelect[1] = rmCutscene2;
cutsceneSelect[2] = rmCutscene3;
cutsceneSelect[3] = rmCutscene4;
cutsceneSelect[4] = rmCutscene5;
cutsceneSelect[5] = rmCutscene6;
cutsceneSelect[6] = rmCutscene7;
cutsceneSelect[7] = rmCutscene8;
cutsceneSelect[8] = rmCutscene9;
cutsceneSelect[9] = rmCutscene10;
cutsceneSelect[10] = rmCutscene11;
cutsceneSelect[11] = rmCutscene12;
cutsceneSelect[12] = rmCutscene13;
cutsceneSelect[13] = rmCutscene14;

global.uiColorIndex = 4;