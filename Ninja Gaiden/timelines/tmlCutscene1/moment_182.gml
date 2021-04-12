/// @description Start text
textbox_create(myText[0][global.cutsceneLanguage]);
if (global.cutsceneLanguage == JPN) //diacritics
{
	textbox_create(myText[0][420], 96, 147);
}