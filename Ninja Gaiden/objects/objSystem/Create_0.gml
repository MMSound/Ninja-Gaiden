/// @description Global variables

//controls
global.inputLeftPressed = false;
global.inputRightPressed = false;
global.inputUpPressed = false;
global.inputDownPressed = false;
global.inputJumpPressed = false;
global.inputAttackPressed = false;
global.inputWeaponPressed = false;
global.inputPausePressed = false;

global.inputLeft = false;
global.inputRight = false;
global.inputUp = false;
global.inputDown = false;
global.inputJump = false;
global.inputAttack = false;
global.inputWeapon = false;
global.inputPause = false;

global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyJump = ord("Z");
global.keyAttack = ord("X");
global.keyWeapon = ord("C");
global.keyPause = vk_enter;

//game control
global.paused = false;
global.gameTimer = 0;
global.levelTime = 0;
global.gameScore = 0;
global.currentLives = 2;
global.ninpo = 0;
global.currentAct = 1;
global.currentScene = 1;

global.timeFrozen = false;

global.deathRespawnTimer = 0;
global.deathRespawnTime = 240;
global.deathRespawn = false;

global.viewX = 0;
global.viewY = 0;
global.viewW = 400;
global.viewH = 240;
global.cameraOffsetX = (global.viewW / 2);
global.cameraOffsetY = (global.viewH / 2);
global.cameraFocusObject = noone;

//player control
global.canControl = true;
global.playerHealth = 16;
global.currentWeapon = 0;

//weapon table
global.weaponObject[0] = noone;
global.weaponObject[wpnShuriken] = objShuriken;
global.weaponObject[wpnWindmillShuriken] = objWindmillShuriken;
global.weaponObject[wpnFlameWheel] = objFlameWheel;
global.weaponObject[wpnSpinSlash] = objSpinSlash;
global.weaponObject[wpnFlames] = objFlameShield;

global.weaponCooldown[0] = 0;
global.weaponCooldown[wpnShuriken] = 10;
global.weaponCooldown[wpnWindmillShuriken] = 0;
global.weaponCooldown[wpnFlameWheel] = 5;
global.weaponCooldown[wpnSpinSlash] = 0;
global.weaponCooldown[wpnFlames] = 0;

global.weaponNinpo[0] = 0;
global.weaponNinpo[wpnShuriken] = 3;
global.weaponNinpo[wpnWindmillShuriken] = 5;
global.weaponNinpo[wpnFlameWheel] = 5;
global.weaponNinpo[wpnSpinSlash] = 5;
global.weaponNinpo[wpnFlames] = 0;

global.weaponLimit[0] = 0;
global.weaponLimit[wpnShuriken] = 8;
global.weaponLimit[wpnWindmillShuriken] = 1;
global.weaponLimit[wpnFlameWheel] = 1;
global.weaponLimit[wpnSpinSlash] = 1;
global.weaponLimit[wpnFlames] = 1;

//shaders and surfaces
init_palette_shader(shdColorSwap);
global.screenColorIndex = 0;
global.uiColorIndex = 8;
global.gameFont = font_add_sprite_ext(sprFont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.,!?{'/-", false, 0);
global.screenRes = 2;
surface_resize(application_surface, global.viewW, global.viewH);
window_set_size((global.viewW * global.screenRes), (global.viewH * global.screenRes));

if (room == rmInit)
{
	room_goto_next();
}
depth = -1000;