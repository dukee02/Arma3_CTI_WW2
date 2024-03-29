_side = _this;
_sid = "";
_level = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["ArmoredMBT", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 

//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			inf_to_add = [[format["%1O_NORTH_SOV_W_41_Medic", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman_1CL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman_SGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman_SSGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Engineer", _sid], 1, 20];
		};
		case 2: {
			inf_to_add = [[format["%1O_NORTH_SOV_41_Rifleman", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Rifleman_1CL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Rifleman_SGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Rifleman_SSGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Medic", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Engineer", _sid], 1, 20];
		};
		default {
			inf_to_add = [[format["%1O_NORTH_SOV_W_39_Rifleman", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Rifleman_SSGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Medic", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Engineer", _sid], 1, 20];
		};
	};
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			inf_to_add = [[format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Submachinegunner_1CL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Submachinegunner_CPL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Submachinegunner_SGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Submachinegunner_SSGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Autorifleman", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Autorifleman_38", _sid], 1, 20];
		};
		case 2: {
			inf_to_add = [[format["%1O_NORTH_SOV_41_Autorifleman_38", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Autorifleman", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner_1CL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner_CPL", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner_SGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner_SSGT", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Submachinegunner_38", _sid], 1, 20];
		};
		default {
			inf_to_add = [[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Submachinegunner_38", _sid], 1, 20];
		};
	};
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			inf_to_add = [[format["%1O_NORTH_SOV_W_41_Machinegunner", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Machinegunner_Assistant", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Sniper", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Officer_Lt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid], 1, 20];
		};
		case 2: {
			inf_to_add = [[format["%1O_NORTH_SOV_41_Machinegunner", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Machinegunner_Assistant", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Sniper", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Officer_Lt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_41_Officer_1stLt", _sid], 1, 20];
		};
		default {
			inf_to_add = [[format["%1O_NORTH_SOV_W_39_Machinegunner", _sid], 1, 60]];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Machinegunner_Assistant", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Sniper", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Officer_Lt", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Officer", _sid], 1, 20];
			inf_to_add pushBack [format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid], 1, 20];
		};
	};
	units_infantry append inf_to_add;
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];


//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
/*units_wheeled = [];
mot_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1LIB_GazM1_SOV", _sid], 1, 10]];	
	units_wheeled = mot_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			arm_to_add = [[format["%1NORTH_SOV_W_41_T26_M33_OT", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_W_41_T26_M31", _sid], 1, 20];
		};
		default {
			arm_to_add = [[format["%1NORTH_SOV_41_T26_M33_OT", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_41_T26_M31", _sid], 1, 20];
		};
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			arm_to_add = [[format["%1NORTH_SOV_W_41_T26_M33", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_W_41_T26_M33com", _sid], 1, 20];
		};
		default {
			arm_to_add = [[format["%1NORTH_SOV_41_T26_M33", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_41_T26_M33com", _sid], 1, 20];
		};
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			arm_to_add = [[format["%1NORTH_SOV_W_41_T28", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_W_41_T28_com", _sid], 1, 20];
			arm_to_add pushBack [format["%1NORTH_SOV_W_41_T26_M38", _sid], 1, 20];
		};
		default {
			arm_to_add = [[format["%1NORTH_SOV_41_T28", _sid], 1, 60]];
			arm_to_add pushBack [format["%1NORTH_SOV_41_T28_com", _sid], 1, 20];
			arm_to_add pushBack [format["%1NORTH_SOV_41_T26_M38", _sid], 1, 20];
		};
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			arm_to_add pushBack [format["%1NORTH_SOV_W_41_T28e", _sid], 1, 20];
		};
		default {
			arm_to_add pushBack [format["%1NORTH_SOV_41_T28e", _sid], 1, 20];
		};
	};
	units_tracked append arm_to_add;
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];

//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
/*units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_antiair = [[format["%1LIB_Zis5v_61K", _sid], 1, 30]];
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
/*units_air = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1LIB_Pe2", _sid], 1, 50]];
	_level = _level + 2;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_NF.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";