private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
//if (isNil "_priorUnits" || _ai == 1) then { 
//if ((CTI_IFA3_NEW > 0 && CTI_CSA_ADDON < 2 && CTI_FOW_ADDON < 2) || _ai == 1) then {
if (CTI_NF_ADDON > 1 || _ai == 10) then { 
	//Setup the default units depending on the selected camo
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1O_NORTH_SOV_W_41_Officer_Lt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1O_NORTH_SOV_W_41_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1O_NORTH_SOV_T_W_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1O_NORTH_SOV_W_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1O_NORTH_SOV_T_W_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_SOV_W_41_T26_M31", _sid], []], 
				[format["%1NORTH_SOV_W_41_T26_M31", _sid], []]
			]];
		};
		case 2: {//Summer camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1O_NORTH_SOV_41_Officer_Lt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1O_NORTH_SOV_41_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1O_NORTH_SOV_T_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1O_NORTH_SOV_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1O_NORTH_SOV_T_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1O_NORTH_SOV_41_AIR_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1O_NORTH_SOV_ART_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_SOV_41_T26_M31", _sid], []], 
				[format["%1NORTH_SOV_41_T26_M31", _sid], []]
			]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1O_NORTH_SOV_W_39_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1O_NORTH_SOV_W_39_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1O_NORTH_SOV_T_W_39_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1O_NORTH_SOV_T_W_39_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_SOV_41_T26_M31", _sid], []], 
				[format["%1NORTH_SOV_41_T26_M31", _sid], []]
			]];
		};
	};
	
	/*if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_GazM1_SOV", _sid])) then {
		//Set non armed starting vehicle id IFA is loaded
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_GazM1_SOV", _sid], []], 
			[format["%1LIB_GazM1_SOV", _sid], []]
		]];
	};*/
	
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Medic", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_W_41_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_SSGT", _sid];
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Medic", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_41_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_SSGT", _sid];
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Medic", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_W_39_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman_SGT", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Autorifleman_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_AIR_SOV_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_AIR_SOV_41_W_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_41_Officer_1stLt", _sid];
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Autorifleman_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_1stLt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_1stLt", _sid];
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Submachinegunner_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_1stLt", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid];
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_Cpt", _sid];
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_Cpt", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
//_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
//_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

//_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
//if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_SdKfz_7", _sid])) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					
	};
	_c pushBack format["%1LIB_SdKfz_7", _sid];
};

if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_SOV_W_39_BA10", _sid];
			};
			default {
				_c pushBack format["%1NORTH_SOV_41_BA10", _sid];
			};
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_39_T20", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T38", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33_OT", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26_M31", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT5", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT5Com", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T20", _sid];
			_c pushBack format["%1NORTH_SOV_41_T38", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26_M33_OT", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M31", _sid];	
			_c pushBack format["%1NORTH_SOV_41_BT5", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT5Com", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33com", _sid];	
			_c pushBack format["%1NORTH_SOV_W_39_BT7_M35", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7A", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7Com_M35", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M33com", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7_M35", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7A", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7Com_M35", _sid];	
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T26_M39", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T26_M39_OT", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28_com", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T28_M34", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T28_M34_com", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M39", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26_M39_OT", _sid];
			_c pushBack format["%1NORTH_SOV_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_com", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_M34", _sid];
			_c pushBack format["%1NORTH_SOV_41_T28_M34_com", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active	
			_c pushBack format["%1NORTH_SOV_W_41_T28e", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T34_76_1941", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T28e", _sid];
			_c pushBack format["%1NORTH_SOV_41_T34_76_1941", _sid];	
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_Li2", _sid];
	_level = _level + 1;
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];						//repairtruck
	};
	_c pushBack format["CTI_Salvager_%1", _side];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];						//fueltruck
		_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				//----------SOV Army 1941 winter------------
				_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_41_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_41_Engineer", _sid];
			};
			case 2: {//Summer camo active
				//----------SOV Army 1941------------
				_c pushBack format["%1O_NORTH_SOV_41_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_41_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_41_Engineer", _sid];
			};
			default {
				//----------SOV Army 1939 winter------------
				_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_39_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_39_Engineer", _sid];
			};
		};
	};
};
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
		};
		_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
	};
	//if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		//_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
	//};
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/