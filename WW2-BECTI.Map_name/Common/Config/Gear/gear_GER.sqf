private ["_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level", "_upgrade_levels"];

_side = _this;
_upgrade_levels = [];
_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
};

_i = [];
_u = [];
_p = [];

//---------------------------Grenades and mines-----------------------------------------
_tech_level=0;
_i pushBack "LIB_Rpg6"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Rg42"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Pwm"; //Ind
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_NB39"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Shg24x7"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Shg24"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

//_i pushBack "lib_f1";
//_u pushBack _tech_level;
//_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Big_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Small_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "ClaymoreDirectionalMine_Remote_Mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_shumine_42_MINE_mag"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_SMI_35_MINE_mag"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_SMI_35_1_MINE_mag"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_STMI_MINE_mag"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_TM44_MINE_mag"; //Ger
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------Flares and Smokes------------------------------
_tech_level = 0;
_i pushBack "lib_1Rnd_flare_white";
_i pushBack "lib_1Rnd_flare_red";
_i pushBack "lib_1Rnd_flare_green";
_i pushBack "lib_1Rnd_flare_yellow";

//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "SmokeShell";
_i pushBack "SmokeShellRed";
_i pushBack "SmokeShellGreen";
_i pushBack "SmokeShellYellow";
_i pushBack "SmokeShellPurple";
_i pushBack "SmokeShellBlue";
_i pushBack "SmokeShellOrange";
_i pushBack "FlareWhite_F";
_i pushBack "FlareGreen_F";
_i pushBack "FlareRed_F";
_i pushBack "FlareYellow_F";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,2] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------Ammo----------------------------------------------
_tech_level = 0;
_i pushBack "LIB_5Rnd_792x57";
_i pushBack "LIB_5Rnd_792x57_t";
_i pushBack "LIB_5Rnd_792x57_sS";
_i pushBack "LIB_5Rnd_792x57_SMK";
_i pushBack "LIB_10Rnd_792x57_clip";
_i pushBack "LIB_10Rnd_792x57";
_i pushBack "LIB_10Rnd_792x57_T";
_i pushBack "LIB_10Rnd_792x57_T2";
_i pushBack "LIB_10Rnd_792x57_sS";
_i pushBack "LIB_10Rnd_792x57_SMK";
_i pushBack "LIB_50Rnd_792x57";
_i pushBack "LIB_50Rnd_792x57_SMK";
_i pushBack "LIB_50Rnd_792x57_sS";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_i pushBack "LIB_32rnd_9x19";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_32rnd_9x19_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_100Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_10Rnd_9x19_M1896";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_9x19_P08";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_7Rnd_9x19";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_20Rnd_792x57";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "LIB_8Rnd_81mmHE_GRWR34";
_i pushBack "ARTY_LIB_8Rnd_81mmHE_GRWR34";
_i pushBack "LIB_1rnd_81mmHE_GRWR34";
_i pushBack "LIB_81mm_GRWR34_SmokeShell";
_i pushBack "LIB_1rnd_81mmHE_GRWR34";
_i pushBack "LIB_81mm_GRWR34_SmokeShell";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "LIB_1Rnd_RPzB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_K98";
_i pushBack "LIB_K98_LATE";
_i pushBack "LIB_MP38";
_i pushBack "LIB_FAUSTPATRONE";
_i pushBack "LIB_PzFaust_30m";
_i pushBack "LIB_M1896";
_i pushBack "LIB_P08";
_i pushBack "LIB_P38";
_i pushBack "LIB_WaltherPPK";
_i pushBack "LIB_FLARE_PISTOL";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "LIB_G3340";
_i pushBack "LIB_G41";
_i pushBack "LIB_GRWR34";
_i pushBack "LIB_GrWr34_Barrel";
_i pushBack "LIB_GrWr34_Tripod";
_i pushBack "LIB_PzFaust_60m";
_i pushBack "LIB_MG34";
_i pushBack "LIB_MG34_PT";
_i pushBack "LIB_MP40";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;

