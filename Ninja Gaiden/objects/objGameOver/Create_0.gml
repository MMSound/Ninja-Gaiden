/// @description Continue array
event_inherited();

//there probably was a better way to do this but shut up
roomTo[1][1] = rmAct1Scene1;
roomTo[1][2] = rmAct1Scene1;

roomTo[2][1] = rmAct2Scene1;
roomTo[2][2] = rmAct2Scene2;
roomTo[2][3] = rmAct2Scene2;

roomTo[3][1] = rmAct3Scene1;
roomTo[3][2] = rmAct3Scene2;
roomTo[3][3] = rmAct3Scene2;

roomTo[4][1] = rmAct4Scene1;
roomTo[4][2] = rmAct4Scene2;
roomTo[4][3] = rmAct4Scene3;
roomTo[4][4] = rmAct4Scene3;

roomTo[5][1] = rmAct5Scene1;
roomTo[5][2] = rmAct5Scene2;
roomTo[5][3] = rmAct5Scene3;
roomTo[5][4] = rmAct5Scene3;

roomTo[6][1] = rmAct6Scene1;
roomTo[6][2] = rmAct6Scene2;
roomTo[6][3] = rmAct6Scene3;
roomTo[6][4] = rmAct6Boss1;

global.uiColorIndex = 9;
wavePhase = 0;

global.lifeLanternAppear = true;
global.checkpointX = 0;
global.checkpointY = 0;