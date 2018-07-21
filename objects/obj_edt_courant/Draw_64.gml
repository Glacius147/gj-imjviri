/// @description draw minimap
// You can write your code in this editor

{
//draw minimap
var offset_x = 15*3
var offset_y = 6*3
var i;
var j;
for (i = 0; i < 16; i += 1)
	{
		for (j = 0; j < 16; j += 1)
		{
			
			x1 = 3*4*i + offset_x
			y1 = 3*3*j + offset_y
			if created_room[i,j] 
			{
				draw_set_color(c_yellow);
				draw_rectangle(x1, y1, x1+12, y1+9, false);
			}
			
			draw_set_color(c_black);
			draw_rectangle(x1, y1, x1+12, y1+9, true);
		}
	}
}