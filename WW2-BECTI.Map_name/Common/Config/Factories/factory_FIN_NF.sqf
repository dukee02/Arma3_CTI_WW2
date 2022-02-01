private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_stream"];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
//if (isNil "_priorUnits" || _ai == 1) then { 
//if ((CTI_IFA3_NEW > 0 && CTI_CSA_ADDON < 2 && CTI_FOW_ADDON < 2) || _ai == 1) then {
if (CTI_NF_ADDON > 1 || _ai == 11) then {
	//Setup the default units depending on the selected camo
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1I_NORTH_FIN_W_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1I_NORTH_FIN_W_41_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1I_NORTH_FIN_W_41_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1I_NORTH_FIN_W_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1I_NORTH_FIN_T_W_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1I_NORTH_FIN_W_41_AIR_Pilot_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1I_NORTH_FIN_ART_W_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_W_41_T26_M31", _sid], []], 
				[format["%1NORTH_FIN_W_41_T26_M31", _sid], []]
			]];
		};
		case 2: {//Summer camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1I_NORTH_FIN_S_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1I_NORTH_FIN_S_41_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1I_NORTH_FIN_S_41_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1I_NORTH_FIN_S_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1I_NORTH_FIN_T_S_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1I_NORTH_FIN_S_41_AIR_Pilot_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1I_NORTH_FIN_ART_S_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_S_41_T26_M31", _sid], []], 
				[format["%1NORTH_FIN_S_41_T26_M31", _sid], []]
			]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1I_NORTH_FIN_W_39_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1I_NORTH_FIN_W_39_Unequipped", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1I_NORTH_FIN_W_39_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1I_NORTH_FIN_W_39_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1I_NORTH_FIN_T_W_39_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1I_NORTH_FIN_AIR_W_39_Pilot_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1I_NORTH_FIN_ART_W_39_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_W_39_T26_M31", _sid], []], 
				[format["%1NORTH_FIN_W_39_T26_M31", _sid], []]
			]];
		};
	};
	
	/*if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_Kfz1_Hood", _sid])) then {
		//Set non armed starting vehicle id IFA is loaded
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_Kfz1_Hood", _sid], []], 
			[format["%1LIB_Kfz1_Hood", _sid], []]
		]];
	};*/
	
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Civil_Guardsman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39_Asst", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim_Assistant_Ammo", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SSGT", _sid];
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_S_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39_Asst", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim_Assistant_Ammo", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SSGT", _sid];
		};
		default {
			//----------FIN Army Winter 1939------------
			_c pushBack format["%1I_NORTH_FIN_W_39_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Civil_Guardsman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman_AT", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Maxim", _sid];
			//_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Maxim_Assistant_Ammo", _sid];		//-> Warning Message: Bad vehicle type fin_gasmaskbag
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_2NDLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_39_Crewman_SSGT", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Autorifleman_38", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_2NDLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_2ndLt", _sid];
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_2NDLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_2ndLt", _sid];
		};
		default {
			//----------FIN Army Winter 1939------------
			_c pushBack format["%1I_NORTH_FIN_W_39_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner_SIG", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Officer_2ndLt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_AIR_W_39_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_AIR_W_39_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_AIR_W_39_Pilot_2ndLt", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_CPT", _sid];
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_Cpt", _sid];
		};
		default {
			//----------FIN Army Winter 1939------------
			_c pushBack format["%1I_NORTH_FIN_W_39_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Machinegunner_Assistant_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Machinegunner_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_39_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_W_39_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_AIR_W_39_Pilot_Cpt", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];
*/
//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;
//Streaming issue with nazi symbols, if its activated the fin default gets loaded
if(CTI_STREAM_BLOCK > 0) then {_stream = 0;} else {_stream = CTI_CAMO_ACTIVATION;};

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(_stream) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T26_M31", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T26_M31", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _sid];
		};
		default {
			_c pushBack format["%1NORTH_FIN_W_39_T26_M31", _sid];
			_c pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(_stream) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T26E", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T26E", _sid];
		};
		default {
			_c pushBack format["%1NORTH_FIN_W_39_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_Vickers6t", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(_stream) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T28", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T28", _sid];
		};
		default {
			_c pushBack format["%1NORTH_FIN_W_39_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_W_39_T28", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(_stream) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T28e", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T28e", _sid];
		};
		default {
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];							//repairtruck
	};
	if(CTI_IFA3_NEW >= 0) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Ammo_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];						//fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
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
				//----------FIN Army Winter 1941------------
				_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_W_41_Medic", _sid];
			};
			case 2: {//Summer camo active
				//----------FIN Army Summer 1941------------
				_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_S_41_Medic", _sid];
			};
			default {
				//----------FIN Army Winter 1939------------
				_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_W_39_Medic", _sid];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/