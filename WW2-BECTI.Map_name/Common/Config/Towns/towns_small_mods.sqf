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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
/*
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1;
	case 2: {
	};
	default {
		INFANTRY = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman_Jerkins", _sid],1]];
		INFANTRY_MG = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Engineer", _sid],1],[format["%1LIB_UK_Engineer", _sid],1]];
		INFANTRY_AT = [[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Medic", _sid],1],[format["%1LIB_UK_Grenadier_Jerkins", _sid],1],[format["%1LIB_UK_Rifleman", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1],[format["%1LIB_UK_Grenadier", _sid],1]];

		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			INFANTRY = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Radioman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Engineer_w", _sid],1],[format["%1LIB_UK_Engineer_w", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Medic_w", _sid],1],[format["%1LIB_UK_Radioman_w", _sid],1],[format["%1LIB_UK_Rifleman_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1],[format["%1LIB_UK_Grenadier_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			INFANTRY = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Radioman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Engineer", _sid],1],[format["%1LIB_UK_DR_Engineer", _sid],1]];
			INFANTRY_AT = [[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Medic", _sid],1],[format["%1LIB_UK_DR_Radioman", _sid],1],[format["%1LIB_UK_DR_Rifleman", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1],[format["%1LIB_UK_DR_Grenadier", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};
*/
//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
/*
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 0: {
		WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_Hood", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_Hood", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_UK_DR_Willys_MB", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_UK_DR_Willys_MB", _sid],1]];
		};
	};
	case 1: {
	};
	case 2: {
	};
	case 3: {
	};
	case 4: {
	};
	default {
		WHEELED_LIGHT = INFANTRY;
		WHEELED_HEAVY = INFANTRY_MG;
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};
*/
//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 0;
		case 1;
		case 2;
		case 3;
		case 4: {
			TRACKED_LIGHT append [[format["%1SOV_BT_BT7A", _sid],1],[format["%1SOV_BT_BT7_M1937", _sid],1],[format["%1SOV_BT_BT7TU_M1937", _sid],1]];
		};
		default {
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	if(CTI_SAB_ADDON > 0) then {
		
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_gladiator", _sid],1]];
			};
			case 1: {
				AIR_FIGHTER append [[format["%1sab_ca12bo", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_mb5", _sid],1]];
			};
			case 3;
			case 4;
			case 5: {
				AIR_FIGHTER append [[format["%1sab_mb5", _sid],1],[format["%1sab_ca12bo", _sid],1]];
				AIR_BOMBER append [[format["%1sab_meteor", _sid],1]];
			};
			default {
			};
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_fl_hurricane", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_hurricane", _sid],1]];
			};
			case 1;
			case 2: {
				AIR_FIGHTER append [[format["%1sab_fl_hurricane", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_hurricane_2", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_fl_hurricane", _sid],1],[format["%1sab_fl_hurricane_2", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_hurricane_2", _sid],1]];
			};
			case 4;
			case 5: {
				AIR_FIGHTER append [[format["%1sab_fl_hurricane", _sid],1],[format["%1sab_fl_hurricane_2", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_dh98", _sid],1]];
			};
			default {
			};
		};
	};

};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_p26", _sid],1]];
				AIR_BOMBER append [[format["%1sab_p26", _sid],1]];
			};
			case 1: {
				AIR_FIGHTER append [[format["%1sab_texan", _sid],1],[format["%1sab_avenger", _sid],1],[format["%1sab_p26", _sid],1]];
				AIR_BOMBER append [[format["%1sab_dauntless", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_corsair", _sid],1],[format["%1sab_texan", _sid],1],[format["%1sab_avenger", _sid],1]];
				AIR_BOMBER append [[format["%1sab_p38", _sid],1],[format["%1sab_dauntless", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_mustang", _sid],1],[format["%1sab_a26", _sid],1],[format["%1sab_corsair", _sid],1]];
				AIR_BOMBER append [[format["%1sab_b25", _sid],1],[format["%1sab_p38", _sid],1],[format["%1sab_dauntless", _sid],1]];
			};
			case 4: {
				AIR_FIGHTER append [[format["%1sab_tigercat", _sid],1],[format["%1sab_f6f", _sid],1],[format["%1sab_mustang", _sid],1],[format["%1sab_corsair", _sid],1]];
				AIR_BOMBER append [[format["%1sab_b24", _sid],1],[format["%1sab_b25", _sid],1]];
			};
			case 5: {
				AIR_FIGHTER append [[format["%1sab_p61", _sid],1],[format["%1sab_tigercat", _sid],1],[format["%1sab_f6f", _sid],1],[format["%1sab_mustang", _sid],1]];
				AIR_BOMBER append [[format["%1sab_b17", _sid],1],[format["%1sab_b24", _sid],1]];
			};
			default {
			};
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 3;
			case 4;
			case 5: {
				AIR_FIGHTER append [[format["%1sab_fl_p51d", _sid],1]];
			};
			default {
			};
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0;
			case 1: {
				AIR_FIGHTER append [[format["%1sab_i16", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
				AIR_BOMBER append [[format["%1sab_p39", _sid],1]];
			};
			case 4: {
				AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
				AIR_BOMBER append [[format["%1sab_p39", _sid],1],[format["%1sab_tusb2", _sid],1]];
			};
			case 5: {
				AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_p39", _sid],1]];
				AIR_BOMBER append [[format["%1sab_tusb2", _sid],1],[format["%1sab_il2", _sid],1]];
			};
			default {
			};
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0;
			case 1;
			case 2;
			case 3;
			case 4;
			case 5: {
				AIR_FIGHTER append [[format["%1sab_fl_yak3", _sid],1]];
			};
			default {
			};
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_avia", _sid],1]];
				AIR_BOMBER append [[format["%1sab_bu131", _sid],1]];
			};
			case 1: {
				AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ju87", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ju88", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1],[format["%1sab_fw190", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
			};
			case 4: {
				AIR_FIGHTER append [[format["%1sab_fw190", _sid],1],[format["%1sab_ta152c", _sid],1],[format["%1sab_bf110", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
			};
			case 5: {
				AIR_FIGHTER append [[format["%1sab_fw190", _sid],1],[format["%1sab_me262", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
			};
			default {
			};
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109e", _sid],1]];
			};
			case 1: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109e", _sid],1],[format["%1sab_fl_bf109f", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109f", _sid],1],[format["%1sab_fl_bf109g", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109k", _sid],1],[format["%1sab_fl_fw190a", _sid],1]];
			};
			case 4: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109g", _sid],1],[format["%1sab_fl_bf109k", _sid],1],[format["%1sab_fl_fw190a", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_ju88a", _sid],1]];
			};
			case 5: {
				AIR_FIGHTER append [[format["%1sab_fl_bf109k", _sid],1],[format["%1sab_fl_fw190a", _sid],1]];
				AIR_BOMBER append [[format["%1sab_fl_ju88a", _sid],1]];
			};
			default {
			};
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		
		
		switch (CTI_ECONOMY_LEVEL_AIR) do {
			case 0: {
				AIR_FIGHTER append [[format["%1sab_m6a", _sid],1]];
			};
			case 1: {
				AIR_FIGHTER append [[format["%1sab_a5m", _sid],1]];
			};
			case 2: {
				AIR_FIGHTER append [[format["%1sab_aichival", _sid],1],[format["%1sab_a5m", _sid],1]];
				AIR_BOMBER append [[format["%1sab_kate", _sid],1]];
			};
			case 3: {
				AIR_FIGHTER append [[format["%1sab_zero", _sid],1],[format["%1sab_aichival", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ki61", _sid],1],[format["%1sab_kate", _sid],1]];
			};
			case 4;
			case 5: {
				AIR_FIGHTER append [[format["%1sab_zero", _sid],1],[format["%1sab_ki100", _sid],1]];
				AIR_BOMBER append [[format["%1sab_ki61", _sid],1]];
			};
			default {
				//AIR_FIGHTER = INFANTRY;
				//AIR_BOMBER = INFANTRY;
			};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];

ANTI_AIR = INFANTRY;
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		ANTI_AIR = [[format["%1LIB_UK_M16_Halftrack", _sid],1],[format["%1LIB_UK_M16_Halftrack", _sid],1]];
	};
};*/
if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
