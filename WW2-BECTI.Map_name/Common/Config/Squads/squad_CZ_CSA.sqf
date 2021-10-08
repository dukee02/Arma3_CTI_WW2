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
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Infantry", 1, 60]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["ArmoredMBT", 2, 80]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["ArmoredMBT", 1, 40]]];

	missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "ArmoredMBT"]];

	//--- Those are used by the commander to determine the kind of unit an AI team has
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Infantry"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["ArmoredMBT"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["ArmoredMBT"]]; 
};

//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	inf_to_add = [[format["%1CSA38_soldier5_6", _sid], 1, 250]];//artyman
	inf_to_add pushBack [format["%1CSA38_soldier5_1", _sid], 1, 40];//grenadier
	inf_to_add pushBack [format["%1CSA38_soldier5_1b", _sid], 1, 40];//grenadier
	inf_to_add pushBack [format["%1CSA38_soldier1", _sid], 1, 10];//guard
	inf_to_add pushBack [format["%1CSA38_soldier3", _sid], 1, 30];//medic
	inf_to_add pushBack [format["%1CSA38_soldier1_16", _sid], 1, 20];//messager radioman
	inf_to_add pushBack [format["%1CSA38_soldier1_4", _sid], 1, 40];//Soldier
	inf_to_add pushBack [format["%1CSA38_soldier1_4", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier1_11", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier1_2", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier1_1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier1_12", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier1_3", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier5_3", _sid], 1, 20];//mortarteam
	inf_to_add pushBack [format["%1CSA38_soldier5_4", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_soldier5_5", _sid], 1, 20];
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	inf_to_add = [[format["%1CSA38_soldier2_1", _sid], 1, 40]];//MG team
	inf_to_add pushBack [format["%1CSA38_soldier2_1B", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_soldier2_1C", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_soldier2_1tk", _sid], 1, 30];
	
	inf_to_add pushBack [format["%1CSA38_soldier2_2", _sid], 1, 40];//HMG team
	inf_to_add pushBack [format["%1CSA38_soldier2_2tk", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_soldier2_3tk", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_soldier2_4tk", _sid], 1, 20];
	
	inf_to_add pushBack [format["%1CSA38_soldier2", _sid], 1, 20];//MG
	
	units_infantry append inf_to_add;
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	inf_to_add = [[format["%1CSA38_soldier8_1", _sid], 1, 10]];//SL
	inf_to_add pushBack [format["%1CSA38_soldier8_2", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff6", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff2", _sid], 1, 10];
	
	inf_to_add pushBack [format["%1CSA38_CZoff8", _sid], 1, 10];//TL
	inf_to_add pushBack [format["%1CSA38_CZoff1", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff7", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff9", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff4", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff10", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_CZoff5", _sid], 1, 5];//general
	
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
/*units_wheeled = [];
mot_to_add = [];

//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	mot_to_add = [[format["%1CSA38_8rad", _sid], 1, 30]];
	mot_to_add pushback [format["%1CSA38_8rad2", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1CSA38_8radW", _sid], 1, 30]];
		mot_to_add pushback [format["%1CSA38_8rad2W", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1CSA38_8radDE", _sid], 1, 30]];
		mot_to_add pushback [format["%1CSA38_8rad2DE", _sid], 1, 10];
	};
	
	units_wheeled append mot_to_add;
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
//														Armored Troops																	*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	arm_to_add = [[format["%1CSA38_TCvz33", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_ltvz34", _sid], 1, 10];
	units_tracked = arm_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	arm_to_add = [[format["%1CSA38_ltvz35", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzkpfwIAvcz", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzkpfwIvcz", _sid], 1, 10];
	
	units_tracked append arm_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	arm_to_add = [[format["%1CSA38_ltvz38", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzIIvcz", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_m5a1", _sid], 1, 10];
	
	units_tracked append arm_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	arm_to_add = [[format["%1csa38_t34cz2", _sid], 1, 50]];//named
	arm_to_add pushback [format["%1csa38_t34cz3", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_t34cz4", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_t34cz6", _sid], 1, 10];//camo
	arm_to_add pushback [format["%1csa38_t34cz1", _sid], 1, 10];//green
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1csa38_t34cz5", _sid], 1, 50]];
	};
	arm_to_add pushback [format["%1CSA38_pzIIIBvcz", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzIIICvcz", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzIIIDvcz", _sid], 1, 10];
	
	units_tracked append arm_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	arm_to_add = [[format["%1CSA38_pzIVvcz", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzIVBvcz", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_cromwell_1", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_cromwell_5", _sid], 1, 10];
	arm_to_add pushback [format["%1csa38_cromwell_4", _sid], 1, 10];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_CZ_CSA.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";