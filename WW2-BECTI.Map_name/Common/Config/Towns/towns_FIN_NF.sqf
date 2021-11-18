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
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
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
		switch (CTI_CAMO_ACTIVATION) do {
			case 1: {
				INFANTRY = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_W_41_Submachinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1]];
			};
			case 2: {
				INFANTRY = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_S_41_Submachinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1]];
			};
			default {
				INFANTRY = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_W_39_Submachinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT_Kasapanos", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1]];
			};
		};
	};
	case 2: {
		switch (CTI_CAMO_ACTIVATION) do {
			case 1: {
				INFANTRY = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Sniper", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_W_41_Machinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1]];
			};
			case 2: {
				INFANTRY = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Sniper", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_S_41_Machinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1]];
			};
			default {
				INFANTRY = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Sniper", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Autorifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Submachinegunner", _sid],1],[format["%1I_NORTH_FIN_W_39_Machinegunner", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT_Kasapanos", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1]];
			};
		};
	};
	default {
		switch (CTI_CAMO_ACTIVATION) do {
			case 1: {
				INFANTRY = [[format["%1I_NORTH_FIN_W_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Patrolman", _sid],1],[format["%1I_NORTH_FIN_W_41_Patrolman", _sid],1],[format["%1I_NORTH_FIN_W_41_Patrolman", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_W_41_Medic", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid],1]];
			};
			case 2: {
				INFANTRY = [[format["%1I_NORTH_FIN_S_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_S_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Patrolman", _sid],1],[format["%1I_NORTH_FIN_S_41_Patrolman", _sid],1],[format["%1I_NORTH_FIN_S_41_Patrolman", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_S_41_SgtMaj", _sid],1],[format["%1I_NORTH_FIN_S_41_Medic", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid],1]];
			};
			default {
				INFANTRY = [[format["%1I_NORTH_FIN_W_39_SGTMAJ", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman", _sid],1]];
				INFANTRY_MG = [[format["%1I_NORTH_FIN_W_39_SGTMAJ", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Patrolman", _sid],1],[format["%1I_NORTH_FIN_W_39_Patrolman", _sid],1],[format["%1I_NORTH_FIN_W_39_Patrolman", _sid],1]];
				INFANTRY_AT = [[format["%1I_NORTH_FIN_W_39_SGTMAJ", _sid],1],[format["%1I_NORTH_FIN_W_39_Medic", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT_Kasapanos", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1],[format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid],1]];
			};
		};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
/*WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 0: {
		WHEELED_LIGHT = [[format["%1LIB_GazM1_SOV", _sid],1],[format["%1LIB_GazM1_SOV", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_GazM1_SOV_camo_sand", _sid],1],[format["%1LIB_GazM1_SOV_camo_sand", _sid],1]];
	};
	default {
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};
*/
//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_41_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_W_41_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_W_41_T26E", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_41_T26_M33", _sid],1],[format["%1NORTH_FIN_W_41_T26_M38", _sid],1]];
			};
			case 2: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_S_41_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_S_41_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_S_41_T26E", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_S_41_T26_M33", _sid],1],[format["%1NORTH_FIN_S_41_T26_M38", _sid],1]];
			};
			default {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_39_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_W_39_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_Vickers6t", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_39_T26_M33", _sid],1],[format["%1NORTH_FIN_W_39_T26_M38", _sid],1]];
			};
		};
	};
	case 2: {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_41_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_W_41_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_W_41_T26E", _sid],1],[format["%1NORTH_FIN_W_41_T26_M33", _sid],1],[format["%1NORTH_FIN_W_41_T26_M38", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_41_T28", _sid],1],[format["%1NORTH_FIN_W_41_T28e", _sid],1]];
			};
			case 2: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_S_41_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_S_41_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_S_41_T26E", _sid],1],[format["%1NORTH_FIN_S_41_T26_M33", _sid],1],[format["%1NORTH_FIN_S_41_T26_M38", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_S_41_T28", _sid],1],[format["%1NORTH_FIN_S_41_T28e", _sid],1]];
			};
			default {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_39_T26_M33_OT", _sid],1],[format["%1NORTH_FIN_W_39_T26_M31", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_Vickers6t", _sid],1],[format["%1NORTH_FIN_W_39_T26_M33", _sid],1],[format["%1NORTH_FIN_W_39_T26_M38", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_39_T28", _sid],1]];
			};
		};
	};
	default {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_41_T26_M33_OT", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_W_41_T26_M31", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_41_T26_M31", _sid],1]];
			};
			case 2: {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_S_41_T26_M33_OT", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_S_41_T26_M31", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_S_41_T26_M31", _sid],1]];
			};
			default {
				TRACKED_LIGHT = [[format["%1NORTH_FIN_W_39_T26_M33_OT", _sid],1]];
				TRACKED_MEDIUM = [[format["%1NORTH_FIN_W_39_T26_M31", _sid],1]];
				TRACKED_HEAVY = [[format["%1NORTH_FIN_W_39_T26_M31", _sid],1]];
			};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
/*AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_FIGHTER = [[format["%1LIB_Pe2", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Pe2", _sid],1]];
	};
	default {
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
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};
*/
//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
/*ANTI_AIR = [];

ANTI_AIR = INFANTRY;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = [[format["%1LIB_Zis5v_61K", _sid],1],[format["%1LIB_Zis5v_61K", _sid],1]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		ANTI_AIR = [[format["%1LIB_Zis5v_61K", _sid],1],[format["%1LIB_SOV_M16_Halftrack", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_FIN_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
*/
