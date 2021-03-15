/// @description Drawing
if (phase != 0 && instance_exists(myParent))
{
	var _parentY = (myParent.image_index == 2 || myParent.image_index == 3) ? 32 : 45;
	draw_segmented_line(x, y, (myParent.x - 6), (myParent.y - _parentY), sprBomberheadChain, 32);
}

draw_self();