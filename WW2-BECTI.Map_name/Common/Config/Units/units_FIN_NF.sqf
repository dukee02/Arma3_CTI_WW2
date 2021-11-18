_side = _this;
_faction = "";
_sid = "";
_building_time = 10;

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

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

private _tech_level_no_upgrade_inv = 1;
private _tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
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
			_c pushBack format["%1I_NORTH_FIN_W_39_Crewman_Maxim_Assistant_Ammo", _sid];
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
//Level 1
_tech_level = 1;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
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
//Level 2
_tech_level = 2;
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
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

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_Kfz1_Hood", _sid])) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	_c pushBack format["%1LIB_Kfz1_Hood", _sid];	
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
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
			_c pushBack format["%1NORTH_FIN_W_39_T26_M31", _sid];
			_c pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _sid];
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
_tech_level = 1;
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T26E", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T26E", _sid];
		};
		default {
			_c pushBack format["%1NORTH_FIN_W_39_T26_M33", _sid];
			_c pushBack format["%1NORTH_FIN_W_39_T26_M38", _sid];
			_c pushBack format["%1NORTH_FIN_Vickers6t", _sid];
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
_tech_level = 2;
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_FIN_W_41_T28", _sid];
			_c pushBack format["%1NORTH_FIN_W_41_T28e", _sid];
		};
		case 2: {//Summer camo active
			_c pushBack format["%1NORTH_FIN_S_41_T28", _sid];
			_c pushBack format["%1NORTH_FIN_S_41_T28e", _sid];
		};
		default {
			_c pushBack format["%1NORTH_FIN_W_39_T28", _sid];
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

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
/*_tech_level = 0;
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";