/// @description Variables
blinkTimer = 0;
drawText = true;

currentDemoLevel = rmAct4Scene3;

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