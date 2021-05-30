/// @description Draw white block
if (drawWhite || !global.isShader)
{
	draw_rectangle_color((global.viewX - 8), (global.viewY - 8), (global.viewX + (global.viewW + 8)), (global.viewY + (global.viewH + 8)), colArray[drawCol], colArray[drawCol], colArray[drawCol], colArray[drawCol], false)
}