/// @description Drawing
var _drawX = (global.viewW / 2);
draw_set_halign(fa_middle);

//title bar
draw_set_font(global.gameFontLarge);
draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 17), "SOUND TEST");
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 16), "SOUND TEST");

//info
draw_set_font(global.gameFont);
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 49), "^\n\n*");
draw_text((_drawX + 1), (global.viewY + 57), soundtrackName[soundtrackType]);
draw_text((_drawX + 1), (global.viewY + 81), string("< " + soundTest[currentSong][1] + " >"));
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 48), "^\n\n*");
draw_text(_drawX, (global.viewY + 56), soundtrackName[soundtrackType]);
draw_text(_drawX, (global.viewY + 80), string("< " + soundTest[currentSong][1] + " >"));

//play button
draw_sprite(sprSoundTestButton, floor(playButtonFrame), _drawX, (global.viewY + 96))

//progress bar
draw_progress_bar(progressBarX, (global.viewY + 136), 80);

//exit text
draw_set_color(c_black);
draw_text((_drawX + 1), (global.viewY + 201), "PRESS ATTACK TO EXIT");
draw_set_color(c_white);
draw_text(_drawX, (global.viewY + 200), "PRESS ATTACK TO EXIT");

palette_shader_reset();
draw_set_halign(fa_left);