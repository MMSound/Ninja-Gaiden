/// @description Draw game UI
if (room != rmTitleScreen)
{
	var _drawX = global.viewX;
	var _drawY = global.viewY;
	palette_shader_set(sprFontPalette, global.uiColorIndex, false);
	draw_sprite(sprHUDBack, 0, _drawX, _drawY);

	//text
	_drawX += 88;
	_drawY += 4;
	draw_set_font(global.gameFont);
	draw_text(_drawX, _drawY, string("SCORE-" + string_zeros(global.gameScore, 6)));
	_drawY += 8;
	draw_text(_drawX, _drawY, string("TIMER-" + string_zeros(global.levelTime, 3)));
	_drawY += 8;
	draw_text(_drawX, _drawY, string("P-" + string_zeros(global.currentLives, 2)));
	_drawX += 48;
	draw_text(_drawX, _drawY, string("-" + string_zeros(global.ninpo, 2)));
	draw_sprite(sprWeaponIcons, global.currentWeapon, (_drawX + 28), (_drawY - 8));
	_drawX += 64;
	_drawY = (global.viewY + 4);
	draw_text(_drawX, _drawY, string("STAGE-" + string(global.currentAct) + "-" + string(global.currentScene)));
	_drawY += 8;
	draw_text(_drawX, _drawY, "NINJA-");
	for (var i = 0; i < 16; i++)
	{
		draw_sprite(sprHealthbar, (i >= global.playerHealth), ((_drawX + 48) + (i * 4)), _drawY);
	}
	_drawY += 8;
	draw_text(_drawX, _drawY, "ENEMY-");
	for (var i = 0; i < 16; i++)
	{
		draw_sprite(sprHealthbar, 0, ((_drawX + 48) + (i * 4)), _drawY);
	}
	shader_reset();
}