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

_i pushBack "LIB_US_Mk_2"; //Us
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

/*_i pushBack "lib_m392"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_m3975"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_m3910"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M39"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);*/

_i pushBack "LIB_F1"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_pomzec_MINE_mag"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_US_M1A1_ATMINE_mag"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_M3_MINE_mag";	//RU US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_US_M3_MINE_mag"; //US
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_PMD6_MINE_mag"; //RU
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Big_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_Ladung_Small_MINE_mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "ClaymoreDirectionalMine_Remote_Mag"; //All
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);

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
_i pushBack "LIB_15Rnd_762x33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_15Rnd_762x33_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_5Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_5Rnd_762x63_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_20Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_50Rnd_762x63";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_45ACP_t";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_50Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_30Rnd_M3_GreaseGun_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_7Rnd_45ACP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(1160*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_250rnd_7_62x54R_maxim_D";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,250,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_250rnd_7_62x54R_maxim";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,250,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_M2_Flamethrower_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_1Rnd_60mm_M6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 2
//_tech_level = _tech_level + 1;

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------Weapons------------------------------------------------------
_tech_level = 0;
_i pushBack "LIB_M1903A3_Springfield";
_i pushBack "LIB_Colt_M1911";
_i pushBack "LIB_FLARE_PISTOL";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "LIB_M1918A2_BAR";
_i pushBack "LIB_M1918A2_BAR_Bipod";
_i pushBack "LIB_M2_Flamethrower";
_i pushBack "LIB_M3_Greasegun";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_M1903A4_Springfield";
_i pushBack "LIB_M1_Carbine";
_i pushBack "LIB_M1A1_Carbine";
_i pushBack "LIB_M1_Garand";
_i pushBack "LIB_M1928_Thompson";
_i pushBack "LIB_M1928_Thompson_d";
_i pushBack "LIB_M1928A1_Thompson";
_i pushBack "LIB_M1A1_Thompson";
_i pushBack "LIB_M1919A4";
_i pushBack "LIB_M1919A6";
_i pushBack "LIB_M1A1_Bazooka";
_i pushBack "LIB_Maxim_M30";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------Uniforms------------------------------------
_tech_level = 0;

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "U_LIB_US_Corp";
	_i pushBack "U_LIB_US_Private";
	_i pushBack "U_LIB_US_Private_1st";
	_i pushBack "U_LIB_US_Sergant";
	_i pushBack "U_LIB_US_Eng";
	_i pushBack "U_LIB_US_Med";
	_i pushBack "U_LIB_US_Bomber_Pilot";
	_i pushBack "U_LIB_US_Pilot";
	_i pushBack "U_LIB_US_Bomber_Crew";
	_i pushBack "U_LIB_US_Pilot_2";
	_i pushBack "U_LIB_US_Tank_Crew";
	_i pushBack "U_LIB_US_Tank_Crew2";
	_i pushBack "U_LIB_US_AB_Uniform_M43";
	_i pushBack "U_LIB_US_AB_Uniform_M43_corporal";
	_i pushBack "U_LIB_US_AB_Uniform_M43_FC";
	_i pushBack "U_LIB_US_AB_Uniform_M43_Flag";
	_i pushBack "U_LIB_US_AB_Uniform_M43_Medic";
	_i pushBack "U_LIB_US_AB_Uniform_M43_NCO";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "U_LIB_US_Private_1st_w";
	_i pushBack "U_LIB_US_Private_w";
	_i pushBack "U_LIB_US_Off_w";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	_i pushBack "U_LIB_US_NAC_Uniform";
	_i pushBack "U_LIB_US_NAC_Med";
	_i pushBack "U_LIB_US_NAC_Uniform_2";
	_i pushBack "U_LIB_US_AB_Uniform_M42";
	_i pushBack "U_LIB_US_AB_Uniform_M42_506";
	_i pushBack "U_LIB_US_AB_Uniform_M42_corporal";
	_i pushBack "U_LIB_US_AB_Uniform_M42_FC";
	_i pushBack "U_LIB_US_AB_Uniform_M42_Gas";
	_i pushBack "U_LIB_US_AB_Uniform_M42_Medic";
	_i pushBack "U_LIB_US_AB_Uniform_M42_NCO";
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

//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;

_i pushBack "V_LIB_US_VEST_Asst_MG";
_i pushBack "V_LIB_US_VEST_Carbine";
_i pushBack "V_LIB_US_VEST_Carbine_Eng";
_i pushBack "V_LIB_US_VEST_Garand";
_i pushBack "V_LIB_US_VEST_Grenadier";
_i pushBack "V_LIB_US_VEST_Carbine_nco";
_i pushBack "V_LIB_US_VEST_Carbine_nco_Radio";
_i pushBack "V_LIB_US_VEST_45";
_i pushBack "V_LIB_US_VEST_Bar";
_i pushBack "V_LIB_US_VEST_M1919";
_i pushBack "V_LIB_US_VEST_Thompson_nco";
_i pushBack "V_LIB_US_VEST_Thompson_nco_Radio";
_i pushBack "V_LIB_US_VEST_Thompson";
_i pushBack "V_LIB_US_VEST_Medic";
_i pushBack "V_LIB_US_VEST_Medic2";
_i pushBack "V_LIB_US_Lifevest";
if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
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