_i pushBack "LIB_30Rnd_792x33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(792*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30rnd_792x33_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(792*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_K98ZF39";
_i pushBack "LIB_MG42";
_i pushBack "LIB_MP44";
_i pushBack "LIB_FG42G";
_i pushBack "LIB_G43";
_i pushBack "LIB_RPzB";
_i pushBack "LIB_RPzB_w";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------Uniforms------------------------------------
_tech_level = 0;

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "U_LIB_GER_Medic";
	_i pushBack "U_LIB_GER_MG_schutze";
	_i pushBack "U_LIB_GER_Pionier";
	_i pushBack "U_LIB_GER_Art_schutze";
	_i pushBack "U_LIB_GER_Oberschutze";
	_i pushBack "U_LIB_GER_Gefreiter";
	_i pushBack "U_LIB_GER_schutze";
	_i pushBack "U_LIB_GER_Soldier3";
	_i pushBack "U_LIB_GER_Soldier2";
	_i pushBack "U_LIB_GER_Recruit";
	_i pushBack "U_LIB_GER_Funker";
	_i pushBack "U_LIB_GER_LW_pilot";
	_i pushBack "U_LIB_FSJ_Soldier";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "U_LIB_GER_Soldier3_w";
	_i pushBack "U_LIB_GER_Soldier_camo_w";
	_i pushBack "U_LIB_GER_Scharfschutze_w";
	_i pushBack "U_LIB_GER_Scharfschutze_2_w";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "U_LIB_DAK_Sentry";
	_i pushBack "U_LIB_DAK_Sentry_2";
	_i pushBack "U_LIB_DAK_NCO";
	_i pushBack "U_LIB_DAK_NCO_2";
	_i pushBack "U_LIB_DAK_Soldier";
	_i pushBack "U_LIB_DAK_Soldier_2";
	_i pushBack "U_LIB_DAK_Soldier_3";
	_i pushBack "U_LIB_DAK_Medic";
	_i pushBack "U_LIB_FSJ_Soldier_dak";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "U_LIB_GER_Unterofficer";
_i pushBack "U_LIB_GER_Art_unterofficer";
_i pushBack "U_LIB_GER_Oberleutnant";
_i pushBack "U_LIB_GER_Leutnant";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;

