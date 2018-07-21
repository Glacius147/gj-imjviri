/// @description switch mode
// You can write your code in this editor


switch (mode_edition) {
    case EDITEUR_MODE.NORMAL:
        mode_edition = EDITEUR_MODE.DEPENDANCE
        break;
    case EDITEUR_MODE.DEPENDANCE:
        mode_edition = EDITEUR_MODE.NORMAL
        break;
    default:
        // code here
        break;
}