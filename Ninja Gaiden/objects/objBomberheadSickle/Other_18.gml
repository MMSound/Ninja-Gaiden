/// @description Drawing
if (phase != 0 && instance_exists(myParent))
{
	var _parentY = (myParent.image_index == 2 || myParent.image_index == 3) ? 32 : 45;
	var _parentX = (myParent.object_index == objJashinHead) ? myParent.bbox_left : (myParent.x - 6);
	draw_segmented_line(x, y, _parentX, (myParent.y - (_parentY * (myParent.object_index != objJashinHead))), sprBomberheadChain, 32);
}

draw_self();