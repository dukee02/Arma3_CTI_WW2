_side = _this;
_sid = "";

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

if(CTI_IFA3_NEW < 0) then {
	//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["ArmoredMBT", 2, 80]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Infantry", 1, 40]]];

	missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

	//--- Those are used by the commander to determine the kind of unit an AI team has
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 
};

//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	inf_to_add = [[format["%1fow_s_ger_heer_rifleman", _sid], 1, 60]];
	inf_to_add pushBack [format["%1fow_s_ger_heer_medic", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_ger_heer_radio_operator", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_ger_heer_rifleman_mp40", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_ger_heer_tl_mp40", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_ger_heer_rifleman_mp40_pzf", _sid], 1, 30];
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	inf_to_add = [[format["%1fow_s_ger_heer_rifleman_g43", _sid], 1, 40]];
	inf_to_add pushBack [format["%1fow_s_ger_heer_mg34_gunner", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_ger_heer_nco_mp40", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_ger_heer_tl_asst", _sid], 1, 10];
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	inf_to_add = [[format["%1fow_s_ger_heer_mg42_gunner", _sid], 1, 10]];
	inf_to_add pushBack [format["%1fow_s_ger_heer_tl_stg", _sid], 1, 5];
	
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
//														Motorized Troops																*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	mot_to_add = [[format["%1fow_v_kubelwagen_ger_heer", _sid], 1, 20]];
	mot_to_add pushback [format["%1fow_v_kubelwagen_camo_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_camo_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_camo_foliage_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_ger_heer", _sid], 1, 30];
	
	units_wheeled = mot_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	mot_to_add = [[format["%1fow_v_kubelwagen_mg34_ger_heer", _sid], 1, 20]];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_9_ger_heer", _sid], 1, 30];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_9_camo_foliage_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_9_camo_ger_heer", _sid], 1, 20];
	
	units_wheeled = mot_to_add;
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	mot_to_add = [[format["%1fow_v_sdkfz_251_camo_ger_heer", _sid], 1, 40]];
	mot_to_add pushback [format["%1fow_v_sdkfz_251_camo_foliage_ger_heer", _sid], 1, 20];
	
	units_wheeled append mot_to_add;
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	mot_to_add = [[format["%1fow_v_sdkfz_222_ger_heer", _sid], 1, 30]];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_foliage_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_camo_ger_heer", _sid], 1, 20];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_ger_ss", _sid], 1, 20];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_foliage_ger_ss", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_camo_ger_ss", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_222_camo_foliage_ger_ss", _sid], 1, 10];
	
	units_wheeled append mot_to_add;
};
//Level 4
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	mot_to_add = [[format["%1fow_v_sdkfz_234_1", _sid], 1, 30]];
	
	units_wheeled append mot_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];



//***************************************************************************************************************************************
//														Armored Troops																	*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	units_tracked = +units_infantry;
};
if(CTI_IFA3_NEW >= 0) then {_level = 4} else {_level = 0};

if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1fow_v_panther_ger_heer", _sid], 1, 50]];
	arm_to_add pushback [format["%1fow_v_panther_camo_foliage_ger_heer", _sid], 1, 10];
	arm_to_add pushback [format["%1fow_v_panther_camo_ger_heer", _sid], 1, 20];
	
	units_tracked = arm_to_add;
	_level = _level + 1;
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];


//***************************************************************************************************************************************
//														AntiAir Troops																	*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
/*units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0 && CTI_ECONOMY_LEVEL_TRACKED < 2) then {
	units_antiair = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [[format["%1LIB_Kfz1_MG42", _sid], 1, 60]];
	units_tracked = units_to_add;
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];*/

//***************************************************************************************************************************************
//														Air Troops																	*
//***************************************************************************************************************************************
//Air setup for the AI groups
/*units_air = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	units_air = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		units_to_add = [[format["%1LIB_Ju87_G2", _sid], 1, 40]];
	};
	units_air append units_to_add;
	_level = _level + 1;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_GER_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";