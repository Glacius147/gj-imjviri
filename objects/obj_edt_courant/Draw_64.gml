/// @description draw minimap
// You can write your code in this editor

{
var i;
for (i = 0; i < 10; i += 1)
   {
   draw_text(32, 32 + (i * 32), string(i) + ". "+ string(scr[i]));
   }
}
draw_rectangle(x1, y1, x2, y2, outline);