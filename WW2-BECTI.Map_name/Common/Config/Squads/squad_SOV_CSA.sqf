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

/*
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
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; */

//Infantry setup for the AI groups
/*units_infantry = [];
inf_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	inf_to_add = [[format["%1LIB_SOV_rifleman", _sid], 1, 60]];
	inf_to_add pushBack [format["%1LIB_SOV_medic", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [[format["%1LIB_SOV_LC_rifleman", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1LIB_SOV_medic", _sid], 1, 20];
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
*/

//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
/*units_wheeled = [];
mot_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	mot_to_add = [[format["%1", _sid], 1, 40]];
	mot_to_add pushBack [format["%1", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1", _sid], 1, 40]];
		mot_to_add pushBack [format["%1", _sid], 1, 40];
	};
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

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_tracked pushBack [format["%1csa38_m3a3RU2", _sid], 1, 30];
	} else {
		units_tracked pushBack [format["%1csa38_m3a3RU1", _sid], 1, 30];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_tracked pushBack [format["%1csa38_t34RU3", _sid], 1, 30];
	} else {
		units_tracked pushBack [format["%1csa38_t34RU1", _sid], 1, 30];
		units_tracked pushBack [format["%1csa38_t34RU2", _sid], 1, 30];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_tracked pushBack [format["%1csa38_matildaii_RU2", _sid], 1, 30];
	} else {
		units_tracked pushBack [format["%1csa38_matildaii_RU1", _sid], 1, 30];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_tracked pushBack [format["%1csa38_valentineMkIIRU2", _sid], 1, 30];
	} else {
		units_tracked pushBack [format["%1csa38_valentineMkIIRU1", _sid], 1, 30];
	};
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
	units_antiair = [[format["%1", _sid], 1, 30]];
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

if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_to_add = [[format["%1LIB_P39", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [[format["%1LIB_P39_w", _sid], 1, 60]];
	};
	units_air append units_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_CSA.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
