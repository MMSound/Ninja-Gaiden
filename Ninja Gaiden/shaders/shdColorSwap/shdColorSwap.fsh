//Fragment
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D paletteTexture;
uniform vec2 texelSize;
uniform vec4 paletteUVs;
uniform float paletteIndex;

void main()
{
    vec4 source = texture2D(gm_BaseTexture, v_vTexcoord);
    
    DoAlphaTest(source);
    
    for (float i = paletteUVs.y; i < paletteUVs.w; i += texelSize.y)
    {
		if (distance(source, texture2D(paletteTexture, vec2(paletteUVs.x, i))) <= 0.004)
        {
            float palette_V = paletteUVs.x + texelSize.x * paletteIndex;
            source = texture2D(paletteTexture, vec2(palette_V, i));
            break;
        }
    }

    gl_FragColor = (source * v_vColour);
}