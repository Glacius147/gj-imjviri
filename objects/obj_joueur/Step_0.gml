/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.OFF
{

k_left = keyboard_check(vk_left) || keyboard_check(ord("Q")) ;
k_right = keyboard_check(vk_right) || keyboard_check(ord("D")) ;
k_up = keyboard_check(vk_up) || keyboard_check(ord("Z")) ;
k_down = keyboard_check(vk_down) || keyboard_check(ord("S")) ;
k_sword = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("B")) || keyboard_check_pressed(vk_up) || gamepad_button_check(0,gp_face1);





}
