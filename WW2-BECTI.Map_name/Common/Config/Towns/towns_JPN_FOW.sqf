_side = _this;
_sid = "";
_tag = "";

if(_side == west) then {
	_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
		INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
	};
	case 2: {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
		INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
	};
	default {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
		INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1;
	case 2;
	case 3;
	case 4: {
		WHEELED_LIGHT = [[format["%1fow_v_type97_truck_open_ija", _sid],1]];
		WHEELED_HEAVY = [[format["%1fow_v_type97_truck_ija", _sid],1]];
	};
	default {
		if(CTI_IFA3_NEW < 0) then {
			WHEELED_LIGHT = INFANTRY;
			WHEELED_HEAVY = INFANTRY_MG;
		};
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 0;
	case 1;
	case 2;
	case 3;
	case 4: {
		TRACKED_LIGHT = [[format["%1fow_ija_type95_HaGo_1_ija", _sid],1]];
		TRACKED_MEDIUM = [[format["%1fow_ija_type95_HaGo_2_ija", _sid],1]];
		TRACKED_HEAVY = [[format["%1fow_ija_type95_HaGo_3_ija", _sid],1]];
	};
	default {
		if(CTI_IFA3_NEW < 0) then {
			TRACKED_LIGHT = INFANTRY;
			TRACKED_MEDIUM = INFANTRY_MG;
			TRACKED_HEAVY = INFANTRY_AT;
		};
	};
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 0;
	case 1;
	case 2;
	case 3;
	case 4: {
		TRACKED_LIGHT = [[format["%1fow_ija_type95_HaGo_1_ija", _sid],1]];
		TRACKED_MEDIUM = [[format["%1fow_ija_type95_HaGo_2_ija", _sid],1]];
		TRACKED_HEAVY = [[format["%1fow_ija_type95_HaGo_3_ija", _sid],1]];
	};
	default {
		if(CTI_IFA3_NEW < 0) then {
			AIR_FIGHTER = INFANTRY;
			AIR_BOMBER = INFANTRY;
		};
	};
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];
if(CTI_IFA3_NEW < 0) then {
	ANTI_AIR = INFANTRY;

	if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
		missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
	} else {
		missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};