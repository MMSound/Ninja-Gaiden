/// @description Start text
textbox_create(myText[3][global.cutsceneLanguage]);
if (global.cutsceneLanguage == JPN) //diacritics
{
	textbox_create(myText[3][420], 96, 147);
}