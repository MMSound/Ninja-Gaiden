//this script contains miscellaneous scripts for drawing stuff

/// @description draws a font with a lot of stuff set
function draw_text_shaded(_x, _y, _string, _colorIndex, _palette, _font)
{
	//setup variables
	if (is_undefined(_palette))
	{
		_palette = sprFontPalette;
	}
	if (is_undefined(_font))
	{
		_font = global.gameFont;
	}
	
	draw_set_font(_font);
	palette_shader_set(_palette, _colorIndex, false);
	draw_text(_x, _y, _string);
	shader_reset();
}

/// @description draws a repeated sprite image, tiled to fill a given region and with a given offset
//GMLscripts.com/license
//this script has been modified from "draw_sprite_tiled_area" the above website by MiniMacro Sound
function draw_sprite_fill(_sprite, _image, _offsetX, _offsetY, _x1, _y1, _x2, _y2) 
{
	var _spriteWidth, _spriteHeight, i, j, k, _left, _top, width, height, _x, _y;
	_spriteWidth = sprite_get_width(_sprite);
	_spriteHeight = sprite_get_height(_sprite);

	i = (_x1 - ((_x1 % _spriteWidth) - (_offsetX % _spriteWidth)) - (_spriteWidth * ((_x1 % _spriteWidth) < (_offsetX % _spriteWidth))));
	j = (_y1 - ((_y1 % _spriteHeight) - (_offsetY % _spriteHeight)) - (_spriteHeight * ((_y1 % _spriteHeight) < (_offsetY % _spriteHeight)))); 
	k = j;
 
	for (i = i; i <= _x2; i += _spriteWidth) 
	{
	    for (j = j; j <= _y2; j += _spriteHeight) 
		{
			//adjust the left bound
			if (i <= _x1)
			{
				_left = (_x1 - i);
			}
	        else
			{
				_left = 0;
			}
	        _x = (i + _left);
			//adjust the right bound
	        if (j <= _y1)
			{
				_top = (_y1 - j);
			}
	        else
			{
				_top = 0;
			}
	        _y = (j + _top);
	 		//adjust the width
	        if (_x2 <= (i + _spriteWidth))
			{
				width = (((_spriteWidth) - ((i + _spriteWidth) - _x2) + 1) - _left);
			}
	        else
			{
				width = (_spriteWidth - _left);
			}
	 		//adjust the height
	        if (_y2 <= (j + _spriteHeight))
			{
				height = (((_spriteHeight) - ((j + _spriteHeight) - _y2) + 1) - _top);
			}
	        else
			{
				height = (_spriteHeight - _top);
			}
	 		//finally actually draw something
	        draw_sprite_part(_sprite, _image, _left, _top, width, height, _x, _y);
	    }
	    j = k;
	}
}

/// @description create an animated effect
function particle_create(_x, _y, _sprite, _speed, _loop, _depth)
{
	var _id = instance_create_depth(_x, _y, _depth, objAnimatedEffect);
		_id.sprite_index = _sprite;
		_id.imgSpd = _speed;
		_id.loop = _loop;
}