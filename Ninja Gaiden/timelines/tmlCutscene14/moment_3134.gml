/// @description Start text
var _textHalfLength = ((string_length(myText[8][global.cutsceneLanguage]) / 2) * 8);
var _xPos = ((global.viewW / 2) - _textHalfLength);
textbox_create(myText[8][global.cutsceneLanguage], _xPos, ((global.viewH / 2) - 4));
japanese_textbox(8, _xPos, ((global.viewH / 2) - 9));