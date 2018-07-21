/// @description switch mode
// You can write your code in this editor


switch (mode_edition) {
    case EDITEUR_MODE.NORMAL:
        mode_edition = EDITEUR_MODE.DEPENDANCE_1
		with obj_master
		{
			if !activant{
				image_alpha = 0.5	
			} else {
				image_alpha = 1	
			}
		}
		sprite_index = -1
		current_type = obj_dependance
        break;
    case EDITEUR_MODE.DEPENDANCE_1:
        mode_edition = EDITEUR_MODE.NORMAL
		with obj_master
		{
				image_alpha = 1	
		}
        break;
	case EDITEUR_MODE.DEPENDANCE_2:
        mode_edition = EDITEUR_MODE.NORMAL
		//todo : briser fleche
		with (obj_master)
		{
			image_alpha = 1	
		}
        break;
    default:
        // code here
        break;
}