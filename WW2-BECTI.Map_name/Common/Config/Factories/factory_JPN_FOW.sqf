private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_tech_level"];
_side = _this;
_ai = -1;
_tech_level = 0;

if(_side == west) then {
	_sid = "VIOC_B_";
	_ai = CTI_WEST_AI;
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_ai = CTI_EAST_AI;
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
//if (isNil "_priorUnits" || _ai == 5) then {
if (CTI_FOW_ADDON > 1 || _ai == 5) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1fow_s_ija_f_officer", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1fow_s_ija_f_rifleman", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1fow_s_ija_crewman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1fow_s_ija_f_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1fow_s_ija_crewman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1fow_s_ija_pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1fow_s_ija_f_rifleman", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1fow_v_type97_truck_open_ija", _sid], []], 
		[format["%1fow_v_type97_truck_open_ija", _sid], []]
	]];
	
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1fow_s_ija_officer", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1fow_s_ija_rifleman", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1fow_s_ija_crewman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1fow_s_ija_rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1fow_s_ija_crewman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1fow_s_ija_pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1fow_s_ija_rifleman", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1fow_v_type97_truck_open_ija", _sid], []], 
			[format["%1fow_v_type97_truck_open_ija", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//yellow brown
		_c pushBack format["%1fow_s_ija_rifleman", _sid];
		_c pushBack format["%1fow_s_ija_rifleman_at", _sid];
		_c pushBack format["%1fow_s_ija_medic", _sid];
	};
	_c pushBack format["%1fow_s_ija_crewman", _sid];
	_c pushBack format["%1fow_s_ija_pilot", _sid];
	//green
	_c pushBack format["%1fow_s_ija_snlf_rifleman", _sid];
	_c pushBack format["%1fow_s_ija_snlf_rifleman_at", _sid];
	_c pushBack format["%1fow_s_ija_snlf_medic", _sid];
	//bush camo
	_c pushBack format["%1fow_s_ija_f_rifleman", _sid];
	_c pushBack format["%1fow_s_ija_f_rifleman_at", _sid];
	_c pushBack format["%1fow_s_ija_f_medic", _sid];
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_ija_type99_asst", _sid];
		_c pushBack format["%1fow_s_ija_type99_gunner", _sid];
		_c pushBack format["%1fow_s_ija_nco", _sid];
	};
	
	_c pushBack format["%1fow_s_ija_snlf_type99_asst", _sid];
	_c pushBack format["%1fow_s_ija_snlf_type99_gunner", _sid];
	_c pushBack format["%1fow_s_ija_snlf_nco", _sid];
	
	_c pushBack format["%1fow_s_ija_f_type99_asst", _sid];
	_c pushBack format["%1fow_s_ija_f_type99_gunner", _sid];
	_c pushBack format["%1fow_s_ija_f_nco", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_ija_officer", _sid];
	};
	
	_c pushBack format["%1fow_s_ija_f_officer", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
if(CTI_IFA3_NEW >= 0) then {_tech_level = 1;} else {_tech_level = 0;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1fow_v_type97_truck_open_ija", _sid];
	_c pushBack format["%1fow_v_type97_truck_ija", _sid];
	//_c pushBack format["%1fow_v_type97_truck_fuel_ija", _sid];				//fueltruck
	//_c pushBack format["%1fow_v_type97_truck_utility_ija", _sid];				//repairtruck
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_c pushBack format["%1fow_ija_type95_HaGo_1_ija", _sid];	
	_c pushBack format["%1fow_ija_type95_HaGo_2_ija", _sid];	
	_c pushBack format["%1fow_ija_type95_HaGo_3_ija", _sid];	
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_level = 0;
//Level 0 / 3
if(CTI_IFA3_NEW >= 0 || CTI_SAB_ADDON > 0) then {_tech_level = 3} else {_tech_level = 0};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1fow_va_a6m_green", _sid];
	_c pushBack format["%1fow_va_a6m_white", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1fow_v_type97_truck_utility_ija", _sid];						//repairtruck
	if(CTI_IFA3_NEW < 0) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//_c pushBack format["%1fow_v_type97_truck_ija", _sid];						//ammotruck
	_c pushBack format["%1fow_v_type97_truck_fuel_ija", _sid];							//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1fow_s_ija_rifleman", _sid];
			_c pushBack format["%1fow_s_ija_medic", _sid];
		};
		_c pushBack format["%1fow_s_ija_snlf_rifleman", _sid];
		_c pushBack format["%1fow_s_ija_snlf_medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1fow_v_type97_truck_open_ija", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//_c pushBack format["%1", _sid];						//ammotruck
		_c pushBack format["%1fow_v_type97_truck_utility_ija", _sid];						//repairtruck
		_c pushBack format["%1fow_v_type97_truck_fuel_ija", _sid];							//fueltruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];


//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_JPN_FOW.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/
