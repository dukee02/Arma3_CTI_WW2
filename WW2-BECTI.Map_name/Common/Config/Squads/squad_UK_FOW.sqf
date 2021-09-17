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
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Infantry", 2, 60]]];
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
units_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	units_to_add = [[format["%1fow_s_uk_at_asst", _sid], 1, 40]];
	units_to_add pushBack [format["%1fow_s_uk_bren_asst", _sid], 1, 40];
	units_to_add pushBack [format["%1fow_s_uk_medic", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_radio_operator", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_rifleman", _sid], 1, 60];
	units_to_add pushBack [format["%1fow_s_uk_para_at_asst", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_para_bren_asst", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_para_medic", _sid], 1, 10];
	units_to_add pushBack [format["%1fow_s_uk_para_radio_operator", _sid], 1, 10];
	units_to_add pushBack [format["%1fow_s_uk_para_rifleman", _sid], 1, 30];
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1fow_s_uk_seac_at_asst_l", _sid], 1, 40]];	
		units_to_add pushBack [format["%1fow_s_uk_seac_bren_asst_l", _sid], 1, 40];
		units_to_add pushBack [format["%1fow_s_uk_seac_medic_l", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_radio_operator_l", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_rifleman_l", _sid], 1, 60];
		units_to_add pushBack [format["%1fow_s_uk_seac_at_asst", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_bren_asst", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_medic", _sid], 1, 10];
		units_to_add pushBack [format["%1fow_s_uk_seac_radio_operator", _sid], 1, 10];
		units_to_add pushBack [format["%1fow_s_uk_seac_rifleman", _sid], 1, 30];
	};
	units_infantry append units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	units_to_add = [[format["%1fow_s_uk_at", _sid], 1, 40]];
	units_to_add pushBack [format["%1fow_s_uk_bren_gunner", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_officer", _sid], 1, 10];
	units_to_add pushBack [format["%1fow_s_uk_para_at", _sid], 1, 20];
	units_to_add pushBack [format["%1fow_s_uk_para_bren_gunner", _sid], 1, 10];
	units_to_add pushBack [format["%1fow_s_uk_para_officer", _sid], 1, 5];
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1fow_s_uk_seac_at_l", _sid], 1, 40]];	
		units_to_add pushBack [format["%1fow_s_uk_seac_bren_gunner_l", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_officer_l", _sid], 1, 10];
		units_to_add pushBack [format["%1fow_s_uk_seac_at", _sid], 1, 20];
		units_to_add pushBack [format["%1fow_s_uk_seac_bren_gunner", _sid], 1, 10];
		units_to_add pushBack [format["%1fow_s_uk_seac_officer", _sid], 1, 5];
	};
	units_infantry append units_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	units_to_add = [[format["%1fow_s_uk_section_commander", _sid], 1, 10]];
	units_to_add pushBack [format["%1fow_s_uk_teamleader", _sid], 1, 10];
	units_to_add pushBack [format["%1fow_s_uk_para_section_commander", _sid], 1, 5];
	units_to_add pushBack [format["%1fow_s_uk_para_teamleader", _sid], 1, 5];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1fow_s_uk_seac_section_commander_l", _sid], 1, 10]];	
		units_to_add pushBack [format["%1fow_s_uk_seac_teamleader_l", _sid], 1, 10];
		units_to_add pushBack [format["%1fow_s_uk_seac_section_commander", _sid], 1, 5];
		units_to_add pushBack [format["%1fow_s_uk_seac_teamleader", _sid], 1, 5];
	};
	units_infantry append units_to_add;
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
units_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [[format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20]];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20]];		
	};
	units_wheeled = units_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_to_add = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 40]];	
	};
	units_wheeled = units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	units_to_add = [[format["%1LIB_UK_M3_Halftrack", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [[format["%1LIB_UK_DR_M3_Halftrack", _sid], 1, 60]];
	};
	units_wheeled append units_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];*/

//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_TRACKED < 0) then {
	units_tracked = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	units_to_add = [[format["%1fow_v_universalCarrier", _sid], 1, 50]];	
	
	units_tracked = units_to_add;
};
//Level 2 / 1
if(CTI_IFA3_NEW >= 0) then {_level = 2} else {_level = 1};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_to_add = [[format["%1fow_v_cromwell_uk", _sid], 1, 50]];
	
	units_tracked = units_to_add;
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
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_antiair = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 30]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_antiair = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 30]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_antiair = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 30]];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_antiair pushBack [format["%1LIB_UK_M16_Halftrack", _sid], 1, 50];
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
_level = 0;

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	units_air = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1fow_va_f6f_faa", _sid], 1, 60]];
	units_air pushBack [format["%1fow_va_f6f_c_faa", _sid], 1, 60];
	_level = _level + 1;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_UK_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";