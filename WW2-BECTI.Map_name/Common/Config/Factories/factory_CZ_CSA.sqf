private ["_side", "_c", "_sid", "_priorUnits", "_ai"];
_side = _this;
_ai = -1;

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
//if (isNil "_priorUnits" || _ai == 5) then {
if (CTI_CSA_ADDON > 1 || _ai == 9) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CSA38_CZoff5", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CSA38_CZcrew", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CSA38_CZcrew2", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CSA38_soldier1_2", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CSA38_CZcrew3", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CSA38_CZcrew4", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CSA38_soldier5_3", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1CSA38_pragaRV4", _sid], []], 
		[format["%1CSA38_pragaRV4", _sid], []]
	]];
	
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	_c pushBack format["%1CSA38_CZcrew", _sid];
	_c pushBack format["%1CSA38_CZcrew2", _sid];
	_c pushBack format["%1CSA38_CZcrew3", _sid];
	_c pushBack format["%1CSA38_CZcrew4", _sid];
	_c pushBack format["%1CSA38_CZcrew5", _sid];//green camo
	
	_c pushBack format["%1CSA38_soldier1_13", _sid];//Prisoner
	_c pushBack format["%1CSA38_soldier1_14", _sid];
	_c pushBack format["%1CSA38_soldier1_15", _sid];
	_c pushBack format["%1CSA38_soldier5_6", _sid];//artyman
	_c pushBack format["%1CSA38_soldier5_1", _sid];//grenadier
	_c pushBack format["%1CSA38_soldier5_1b", _sid];//grenadier
	_c pushBack format["%1CSA38_soldier1", _sid];//guard
	_c pushBack format["%1CSA38_soldier3", _sid];//medic
	_c pushBack format["%1CSA38_soldier1_16", _sid];//messager radioman
	_c pushBack format["%1CSA38_soldier1_4", _sid];//Soldier
	_c pushBack format["%1CSA38_soldier1_11", _sid];
	_c pushBack format["%1CSA38_soldier1_2", _sid];
	_c pushBack format["%1CSA38_soldier1_1", _sid];
	_c pushBack format["%1CSA38_soldier1_12", _sid];
	_c pushBack format["%1CSA38_soldier1_3", _sid];
	_c pushBack format["%1CSA38_soldier5_3", _sid];//mortarteam
	_c pushBack format["%1CSA38_soldier5_4", _sid];
	_c pushBack format["%1CSA38_soldier5_5", _sid];
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	_c pushBack format["%1CSA38_soldier2_1", _sid];//MG team
	_c pushBack format["%1CSA38_soldier2_1B", _sid];
	_c pushBack format["%1CSA38_soldier2_1C", _sid];
	_c pushBack format["%1CSA38_soldier2_1tk", _sid];
	
	_c pushBack format["%1CSA38_soldier2_2", _sid];
	_c pushBack format["%1CSA38_soldier2_2tk", _sid];//HMG team
	_c pushBack format["%1CSA38_soldier2_3tk", _sid];
	_c pushBack format["%1CSA38_soldier2_4tk", _sid];
	
	_c pushBack format["%1CSA38_soldier2", _sid];//MG
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	_c pushBack format["%1CSA38_soldier8_1", _sid];//SL
	_c pushBack format["%1CSA38_soldier8_2", _sid];
	_c pushBack format["%1CSA38_CZoff6", _sid];
	_c pushBack format["%1CSA38_CZoff2", _sid];
	_c pushBack format["%1CSA38_CZoff8", _sid];//TL
	_c pushBack format["%1CSA38_CZoff1", _sid];
	_c pushBack format["%1CSA38_CZoff7", _sid];
	_c pushBack format["%1CSA38_CZoff9", _sid];
	_c pushBack format["%1CSA38_CZoff4", _sid];
	_c pushBack format["%1CSA38_CZoff10", _sid];
	_c pushBack format["%1CSA38_CZoff5", _sid];//general
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
//Level start
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1CSA38_kolo", _sid];//bike
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1CSA38_pragaRV2", _sid];
	_c pushBack format["%1CSA38_pragaRV4", _sid];
	//_c pushBack format["%1CSA38_pragaRV", _sid]; //salvager
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_c pushBack format["%1CSA38_TCvz33", _sid];	
	_c pushBack format["%1CSA38_ltvz34", _sid];	
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	_c pushBack format["%1CSA38_ltvz35", _sid];	
	_c pushBack format["%1CSA38_pzkpfwIAvcz", _sid];	
	_c pushBack format["%1CSA38_pzkpfwIvcz", _sid];	
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	_c pushBack format["%1CSA38_ltvz38", _sid];	
	_c pushBack format["%1CSA38_pzIIvcz", _sid];	
	_c pushBack format["%1csa38_m5a1", _sid];	
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1csa38_t34cz5", _sid];	//winter
	};
	_c pushBack format["%1CSA38_pzIIIBvcz", _sid];	
	_c pushBack format["%1CSA38_pzIIICvcz", _sid];	
	_c pushBack format["%1CSA38_pzIIIDvcz", _sid];	
	//_c pushBack format["%1csa38_t34cz2", _sid];	//named
	//_c pushBack format["%1csa38_t34cz3", _sid];	
	//_c pushBack format["%1csa38_t34cz4", _sid];	
	//_c pushBack format["%1csa38_t34cz6", _sid];	//camo
	_c pushBack format["%1csa38_t34cz1", _sid];	//green
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	_c pushBack format["%1CSA38_pzIVvcz", _sid];	
	_c pushBack format["%1CSA38_pzIVBvcz", _sid];	
	_c pushBack format["%1csa38_cromwell_1", _sid];	
	_c pushBack format["%1csa38_cromwell_5", _sid];	
	_c pushBack format["%1csa38_cromwell_4", _sid];	
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_level = 0;
//Level 0 / 3
if(CTI_IFA3_NEW >= 0 || CTI_SAB_ADDON > 0) then {_tech_level = 3} else {_tech_level = 0};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

*/
//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1CSA38_pragaRV7", _sid];						//repairtruck
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	_c pushBack format["%1CSA38_pragaRV5", _sid];						//ammotruck
	//_c pushBack format["%1", _sid];							//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["%1CSA38_soldier1_11", _sid];
		_c pushBack format["%1CSA38_soldier3", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1CSA38_kolo", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//_c pushBack format["%1", _sid];						//ammotruck
		_c pushBack format["%1CSA38_pragaRV7", _sid];						//repairtruck
		_c pushBack format["%1CSA38_pragaRV5", _sid];							//ammotruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CZ_CSA.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/
