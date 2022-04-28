private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_tech_level_no_upgrade_inv", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV_NF.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
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
_tech_level = 0;
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_SdKfz_7", _sid])) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;	
	};
};


if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
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
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33com", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M33com", _sid];	
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28_com", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_com", _sid];	
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 0;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_41_T28e", _sid];	
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T28e", _sid];	
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1LIB_Li2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
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
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_Zis6_parm_w", _sid])) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1LIB_Zis6_parm_w", _sid];						//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 0;
	};
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1LIB_Zis5v", _sid],"salvager"];
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
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
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 0;	
		
		_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
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
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV_NF.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV_NF.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
