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
	inf_to_add = [[format["%1fow_s_us_at_asst", _sid], 1, 30]];
	inf_to_add pushBack [format["%1fow_s_us_engineer", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_us_medic", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_us_radio_operator", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_rifleman", _sid], 1, 60];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_gl", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_ithaca37", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_m1903", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_m1912", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_scout", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_smg_m3", _sid], 1, 20];
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_us_m37_at_asst", _sid], 1, 30]];	
		inf_to_add pushBack [format["%1fow_s_us_m37_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1fow_s_us_m37_medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1fow_s_us_m37_radio_operator", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman", _sid], 1, 60];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_gl", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_ithaca37", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_m1903", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_m1912", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_scout", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_smg_m3", _sid], 1, 20];
	};
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	inf_to_add = [[format["%1fow_s_us_bar_asst", _sid], 1, 20]];
	inf_to_add pushBack [format["%1fow_s_us_bar_gunner", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_us_at", _sid], 1, 30];
	inf_to_add pushBack [format["%1fow_s_us_nco", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_us_officer", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_us_rifleman_m1_carbine", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_us_smg_m1a1", _sid], 1, 30];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_us_m37_bar_asst", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1fow_s_us_m37_bar_gunner", _sid], 1, 20];
		inf_to_add pushBack [format["%1fow_s_us_m37_at", _sid], 1, 30];
		inf_to_add pushBack [format["%1fow_s_us_m37_nco", _sid], 1, 10];
		inf_to_add pushBack [format["%1fow_s_us_m37_officer", _sid], 1, 10];
		inf_to_add pushBack [format["%1fow_s_us_m37_rifleman_m1_carbine", _sid], 1, 20];
		inf_to_add pushBack [format["%1fow_s_us_m37_smg_m1a1", _sid], 1, 30];
	};
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	inf_to_add = [[format["%1fow_s_us_m1919a6_asst", _sid], 1, 20]];
	inf_to_add pushBack [format["%1fow_s_us_m1919a6_gunner", _sid], 1, 20];
	inf_to_add pushBack [format["%1fow_s_us_sniper_m1903a1", _sid], 1, 10];
	inf_to_add pushBack [format["%1fow_s_us_teamleader", _sid], 1, 5];
	inf_to_add pushBack [format["%1fow_s_us_teamleader_asst", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1fow_s_us_m37_m1919a6_asst", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1fow_s_us_m37_m1919a6_gunner", _sid], 1, 20];
		inf_to_add pushBack [format["%1fow_s_us_m37_sniper_m1903a1", _sid], 1, 10];
		inf_to_add pushBack [format["%1fow_s_us_m37_teamleader", _sid], 1, 5];
		inf_to_add pushBack [format["%1fow_s_us_m37_teamleader_asst", _sid], 1, 10];
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
units_wheeled = [];
mot_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	//units_wheeled = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	mot_to_add = [[format["%1fow_v_willys_usa", _sid], 1, 20]];
	mot_to_add pushBack [format["%1fow_v_willys_usmc", _sid], 1, 20];
	
	units_wheeled = [];
	units_wheeled = +mot_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	mot_to_add = [[format["%1fow_v_gmc_usa", _sid], 1, 20]];
	mot_to_add pushBack [format["%1fow_v_gmc_open_usa", _sid], 1, 20];
	mot_to_add pushBack [format["%1fow_v_gmc_usmc", _sid], 1, 20];
	mot_to_add pushBack [format["%1fow_v_gmc_open_usmc", _sid], 1, 20];
	
	units_wheeled = +mot_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];


//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	//units_tracked = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1fow_v_lvta2_usa_p", _sid], 1, 20]];
	arm_to_add pushBack [[format["%1fow_v_lvta2_usa", _sid], 1, 20]];
	arm_to_add pushBack [[format["%1fow_v_lvta2_usmc", _sid], 1, 20]];
	
	units_tracked = [];
	units_tracked = +arm_to_add;
	_level = _level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1fow_v_m5a1_usa", _sid], 1, 50]];
	arm_to_add pushBack [[format["%1fow_v_m5a1_usmc", _sid], 1, 50]];
	units_tracked append arm_to_add;
	_level = _level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1fow_v_m4a2_usa", _sid], 1, 40]];
	arm_to_add pushBack [[format["%1fow_v_m4a2_usmc", _sid], 1, 40]];
	
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

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_antiair = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_antiair = [[format["%1LIB_US_Willys_MB_M1919", _sid], 1]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_antiair = [[format["%1LIB_US_M16_Halftrack", _sid], 1]];
	};
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
units_air = [];

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	//units_air = +units_infantry;
};
if(CTI_IFA3_NEW >= 0) then {_level = 3} else {_level = 0};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1fow_va_f6f", _sid], 1, 50]];
	units_air pushBack [format["%1fow_va_f6f_kick", _sid], 1, 50];
	units_air pushBack [format["%1fow_va_f6f_sweet", _sid], 1, 50];
	units_air pushBack [format["%1fow_va_f6f_c", _sid], 1, 50];
	units_air pushBack [format["%1fow_va_f6f_c_death", _sid], 1, 50];
	units_air pushBack [format["%1fow_va_f6f_c_kick", _sid], 1, 50];
	units_air pushBack [format["%1fow_va_f6f_c_sweet", _sid], 1, 50];
	
	//units_air = units_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_US_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";