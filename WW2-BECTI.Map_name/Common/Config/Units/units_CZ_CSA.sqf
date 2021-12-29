private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_tech_level_no_upgrade_inv", "_cntstart", "_cntend"];

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_CZ_CSA.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	
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
	_tech_level = _tech_level + 1;
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	
	_c pushBack format["%1CSA38_soldier2_1", _sid];//MG team
	_c pushBack format["%1CSA38_soldier2_1B", _sid];
	_c pushBack format["%1CSA38_soldier2_1C", _sid];
	_c pushBack format["%1CSA38_soldier2_1tk", _sid];
	
	_c pushBack format["%1CSA38_soldier2_2", _sid];
	_c pushBack format["%1CSA38_soldier2_2tk", _sid];//HMG team
	_c pushBack format["%1CSA38_soldier2_3tk", _sid];
	_c pushBack format["%1CSA38_soldier2_4tk", _sid];
	
	_c pushBack format["%1CSA38_soldier2", _sid];//MG
	
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
	_tech_level = _tech_level + 1;
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	
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
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	
	_c pushBack format["%1CSA38_kolo", _sid];//bike
	_p pushBack '';
	_n pushBack '';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	
	_tech_level = _tech_level + 1;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time};};
	
	_c pushBack format["%1CSA38_pragaRV2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1CSA38_pragaRV4", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
//Level 0
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1CSA38_TCvz33", _sid];	
	_c pushBack format["%1CSA38_ltvz34", _sid];	
	
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
	_tech_level = _tech_level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1CSA38_ltvz35", _sid];	
	_c pushBack format["%1CSA38_pzkpfwIAvcz", _sid];	
	_c pushBack format["%1CSA38_pzkpfwIvcz", _sid];	
	
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
	_tech_level = _tech_level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1CSA38_ltvz38", _sid];	
	_c pushBack format["%1CSA38_pzIIvcz", _sid];	
	_c pushBack format["%1csa38_m5a1", _sid];	
	
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
	_tech_level = _tech_level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
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
	_tech_level = _tech_level + 1;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	_c pushBack format["%1CSA38_pzIVvcz", _sid];	
	_c pushBack format["%1CSA38_pzIVBvcz", _sid];	
	_c pushBack format["%1csa38_cromwell_1", _sid];	
	_c pushBack format["%1csa38_cromwell_5", _sid];	
	_c pushBack format["%1csa38_cromwell_4", _sid];	
	
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 1
_tech_level = 0;
/*if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	
	_tech_level = _tech_level + 1;
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Reapir Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
	
_c pushBack format["%1CSA38_pragaRV7", _sid];						//repairtruck
_p pushBack '';
_n pushBack 'Repair Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack (30*(_tech_level+1));
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-repairtruck";
_d pushBack 0;

if(CTI_IFA3_NEW < 0 || CTI_CSA_ADDON > 1) then {		
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvage Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	if(CTI_IFA3_NEW < 0) then {
		_s pushBack [format["%1CSA38_pragaRV", _sid],"salvager"]; } else {
		_s pushBack [format["%1LIB_US6_Open_Cargo", _sid],"salvager"];};
	_d pushBack 0;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvage Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_REPAIR;
	if(CTI_IFA3_NEW < 0) then {
		_s pushBack [format["%1CSA38_pragaRV", _sid],"salvager-independent"];} else {
		_s pushBack [format["%1LIB_US6_Open_Cargo", _sid],"salvager-independent"];};
	_d pushBack 0;
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.

_c pushBack format["%1CSA38_pragaRV5", _sid];						//ammotruck
_p pushBack '';
_n pushBack 'Ammo Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack (30*(_tech_level+1));
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-ammotruck";
_d pushBack 0;	

/*_c pushBack format["%1fow_v_sdkfz_251_camo_foliage_ger_heer", _sid];				//fueltruck
_p pushBack '';
_n pushBack 'Fuel Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack (30*(_tech_level+1));
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-fueltruck";
_d pushBack 0;	*/

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_CZ_CSA.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_CZ_CSA.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
