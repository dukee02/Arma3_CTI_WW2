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
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_GazM1_SOV", _sid])) then {
	
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
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
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33_OT", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M31", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M33_OT", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M31", _sid];	
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
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33com", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M33com", _sid];	
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
			_c pushBack format["%1NORTH_SOV_W_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28_com", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28e", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_com", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28e", _sid];	
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
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_Zis6_parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];						//repairtruck
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
	_s pushBack [format["%1LIB_Zis5v", _sid],"salvager"];
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_Zis5v", _sid],"salvager-independent"];
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_Zis5v_fuel_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];						//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 0;	
		
		_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
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