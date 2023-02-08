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

_i pushBack "LIB_M39"; //RU
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
_i pushBack "LIB_5Rnd_762x54";
_i pushBack "LIB_5Rnd_762x54_t46";
_i pushBack "LIB_5Rnd_762x54_t30";
_i pushBack "LIB_5Rnd_762x54_D";
_i pushBack "LIB_5Rnd_762x54_b30";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "lib_47Rnd_762x54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,47,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_10Rnd_762x54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_7Rnd_762x38";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(762*38)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_8Rnd_9x19_P08";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "lib_8Rnd_762x25";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "LIB_35Rnd_762x25";
_i pushBack "LIB_35Rnd_762x25_t";
_i pushBack "LIB_35Rnd_762x25_t2";
_i pushBack "LIB_35Rnd_762x25_ap";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,35,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_i pushBack "LIB_71Rnd_762x25";
_i pushBack "LIB_71Rnd_762x25_t";
_i pushBack "LIB_71Rnd_762x25_t2";
_i pushBack "LIB_71Rnd_762x25_ap";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,71,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "LIB_1Rnd_145x114";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1,(145*114)] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_1Rnd_60mm_M6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Level 1
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
_i pushBack "LIB_M9130";
_i pushBack "LIB_M38";
_i pushBack "LIB_M1895";
_i pushBack "LIB_TT33";
_i pushBack "LIB_M1908";
_i pushBack "LIB_FLARE_PISTOL";
_i pushBack "LIB_PTRD";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "LIB_M44";
_i pushBack "LIB_PPSh41_d";
_i pushBack "LIB_PPSh41_m";
_i pushBack "LIB_M1A1_Bazooka";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 2
_tech_level = _tech_level + 1;

_i pushBack "lib_dp28";
_i pushBack "LIB_M9130PU";
_i pushBack "LIB_SVT_40";
_i pushBack "LIB_RPzB";
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
	_i pushBack "U_LIB_SOV_Strelokart";
	_i pushBack "U_LIB_SOV_Razvedchik_am";
	_i pushBack "U_LIB_SOV_Razvedchik_lis";
	_i pushBack "U_LIB_SOV_Razvedchik_mix";
	_i pushBack "U_LIB_SOV_Leutenant_inset_pocket";
	_i pushBack "U_LIB_SOV_Sergeant_inset_pocket";
	_i pushBack "U_LIB_SOV_Efreitor";
	_i pushBack "U_LIB_SOV_Strelok";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "U_LIB_SOV_Strelok_w";
	_i pushBack "U_LIB_SOV_Strelok_2_w";
	_i pushBack "U_LIB_SOV_Sniper_w";
};
_i pushBack "U_LIB_SOV_Tank_ryadovoi";
_i pushBack "U_LIB_SOV_Tank_private_field";
_i pushBack "U_LIB_SOV_Pilot";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "U_LIB_SOV_Tank_Sergeant";
_i pushBack "U_LIB_SOV_Stleutenant";
_i pushBack "U_LIB_SOV_Starshina";
_i pushBack "U_LIB_SOV_Stsergeant";
_i pushBack "U_LIB_SOV_Leutenant";
_i pushBack "U_LIB_SOV_Artleutenant";
_i pushBack "U_LIB_SOV_Tank_Leutenant";
_i pushBack "U_LIB_SOV_Razvedchik_autumn";
_i pushBack "U_LIB_SOV_Efreitor_summer";
_i pushBack "U_LIB_SOV_Strelok_summer";
_i pushBack "U_LIB_SOV_Sergeant";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Level 1
_tech_level = _tech_level + 1;
_i pushBack "U_LIB_SOV_Tank_Kapitan";
_i pushBack "U_LIB_SOV_Kapitan";
_i pushBack "U_LIB_SOV_Kapitan_summer";
_i pushBack "U_LIB_SOV_Sniper";
_i pushBack "U_LIB_SOV_Sniper_autumn";
_i pushBack "U_LIB_SOV_Sniper_spring";
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
_i pushBack "V_LIB_SOV_RA_OfficerVest";
_i pushBack "V_LIB_SOV_RAZV_OfficerVest";
_i pushBack "V_LIB_SOV_RA_MosinBelt";
_i pushBack "V_LIB_SOV_RA_TankOfficerSet";
_i pushBack "V_LIB_SOV_RA_MGBelt";
_i pushBack "V_LIB_SOV_RAZV_MGBelt";
_i pushBack "V_LIB_SOV_RA_PPShBelt";
_i pushBack "V_LIB_SOV_RA_SVTBelt";
_i pushBack "V_LIB_SOV_RAZV_PPShBelt";
_i pushBack "V_LIB_SOV_RAZV_SVTBelt";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_tech_level = 2;
_i pushBack "V_LIB_SOV_IShBrVestPPShDisc";
_i pushBack "V_LIB_SOV_IShBrVestPPShMAg";
_i pushBack "V_LIB_SOV_IShBrVestMG";
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

_i pushBack "B_LIB_SOV_RA_Rucksack";
_i pushBack "B_LIB_SOV_RA_Rucksack_green";
_i pushBack "B_LIB_SOV_RA_Rucksack2";
_i pushBack "B_LIB_SOV_RA_Rucksack2_green";
_i pushBack "B_LIB_SOV_RA_MGAmmoBag_Empty";
_i pushBack "B_LIB_SOV_RA_GasBag";
_i pushBack "B_LIB_SOV_RA_MedicalBag_Empty";
_i pushBack "B_LIB_SOV_Parachute";
_i pushBack "LIB_Maxim_Bag";
_i pushBack "LIB_Maxim_Bar";
_i pushBack "B_LIB_SOV_RA_Radio";
_i pushBack "B_LIB_SOV_RA_Shinel";
_i pushBack "B_LIB_SOV_RA_Paradrop";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;

if(CTI_CAMO_ACTIVATION == 0 || CTI_IFA3_NEW > 0) then {		//Basic camo
	_i pushBack "H_LIB_SOV_RA_Helmet";
	_i pushBack "H_LIB_SOV_RA_PrivateCap";
};
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	_i pushBack "H_LIB_SOV_RA_Helmet_w";
	_i pushBack "H_LIB_SOV_Ushanka";
	_i pushBack "H_LIB_SOV_Ushanka2";
};
_i pushBack "H_LIB_SOV_TankHelmet";
_i pushBack "H_LIB_SOV_RA_OfficerCap";
_i pushBack "H_LIB_SOV_PilotHelmet";

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
_i pushBack "LIB_ACC_M1891_Bayo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "LIB_ACC_GL_DYAKONOV_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);


//------------------------------------------Items-------------------------------------------------
/*_i pushBack "Binocular";
_u = _u		+ [0];
_p = _p		+ [5];*/

_i pushBack "LIB_Binocular_SU";
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
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_SOV.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
