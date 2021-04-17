/// @description Drawing text
draw_set_font(global.gameFont);
draw_set_halign(fa_center);
draw_text((global.viewW / 2), 8, "WARNING\n\n\n\nTHIS DEVICE DOES NOT SUPPORT SHADERS.\n\nSOME EFFECTS MAY BE DISABLED.\n\nENSURE DIRECTX RUNTIMES ARE UPDATED.\n\n\n\nPRESS START TO PROCEED.");
draw_set_halign(fa_left);