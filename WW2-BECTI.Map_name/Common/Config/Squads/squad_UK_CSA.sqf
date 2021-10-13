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
inf_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	inf_to_add = [[format["%1CSA38_ENsoldier1_7", _sid], 1, 40]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier3_1", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_4", _sid], 1, 40];
	
	units_infantry append inf_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	inf_to_add = [[format["%1CSA38_ENsoldier1_5", _sid], 1, 40]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_2", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_6", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_3", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier2_1", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier2", _sid], 1, 30];
	
	units_infantry append inf_to_add;
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	inf_to_add = [[format["%1CSA38_ENsoldier8_3", _sid], 1, 20]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier8_2", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_ENsoldier8_1", _sid], 1, 5];
	
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

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20]];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20]];		
	};
	units_wheeled = mot_to_add;
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	mot_to_add = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 40]];	
	};
	units_wheeled = mot_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	mot_to_add = [[format["%1LIB_UK_M3_Halftrack", _sid], 1, 60]];
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_M3_Halftrack", _sid], 1, 60]];
	};
	units_wheeled append mot_to_add;
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
arm_to_add = [];

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {
			switch(_side) do {
				case east: {
					arm_to_add = [[format["%1csa38_m3a37ADW2", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37ADW3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37ADW4", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37ADW5", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37ADW", _sid], 1, 50]];
				};
			};
		};
		case 2: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_m3a37AD8", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD9", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_m3a37AD2", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD5", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37AD10", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD12", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD13", _sid], 1, 50];
				};
			};
		};
		default {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_m3a37AD458", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD456", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD457", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD459", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_m3a37AD452", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD453", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD454", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD455", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37AD4510", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD4511", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4512", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4513", _sid], 1, 50];
				};
			};
		};
	};
	units_tracked = arm_to_add;	
};

if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	arm_to_add = [[format["%1csa38_m5a17AD3", _sid], 1, 50]];
	arm_to_add pushBack [format["%1csa38_m5a17AD2", _sid], 1, 50];
		
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1csa38_m5a17ADW", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1csa38_m5a17AD4", _sid], 1, 50]];
		arm_to_add pushBack [format["%1csa38_m5a17AD", _sid], 1, 50];
	};
	
	units_tracked append arm_to_add;
};

if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	arm_to_add = [[format["%1csa38_valentineMkIIgreen", _sid], 1, 50]];
	arm_to_add pushBack [format["%1csa38_valentineMkIIgreen2", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_valentineMkIIgreen3", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_valentineMkIIgreen4", _sid], 1, 50];
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1csa38_valentineMkIIW", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1csa38_valentineMkII2", _sid], 1, 50]];
		arm_to_add pushBack [format["%1csa38_valentineMkII", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_valentineMkII6", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_valentineMkII5", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_valentineMkII4", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_valentineMkII3", _sid], 1, 50];
	};
	
	units_tracked append arm_to_add;
};

if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	
	
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_2camo9W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo10W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo12W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo11W", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_2camo1W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo2W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo3W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo4W", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_2camo5W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo6W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo7W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo8W", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_4ENW", _sid], 1, 50];//mortar gun
		};
		case 2: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_2camo9", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo10", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo12", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_2camo1", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo2", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo4", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_2camo5", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo8", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_4EN", _sid], 1, 50];//mortar gun
		};
		default {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_245camo9", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo10", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo12", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_245camo1", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo2", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo4", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_245camo5", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo8", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_5EN45", _sid], 1, 50];//mortar gun
		};
	};	
	
	units_tracked append arm_to_add;
};

if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	arm_to_add = [[format["%1csa38_matildaii_1", _sid], 1, 50]];
	arm_to_add pushBack [format["%1csa38_matildaiiCS_1", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_matildaii_4", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_matildaiiCS_4", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_matildaii_5", _sid], 1, 50];
	arm_to_add pushBack [format["%1csa38_matildaiiCS_5", _sid], 1, 50];
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1csa38_matildaii_3", _sid], 1, 50]];
		arm_to_add pushBack [format["%1csa38_matildaiiCS_3", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1csa38_matildaii", _sid], 1, 50]];
		arm_to_add pushBack [format["%1csa38_matildaiiCS", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_matildaii_2", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_matildaiiCS_2", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_matildaii_6", _sid], 1, 50];
		arm_to_add pushBack [format["%1csa38_matildaiiCS_6", _sid], 1, 50];
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
/*units_air = [];
_level = 0;

if(CTI_ECONOMY_LEVEL_AIR < 0) then {
	units_air = +units_infantry;
};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1", _sid], 1, 60]];
	units_air pushBack [format["%1", _sid], 1, 60];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_UK_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";