/// @description Drawing
if (phase != 0 && instance_exists(myParent))
{
	draw_segmented_line(x, y, myParent.x, (myParent.y - 32), sprBomberheadChain, 32);
}

draw_self();