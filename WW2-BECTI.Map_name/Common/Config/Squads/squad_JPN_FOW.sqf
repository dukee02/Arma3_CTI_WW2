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
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

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
	inf_to_add = [[format["%1fow_s_ija_snlf_rifleman", _sid], 1, 60]];
	inf_to_add pushBack [format["%1fow_s_ija_snlf_rifleman_at", _sid], 1, 40];
	inf_to_add pushBack [format["%1fow_s_ija_snlf_medic", _sid], 1, 20];
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_ija_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1fow_s_ija_rifleman_at", _sid], 1, 40];
		inf_to_add pushBack [format["%1fow_s_ija_medic", _sid], 1, 20];
	};
	inf_to_add pushBack [format["%1fow_s_ija_f_rifleman", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_ija_f_rifleman_at", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_ija_f_medic", _sid], 1, 10];
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	inf_to_add = [[format["%1fow_s_ija_snlf_type99_asst", _sid], 1, 40]];
	inf_to_add pushBack [format["%1fow_s_ija_snlf_type99_gunner", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_ija_snlf_nco", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_ija_type99_asst", _sid], 1, 40]];
		inf_to_add pushBack [format["%1fow_s_ija_type99_gunner", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_ija_nco", _sid], 1, 10];
	};
	inf_to_add pushBack [format["%1fow_s_ija_f_type99_asst", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_ija_f_type99_gunner", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_ija_f_nco", _sid], 1, 5];
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	inf_to_add = [[format["%1fow_s_ija_f_officer", _sid], 1, 10]];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_ija_officer", _sid], 1, 10]];
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
//														Motorized Troops																*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = +units_infantry;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	mot_to_add = [[format["%1fow_v_type97_truck_open_ija", _sid], 1, 20]];
	mot_to_add pushback [format["%1fow_v_type97_truck_ija", _sid], 1, 30];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_9_camo_foliage_ger_heer", _sid], 1, 10];
	mot_to_add pushback [format["%1fow_v_sdkfz_250_9_camo_ger_heer", _sid], 1, 20];
	
	units_wheeled = mot_to_add;
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

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	units_tracked = +units_infantry;
};
_level = 0;
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1fow_ija_type95_HaGo_1_ija", _sid], 1, 50]];
	arm_to_add pushback [format["%1fow_ija_type95_HaGo_2_ija", _sid], 1, 10];
	arm_to_add pushback [format["%1fow_ija_type95_HaGo_3_ija", _sid], 1, 20];
	
	units_tracked = arm_to_add;
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
units_air = [];
air_to_add = [];
_level = 0;

if(CTI_IFA3_NEW >= 0) then {_level = 3} else {_level = 0};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_IFA3_NEW > 0) then {
		air_to_add = [[format["%1fow_va_a6m_green", _sid], 1, 40]];
		air_to_add pushback [format["%1fow_va_a6m_white", _sid], 1, 60];
	};
	units_air = +air_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_JPN_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";