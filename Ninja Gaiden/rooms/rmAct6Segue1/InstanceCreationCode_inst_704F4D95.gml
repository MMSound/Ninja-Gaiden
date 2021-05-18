nextRoom = rmAct6Boss1;
var _bossName = "";
switch (global.cutsceneLanguage)
{
	case ENG:
	case JPN:
		_bossName = "MASKED DEVIL";
		break;
	case ESP:
		_bossName = "DIABLO ENMASCARDO";
		break;
	case ITA:
		_bossName = "DIAVOLO MASCHERATO";
		break;
	case ROM:
		_bossName = "DIAVOLUL MASCAT";
		break;
	case FRE:
		_bossName = "DIABLE MASQUÉ";
		break;
}
bossName = _bossName;