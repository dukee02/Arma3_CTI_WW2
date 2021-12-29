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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_FOW.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_uk_seac_at_asst_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_bren_asst_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_medic_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_radio_operator_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_rifleman_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_at_asst", _sid];
		_c pushBack format["%1fow_s_uk_seac_bren_asst", _sid];
		_c pushBack format["%1fow_s_uk_seac_medic", _sid];
		_c pushBack format["%1fow_s_uk_seac_radio_operator", _sid];
		_c pushBack format["%1fow_s_uk_seac_rifleman", _sid];
	};
	
	_c pushBack format["%1fow_s_uk_crewman", _sid];
	_c pushBack format["%1fow_s_uk_at_asst", _sid];
	_c pushBack format["%1fow_s_uk_bren_asst", _sid];
	_c pushBack format["%1fow_s_uk_medic", _sid];
	_c pushBack format["%1fow_s_uk_radio_operator", _sid];
	_c pushBack format["%1fow_s_uk_rifleman", _sid];
	_c pushBack format["%1fow_s_uk_para_at_asst", _sid];
	_c pushBack format["%1fow_s_uk_para_bren_asst", _sid];
	_c pushBack format["%1fow_s_uk_para_medic", _sid];
	_c pushBack format["%1fow_s_uk_para_radio_operator", _sid];
	_c pushBack format["%1fow_s_uk_para_rifleman", _sid];
	
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
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_uk_seac_at_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_bren_gunner_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_officer_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_at", _sid];
		_c pushBack format["%1fow_s_uk_seac_bren_gunner", _sid];
		_c pushBack format["%1fow_s_uk_seac_officer", _sid];
	};
	
	_c pushBack format["%1fow_s_uk_at", _sid];
	_c pushBack format["%1fow_s_uk_bren_gunner", _sid];
	_c pushBack format["%1fow_s_uk_officer", _sid];
	_c pushBack format["%1fow_s_uk_para_at", _sid];
	_c pushBack format["%1fow_s_uk_para_bren_gunner", _sid];
	_c pushBack format["%1fow_s_uk_para_officer", _sid];
	
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
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_uk_seac_section_commander_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_teamleader_l", _sid];
		_c pushBack format["%1fow_s_uk_seac_section_commander", _sid];
		_c pushBack format["%1fow_s_uk_seac_teamleader", _sid];
	};
	
	_c pushBack format["%1fow_s_uk_section_commander", _sid];
	_c pushBack format["%1fow_s_uk_teamleader", _sid];
	_c pushBack format["%1fow_s_uk_para_section_commander", _sid];
	_c pushBack format["%1fow_s_uk_para_teamleader", _sid];
	
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
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>150): {150}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
		_t pushBack _building_time;
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 0;		
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
	_tech_level = _tech_level + 1;
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_tech_level = 0;
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	
	_c pushBack format["%1fow_v_universalCarrier", _sid];		
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
};
if(CTI_IFA3_NEW >= 0) then {_tech_level = 2} else {_tech_level = 1};
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	
	_c pushBack format["%1fow_v_cromwell_uk", _sid];		
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 0;
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
if(CTI_IFA3_NEW >= 0 || CTI_SAB_ADDON > 0) then {_tech_level = 3} else {_tech_level = 0};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
	
	_c pushBack format["%1fow_va_f6f_faa", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
	
	_c pushBack format["%1fow_va_f6f_c_faa", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
	_t pushBack _building_time;
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 0;
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_tech_level = 0;
if(CTI_IFA3_NEW < 0) then {
	/*if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1fow_v_universalCarrier", _sid];						//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Vehicle';
		_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 0;
	};*/
	if(CTI_US_SIDE != CTI_UK_SIDE) then {
		_c pushBack format["CTI_Salvager_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvage Vehicle';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1fow_v_universalCarrier", _sid],"salvager"];
		_d pushBack 0;
			
		_c pushBack format["CTI_Salvager_Independent_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvage Vehicle';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack (30*(_tech_level+1));
		_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1fow_v_universalCarrier", _sid],"salvager-independent"];
		_d pushBack 0;
	};
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*if(CTI_IFA3_NEW < 0 && CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1fow_v_universalCarrier", _sid];				//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Vehicle';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 0;	

	_c pushBack format["%1fow_v_universalCarrier", _sid];				//fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Vehicle';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 0;	

};*/


//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1LIB_UK_LCA", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (5*((CTI_ECONOMY_PRIZE_NAVAL*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1))));
	_t pushBack (30*(_tech_level+1));
	_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 50;
	
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_FOW.sqf", format["units declared: [%1] | [%2]", count _c, count _n]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_FOW.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
