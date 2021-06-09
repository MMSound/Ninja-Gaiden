/// @description Draw the stuff
draw_set_halign(fa_middle);
for (var i = 0; i < array_length(myText); i++)
{
	draw_text((global.viewX + (global.viewW / 2)), (global.viewY + ((floor(drawPos) + 48) + (i * 16))), myText[i]);
}
draw_set_halign(fa_left);