_i pushBack "B_LIB_US_Bandoleer";
_i pushBack "B_LIB_US_Backpack_Bandoleer";
_i pushBack "B_LIB_US_Backpack_dday";
_i pushBack "B_LIB_US_Backpack_RocketBag_Empty";
_i pushBack "B_LIB_US_Backpack_Mk2";
_i pushBack "B_LIB_US_M2Flamethrower";
_i pushBack "B_LIB_US_M36";
_i pushBack "B_LIB_US_M36_Bandoleer";
_i pushBack "B_LIB_US_M36_RocketBag_Empty";
_i pushBack "B_LIB_US_M36_Rope";
_i pushBack "B_LIB_US_Rocketbag_Empty";
_i pushBack "B_LIB_US_Radio";
_i pushBack "B_LIB_US_Radio_ACRE2";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "B_LIB_US_Type5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_Parachute";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "B_LIB_US_TypeA3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;
if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_US_AB_Helmet_Clear_1";
	_i pushBack "H_LIB_US_AB_Helmet_Clear_2";
	_i pushBack "H_LIB_US_AB_Helmet_Clear_3";
	_i pushBack "H_LIB_US_AB_Helmet_Medic_1";
	_i pushBack "H_LIB_US_AB_Helmet_Plain_1";
	_i pushBack "H_LIB_US_AB_Helmet_Plain_2";
	_i pushBack "H_LIB_US_AB_Helmet_Plain_3";
	_i pushBack "H_LIB_US_Helmet";
	_i pushBack "H_LIB_US_Helmet_Net_ns";
	_i pushBack "H_LIB_US_Helmet_Net_os";
	_i pushBack "H_LIB_US_Helmet_Net";
	_i pushBack "H_LIB_US_Helmet_ns";
	_i pushBack "H_LIB_US_Helmet_os";
	_i pushBack "H_LIB_US_Helmet_Med";
	_i pushBack "H_LIB_US_Helmet_Med_ns";
	_i pushBack "H_LIB_US_Helmet_Med_os";
	_i pushBack "H_LIB_US_Rangers_Helmet";
	_i pushBack "H_LIB_US_Rangers_Helmet_ns";
	_i pushBack "H_LIB_US_Rangers_Helmet_os";
	_i pushBack "H_LIB_US_Helmet_Pilot";
	_i pushBack "H_LIB_US_Helmet_Pilot_Glasses_Down";
	_i pushBack "H_LIB_US_Helmet_Pilot_Glasses_Up";
	_i pushBack "H_LIB_US_Helmet_Pilot_Respirator_Glasses_Down";
	_i pushBack "H_LIB_US_Helmet_Pilot_Respirator_Glasses_Up";
	_i pushBack "H_LIB_US_Helmet_Pilot_Respirator";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "H_LIB_US_Helmet_Cover_w";
	_i pushBack "H_LIB_US_Helmet_w";
	_i pushBack "H_LIB_US_Helmet_Net_w";
	_i pushBack "H_LIB_US_Helmet_Cap_w";
	_i pushBack "H_LIB_US_Helmet_Med_w";
};
_i pushBack "H_LIB_US_Pilot_Cap";
_i pushBack "H_LIB_US_Pilot_Cap_Khaki";
_i pushBack "H_LIB_US_Helmet_Tank";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_US_AB_Helmet_CO_1";
	_i pushBack "H_LIB_US_AB_Helmet_CO_2";
	_i pushBack "H_LIB_US_AB_Helmet";
	_i pushBack "H_LIB_US_AB_Helmet_2";
	_i pushBack "H_LIB_US_AB_Helmet_Jump_1";
	_i pushBack "H_LIB_US_AB_Helmet_Jump_2";
	_i pushBack "H_LIB_US_AB_Helmet_NCO_2";
	_i pushBack "H_LIB_US_AB_Helmet_3";
	_i pushBack "H_LIB_US_AB_Helmet_4";
	_i pushBack "H_LIB_US_AB_Helmet_5";
	_i pushBack "H_LIB_US_Helmet_CO";
	_i pushBack "H_LIB_US_Helmet_NCO";
	_i pushBack "H_LIB_US_Rangers_Helmet_NCO";
	_i pushBack "H_LIB_US_Helmet_first_lieutenant";
	_i pushBack "H_LIB_US_Helmet_second_lieutenant";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "H_LIB_US_Helmet_First_lieutenant_w";
	_i pushBack "H_LIB_US_Helmet_Second_lieutenant_w";
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_US_AB_Helmet_NCO_1";
	_i pushBack "H_LIB_US_Helmet_First_lieutenant";
	_i pushBack "H_LIB_US_Helmet_Second_lieutenant";
	_i pushBack "H_LIB_US_Helmet_Cap";
	_i pushBack "H_LIB_US_Rangers_Helmet_First_lieutenant";
	_i pushBack "H_LIB_US_Rangers_Helmet_Second_lieutenant";
	_i pushBack "H_LIB_US_Rangers_Helmet_Cap";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
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
_tech_level = 1;
_i pushBack "LIB_M1918A2_BAR_Bipod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_US";
_i pushBack "ItemMap";
_i pushBack "ItemRadio";
_i pushBack "ItemCompass";
_i pushBack "ItemWatch";
// set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "MineDetector";
_i pushBack "FirstAidKit";
// set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "Medikit";
_i pushBack "ToolKit";
// set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_US.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
