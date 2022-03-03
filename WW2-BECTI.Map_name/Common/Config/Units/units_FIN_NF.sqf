private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_tech_level_no_upgrade_inv", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_stream"];

_side = _this;
_faction = "";
_sid = "";
_building_time = 10;
_tech_level_no_upgrade_inv = 1;

if(_side == west) then {
	_sid = "VIOC_B_";
	_faction = "West";
} else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_faction = "East";
	} else {
		_sid = "VIOC_I_";
		_faction = "Resistance";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [0,0,0,0,0,1,1,1,1,1,3,4,0]; 
};

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
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
			//----------FIN Army 1941------------
			_c pushBack format["%1I_NORTH_FIN_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_L39_Asst", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim", _sid];
			//_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim_Assistant_Ammo", _sid];		//-> Warning Message: Bad vehicle type fin_gasmaskbag
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_SgtMaj", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
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
			_c pushBack format["%1I_NORTH_FIN_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_2ndLt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_2NDLT", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
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
			//----------FIN Army 1941------------
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_Cpt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_INFANTRY*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};*/
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_SdKfz_7", _sid])) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					
	};
	_c pushBack format["%1LIB_SdKfz_7", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M31", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M33", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M33", _sid];
		_c pushBack format["%1NORTH_FIN_Vickers6t", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26E", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26E", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26E", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M38", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T28", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T28", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_41_T28", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T28", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T28e", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T28e", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T28e", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	if(_cntstart > _cntend) then {_tech_level = _tech_level + 1};
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ((CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_FIN_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1LIB_Li2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2;
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	
	_tech_level = _tech_level + 1;
};
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_tech_level = 0;
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];							//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 0;
	};
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid],"salvager"];
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid],"salvager-independent"];
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_OpelBlitz_Ammo_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];					//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 0;	

		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];					//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 0;	

	};
};

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
