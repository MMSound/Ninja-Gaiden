//this script contains functions for the palette shader

/// @description initialize shader variables
function init_palette_shader(_shader) 
{
	global.palShader = _shader;
	global.palTexelSize = shader_get_uniform(_shader, "texelSize");
	global.palUVs = shader_get_uniform(_shader, "paletteUVs");
	global.palIndex = shader_get_uniform(_shader, "paletteIndex");
	global.palTexture = shader_get_sampler_index(_shader, "paletteTexture");
}

/// @description set the palette shader
function palette_shader_set(palSprite, palIndex, isSurface) 
{
	shader_set(global.palShader);

	if (!isSurface)
	{   
		//Using a sprite based palette
	    var tex = sprite_get_texture(palSprite, 0);
	    var UVs = sprite_get_uvs(palSprite, 0);
    
	    texture_set_stage(global.palTexture, tex);
    
	    var texelX = texture_get_texel_width(tex);
	    var texelY = texture_get_texel_height(tex);
	    var texelHalfX = (texelX / 2);
	    var texelHalfY = (texelY / 2);
    
	    shader_set_uniform_f(global.palTexelSize, texelX, texelY);
	    shader_set_uniform_f(global.palUVs, (UVs[0] + texelHalfX), (UVs[1] + texelHalfY), (UVs[2] + texelHalfX), (UVs[3] + texelHalfY));
	    shader_set_uniform_f(global.palIndex, palIndex);
	}
	else
	{   
		//Using a surface based palette
	    var tex = surface_get_texture(palSprite);
    
	    texture_set_stage(global.palTexture, tex);
    
	    var texelX = texture_get_texel_width(tex);
	    var texelY = texture_get_texel_height(tex);
	    var texelHalfX = (texelX / 2);
	    var texelHalfY = (texelY / 2);
    
	    shader_set_uniform_f(global.palTexelSize, texelX, texelY);
	    shader_set_uniform_f(global.palUVs, texelHalfX, texelHalfY, (1.0 + texelHalfX), (1.0 + texelHalfY));
	    shader_set_uniform_f(global.palIndex, palIndex);
	}
}