if(CTI_CAMO_ACTIVATION != 1 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "U_LIB_GER_Scharfschutze";
	_i pushBack "U_LIB_GER_Soldier_camo";
	_i pushBack "U_LIB_GER_Soldier_camo2";
	_i pushBack "U_LIB_GER_Soldier_camo3";
	_i pushBack "U_LIB_GER_Soldier_camo4";
	_i pushBack "U_LIB_GER_Soldier_camo5";
	_i pushBack "U_LIB_FSJ_Soldier_camo";
	_i pushBack "U_LIB_GER_Officer_camo";
	_i pushBack "U_LIB_GER_Hauptmann";
	_i pushBack "U_LIB_GER_Oberst";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "U_LIB_GER_Hauptmann_w";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "U_LIB_FSJ_Soldier_dak_camo";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;
if(CTI_CAMO_ACTIVATION != 2 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "V_LIB_GER_VestKar98";
	_i pushBack "V_LIB_GER_VestMP40";
	_i pushBack "V_LIB_GER_PioneerVest";
	_i pushBack "V_LIB_GER_VestG43";
	_i pushBack "V_LIB_GER_VestSTG";
	_i pushBack "V_LIB_GER_VestUnterofficer";
	_i pushBack "V_LIB_GER_VestMG";
	_i pushBack "V_LIB_GER_OfficerVest";
	_i pushBack "V_LIB_GER_SniperBelt";
	_i pushBack "V_LIB_GER_FieldOfficer";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "V_LIB_DAK_OfficerVest";
	_i pushBack "V_LIB_DAK_VestG43";
	_i pushBack "V_LIB_DAK_VestKar98";
	_i pushBack "V_LIB_DAK_VestMG";
	_i pushBack "V_LIB_DAK_VestMP40";
	_i pushBack "V_LIB_DAK_VestSTG";
	_i pushBack "V_LIB_DAK_FieldOfficer";
	_i pushBack "V_LIB_DAK_SniperBelt";
	_i pushBack "V_LIB_DAK_VestUnterofficer";
	_i pushBack "V_LIB_DAK_OfficerBelt";
	_i pushBack "V_LIB_DAK_PioneerVest";
	_i pushBack "V_LIB_DAK_PrivateBelt";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Backpacks----------------------------------------------------------
_tech_level = 0;

//Desert
if(CTI_CAMO_ACTIVATION != 1 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "B_LIB_GER_MedicBackpack";
	_i pushBack "B_LIB_GER_Panzer";
	_i pushBack "B_LIB_GER_A_frame";
	_i pushBack "B_LIB_GER_A_frame_Gef";
	_i pushBack "B_LIB_GER_Radio";
	_i pushBack "B_LIB_GER_LW_Paradrop";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "B_LIB_DAK_A_frame";
	_i pushBack "B_LIB_DAK_A_frame_kit";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "B_LIB_GER_SapperBackpack";
_i pushBack "B_LIB_GER_SapperBackpack2";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;
_i pushBack "B_LIB_GER_A_frame_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_GER_Helmet";
	_i pushBack "H_LIB_GER_Helmet_ns";
	_i pushBack "H_LIB_GER_Cap";
	_i pushBack "H_LIB_GER_LW_PilotHelmet";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet_grey_os";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet_grey";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet_os";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "H_LIB_GER_FSJ_M44_Helmet_Winter";
	_i pushBack "H_LIB_GER_Fieldcap_w";
	_i pushBack "H_LIB_GER_Helmet_w";
	_i pushBack "H_LIB_GER_Helmet_Glasses_w";
	_i pushBack "H_LIB_GER_HelmetCamo2b_w";
	_i pushBack "H_LIB_GER_HelmetCamob_w";
	_i pushBack "H_LIB_GER_Helmet_net_w";
	_i pushBack "H_LIB_GER_Helmet_ns_w";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "H_LIB_DAK_Helmet";
	_i pushBack "H_LIB_DAK_Helmet_Glasses";
	_i pushBack "H_LIB_DAK_Helmet_net";
	_i pushBack "H_LIB_DAK_Helmet_ns";
	_i pushBack "H_LIB_DAK_Helmet_net_2";
	_i pushBack "H_LIB_DAK_Helmet_ns_2";
	_i pushBack "H_LIB_DAK_Helmet_2";
	_i pushBack "H_LIB_DAK_PithHelmet";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet_DAK";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;
if(CTI_CAMO_ACTIVATION != 2 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_GER_OfficerCap";
	_i pushBack "H_LIB_GER_FSJ_M44_Helmet";
	_i pushBack "H_LIB_GER_FSJ_M44_Helmet_Medic";
	_i pushBack "H_LIB_GER_FSJ_M44_Helmet_os";
	_i pushBack "H_LIB_GER_FSJ_M44_HelmetUtility";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "H_LIB_DAK_OfficerCap";
	_i pushBack "H_LIB_GER_FSJ_M44_HelmetCamo1";
	_i pushBack "H_LIB_GER_FSJ_M44_HelmetCamo2";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;
if(CTI_CAMO_ACTIVATION != 1 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_GER_HelmetCamo";
	_i pushBack "H_LIB_GER_HelmetCamo2";
	_i pushBack "H_LIB_GER_HelmetCamo4";
	_i pushBack "H_LIB_GER_FSJ_M38_Helmet_Cover";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "H_LIB_GER_HelmetCamo4_w";
	_i pushBack "H_LIB_GER_HelmetCamo2_w";
	_i pushBack "H_LIB_GER_HelmetCamo_w";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Glasses------------------------------------------------
_tech_level = 0;
_i pushBack "G_Combat";
_u pushBack _tech_level;
_p pushBack round 100;

_i pushBack "G_Shades_Black";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "G_Tactical_Clear";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "G_Sport_Blackred";
_u pushBack _tech_level;
_p pushBack round 50;

_i pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack 50;


//-----------------------------------------Attachments------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_ACC_K98_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_ACC_GW_SB_empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);


//------------------------------------------Items-------------------------------------------------
/*_i = _i		+ "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_GER";
_u pushBack 0;
_p pushBack round 100;

_i pushBack "ItemMap";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemradio";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "itemcompass";
_u pushBack 0;
_p pushBack round 20;

_i pushBack "itemwatch";
_u pushBack 0;
_p pushBack round 50;

_i pushBack "FirstAidKit";
_u pushBack 0;
_p pushBack round 200;

_i pushBack "Toolkit";
_u pushBack 0;
_p pushBack round 3000;

_i pushBack "Medikit";
_u pushBack 0;
_p pushBack round 1500;

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_GER.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
