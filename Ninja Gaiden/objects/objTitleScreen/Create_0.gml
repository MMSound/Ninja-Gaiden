/// @description Variables
blinkTimer = 0;
drawText = true;

currentDemoLevel = rmAct6Scene2;

playedSFX = false;

//drawing stuff
drawPhase = 0;
logoY = (global.viewY + 160);
logoColorIndex = 6;

//level select stuff
isLevelSelect = false;
selectedLevel = 0;

levelSelect[0] = rmAct1Scene1;
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

global.uiColorIndex = 4;