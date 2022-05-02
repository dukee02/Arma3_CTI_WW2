//if true then show debug globalChat (TODO add more hints)
IL_DevMod = false;

//waitUntil { !(isNull player) };
waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

//if (isDedicated) exitwith {};
//if (isServer) exitwith {};

//	VARIABLES
_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);

if (isnil "IL_Variables") then
{
	IL_Variables = true;

	//Check new vehicles time
	IL_Check_Veh_Min = 30;
	IL_Check_Veh_Max = 60;
		
	//Dealing with cargo damage
	//-1 - do nothing
	//0 - set to 0
	//1 - keep such as before loading/unloading
	IL_CDamage = 0;

	//AddAction menu position
	IL_Action_LU_Priority = 30; //Load and (para)unload
	IL_Action_O_Priority = 0;	//Open and close
	IL_Action_S_Priority = 0; //Setup

	//Maximum capacity for vehicles
	IL_Num_Slots_OFFROAD = -2;
	IL_Num_Slots_VAN = -3;
	IL_Num_Slots_MOHAWK = -7;
	IL_num_Slots_CHINOOK = -8;
	IL_Num_Slots_TEMPEST = -5;
	IL_Num_Slots_HEMTT = -6;
	IL_Num_Slots_MH9 = -1;
	IL_Num_Slots_C130J = -12;
	IL_Num_Slots_C17 = -22;
	// Lyrae completed groups
	IL_Num_Slots_APC = -2;  // APC
	IL_Num_Slots_Dingo = -1;  // Dingo
	IL_Num_Slots_HMMWV = -1;  // HWWMV
	IL_Num_Slots_Ural = -3;  // Ural
	IL_Num_Slots_Zamak = -4;  // Zamak
	// VIOC added vehicles
	IL_Num_Slots_Gaz = -2; 
	IL_Num_Slots_Praga = -2; 
	IL_Num_Slots_Blitz = -3; 
	IL_Num_Slots_BlitzCSA = -3; 
	IL_Num_Slots_US6 = -4; 
	IL_Num_Slots_GMC = -4; 
	IL_Num_Slots_SdKfz7 = -4; 
	IL_Num_Slots_LCVP = -4; 
	IL_Num_Slots_LCM3 = -6;
	IL_Num_Slots_Liberty = -100;
	IL_Num_Slots_C47 = -12;

	//Player addScore after loading and unloading
	IL_Load_Score = 20;
	//Para unload score = 2 * IL_Unload_Score
	IL_Unload_Score = 10;

	//The minimum altitude for the drop with parachute
	IL_Para_Drop_ATL = 50;
	IL_Para_Jump_ATL = 30;
	//The minimum altitude for parachute opening
	IL_Para_Drop_Open_ATL = 150;
	IL_Para_Jump_Open_ATL = 150;
	//Parachute get velocity from player or cargo
	IL_Para_Drop_Velocity = true;
	IL_Para_Jump_Velocity = true;

	//Set smoke and light for parachute drop.
	IL_Para_Smoke = true;
	IL_Para_Light = true;
	//Additional smoke after landing
	IL_Para_Smoke_Add = true;
	//Additional light after landing
	IL_Para_Light_Add = true;
	//Smoke and light color
	IL_Para_Smoke_Default = "SmokeshellGreen";
	IL_Para_Light_Default = "Chemlight_green";
	IL_Para_Smoke_Veh = "SmokeshellBlue";
	IL_Para_Light_Veh = "Chemlight_blue";

	//This allows for loading or unloading, if a player is in the area of loading or copilot
	IL_Can_Inside = false;
	IL_Can_CoPilot = false;
	IL_Can_Outside = true;

	//
	//IL_SDistU = 20;//No longer needed
	IL_SDistL = 4;   // increasing this from 2.5 to 4 to extend the radius of gathering loot
	IL_SDistL_Heli_offset = 1;

	//Load and unload (not para) max speed in km/h
	IL_LU_Speed = 10;
	//Load and unload (not para) max height in m
	IL_LU_Alt = 3;
	//Enable or disable usable cargo ramp in CH-49
	IL_Ramp = false;

	//Enable change of vehicle mass
	IL_Mass = true;

	// Supported vehicles
	//#include "OriginalVehicles.cpp"
	
	IL_Supported_Vehicles_MOHAWK = 
		[
			"sab_bf110",
			"sab_bf110_2",
			"sab_ju88",
			"sab_ju88_2",
			"sab_he111",
			"sab_tusb2",
			"LIB_Pe2_2_w",
			"LIB_Pe2_w",
			"LIB_Pe2"
			/*"I_Heli_Transport_02_F",
			"Exile_Chopper_Mohawk_FIA",
			"O_T_VTOL_02_infantry_F",
			"O_T_VTOL_02_vehicle_F" */
		];

	IL_Supported_Vehicles_C130J = 
		[	
			"B_T_VTOL_01_infantry_F",
			"B_T_VTOL_01_vehicle_F"
		];

	IL_Supported_Vehicles_C17 = 
		[];
	
	//*****************************************************************************************************************
	//*										VIOC Units declaration
	//*****************************************************************************************************************		
	
	
	/*if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_fow_s_ger_heer_rifleman")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_CSA38_WH2Bi")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_I_NORTH_FIN_W_41_Unequipped")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	
	
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_fl_bf109e")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_nl_mutsuki")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_sab_bf110")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	if (isClass(configFile >> "CfgVehicles" >> "VIOC_O_SOV_BT_BT7A")) then {
		CTI_VIO_ADDON = 1;
	} else {
		CTI_VIO_ADDON = 0;
	};
	
	
	_sid = [];
	if(CTI_VIO_ADDON == 0) then {
		_sid = [""];
	} else {
		_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
	};*/
	_sid = ["", "VIOC_B_", "VIOC_O_", "VIOC_I_"];
	
	IL_Supported_Vehicles_Gaz = [];
	IL_Supported_Vehicles_Praga =  [];
	IL_Supported_Vehicles_Blitz =  [];
	IL_Supported_Vehicles_BlitzCSA =  [];
	IL_Supported_Vehicles_US6 =  [];
	IL_Supported_Vehicles_GMC =  [];
	IL_Supported_Vehicles_GMCFOW =  [];
	IL_Supported_Vehicles_SdKfz7 = [];
	IL_Supported_Vehicles_LCVP =  [];
	IL_Supported_Vehicles_LCM3 =  [];
	IL_Supported_Vehicles_C47 =  [];
	IL_Supported_Vehicles_Cargo_Ship =  [];
	
	{
		//IL_Supported_Vehicles_Praga pushBack format["%1", _x];
		
		IL_Supported_Vehicles_Gaz pushBack format["%1ifa3_gazaa_IZ", _x];
		IL_Supported_Vehicles_Gaz pushBack format["%1ifa3_gaz2", _x];
		
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV2", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV4", _x];
		IL_Supported_Vehicles_Praga pushBack format["%1CSA38_pragaRV6", _x];
		
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_DAK_OpelBlitz_Open", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_DAK_OpelBlitz_Tent", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _x];
		IL_Supported_Vehicles_Blitz pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _x];
		
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_LATE2", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_LATE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_DE", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz3_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz2_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1CSA38_opelblitz_W", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1fow_v_type97_truck_open_ija", _x];
		IL_Supported_Vehicles_BlitzCSA pushBack format["%1fow_v_type97_truck_ija", _x];
		
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Open", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Open_Cargo", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Tent_Cargo", _x];
		IL_Supported_Vehicles_US6 pushBack format["%1LIB_US6_Tent", _x];
				
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Tent", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Open", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Tent_w", _x];
		IL_Supported_Vehicles_GMC pushBack format["%1LIB_US_GMC_Open_w", _x];
		
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_usa", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_open_usa", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_usmc", _x];
		IL_Supported_Vehicles_GMCFOW pushBack format["%1fow_v_gmc_open_usmc", _x];
		
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_SdKfz_7", _x];
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_DAK_SdKfz_7", _x];
		IL_Supported_Vehicles_SdKfz7 pushBack format["%1LIB_SdKfz_7_w", _x];
		
		IL_Supported_Vehicles_LCVP pushBack format["%1LIB_LCVP", _x];
		
		IL_Supported_Vehicles_LCM3 pushBack format["%1LIB_LCM3_Armed", _x];
		
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_Skytrain", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_RAF_bob", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_C47_RAF_snafu", _x];
		IL_Supported_Vehicles_C47 pushBack format["%1LIB_Li2", _x];
		
		IL_Supported_Vehicles_Cargo_Ship pushBack format["%1sab_nl_liberty", _x];
		
	} forEach _sid;
	
	//IL_Supported_Vehicles_All = IL_Supported_Vehicles_APC + IL_Supported_Vehicles_Dingo + IL_Supported_Vehicles_HMMWV + IL_Supported_Vehicles_Ural + IL_Supported_Vehicles_Zamak + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD + IL_Supported_Vehicles_CHINOOK + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3;
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47 + IL_Supported_Vehicles_Gaz + IL_Supported_Vehicles_Praga + IL_Supported_Vehicles_Blitz + IL_Supported_Vehicles_BlitzCSA + IL_Supported_Vehicles_US6 + IL_Supported_Vehicles_GMC + IL_Supported_Vehicles_GMCFOW + IL_Supported_Vehicles_SdKfz7 + IL_Supported_Vehicles_LCVP + IL_Supported_Vehicles_LCM3 + IL_Supported_Vehicles_Cargo_Ship;

	// Vehicles with the ability to dropping the load on the parachute
	//IL_Para_Drop_Vehicles = IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C17 + IL_Supported_Vehicles_CHINOOK;
	IL_Para_Drop_Vehicles = IL_Supported_Vehicles_C130J + IL_Supported_Vehicles_C47;

	//Supported cargo
	//#include "OriginalCargo.cpp"
	IL_Supported_Box_H1 = 
		[
			"Box_East_Wps_F",  // basic weapons [CSAT]
			"Box_East_WpsLaunch_F",  // launchers [CSAT]
			"Box_East_WpsSpecial_F",  // special weapons [CSAT]

			"Box_IND_Wps_F",  // basic weapons [AAF]
			"Box_IND_WpsLaunch_F",  // launchers [AAF]
			"Box_IND_WpsSpecial_F",  // special weapons [AAF]

			"Box_NATO_Wps_F",  // basic weapons [NATO]
			"Box_NATO_WpsLaunch_F",  // launchers [NATO]
			"Box_NATO_WpsSpecial_F",  // special weapons [NATO]
			"Exile_Container_SupplyBox"  // supply box
		];

	IL_Supported_Box_H2 = 
		[
			"Box_East_Ammo_F",  // basic ammo [CSAT]
			"Box_East_AmmoOrd_F",  // explosives [CSAT] 
			"Box_East_Grenades_F",  // grenades [CSAT]
			"Box_East_Support_F",  // support [CSAT]

			"Box_IND_Ammo_F",  // basic ammo [AAF]
			"Box_IND_AmmoOrd_F",  // explosives [AAF]
			"Box_IND_Grenades_F",  // grenades [AAF]
			"Box_IND_Support_F",  // support [AAF]

			"Box_NATO_Ammo_F",  // basic ammo [NATO]
			"Box_NATO_AmmoOrd_F",  // explosives [NATO]
			"Box_NATO_Grenades_F",  // grenades [NATO]
			"Box_NATO_Support_F"  // support [NATO]
		];

	IL_Supported_HEMTT = 
		[
			"B_Truck_01_covered_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_box_F",
			"B_Truck_01_mover_F",
			"B_Truck_01_ammo_F",
			"B_Truck_01_fuel_F",
			"B_Truck_01_medical_F",
			"B_Truck_01_Repair_F",
			"Exile_Car_HEMMT"
		];

	// Zamak
	IL_Supported_Zamak = 
		[
			"C_IDAP_Truck_02_F",
			"C_IDAP_Truck_02_transport_F",
			"C_IDAP_Truck_02_water_F",
			"C_Truck_02_box_F",
			"C_Truck_02_covered_F",
			"C_Truck_02_fuel_F",
			"C_Truck_02_transport_F",
			"Exile_Car_Zamak",
			"I_Truck_02_ammo_F",
			"I_Truck_02_box_F",
			"I_Truck_02_covered_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_medical_F",
			"I_Truck_02_transport_F",
			"O_Truck_02_Ammo_F",
			"O_Truck_02_box_F",
			"O_Truck_02_covered_F",
			"O_Truck_02_fuel_F",
			"O_Truck_02_medical_F",
			"O_Truck_02_transport_F"
		];

	IL_Supported_TEMPEST = 
		[
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"Exile_Car_Tempest",
			"O_T_Truck_03_transport_ghex_F",
			"O_T_Truck_03_covered_ghex_F",
			"O_Truck_03_device_F",
			"O_T_Truck_03_device_ghex_F",
			"O_Truck_03_ammo_F",
			"O_T_Truck_03_ammo_ghex_F",
			"O_Truck_03_fuel_F",
			"O_T_Truck_03_fuel_ghex_F",
			"O_Truck_03_medical_F",
			"O_T_Truck_03_medical_ghex_F",
			"O_Truck_03_repair_F",
			"O_T_Truck_03_repair_ghex_F"
		];

	IL_Supported_Strider = 
		[
			"I_MRAP_03_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"Exile_Car_Strider",
			"O_LSV_02_unarmed_F",
			"O_T_LSV_02_unarmed_F",
			"O_LSV_02_armed_F",
			"O_T_LSV_02_armed_F",
			"B_CTRG_LSV_01_light_F",
			"B_LSV_01_unarmed_F",
			"B_T_LSV_01_unarmed_F",
			"B_LSV_01_armed_F",
			"B_T_LSV_01_armed_F"
		];

	IL_Supported_Hunter = 
		[
			"B_MRAP_01_F",
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			"Exile_Car_Hunter"
		];

	IL_Supported_Ifrit = 
		[
			"O_MRAP_02_F",
			"O_MRAP_02_gmg_F",
			"O_MRAP_02_hmg_F",
			"Exile_Car_Ifrit",
			"O_T_MRAP_02_ghex_F",
			"O_T_MRAP_02_gmg_ghex_F",
			"O_T_MRAP_02_hmg_ghex_F"
		];

	IL_Supported_UGV = 
		[
			"B_UGV_01_rcws_F",
			"B_UGV_01_F",
			"O_UGV_01_rcws_F",
			"O_UGV_01_F",
			"I_UGV_01_rcws_F",
			"I_UGV_01_F",
			"Exile_Car_TowTractor_White"
		];

	IL_Supported_VAN = 
		[
			"C_Van_01_box_F",
			"B_G_Van_01_transport_F",
			"C_Van_01_transport_F",
			"Exile_Car_Van_Black",
			"Exile_Car_Van_White",
			"Exile_Car_Van_Red",
			"Exile_Car_Van_Guerilla01",
			"Exile_Car_Van_Guerilla02",
			"Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",
			"Exile_Car_Van_Guerilla05",
			"Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",
			"Exile_Car_Van_Guerilla08",
			"I_C_Van_01_transport_F",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White",
			"Exile_Car_Van_Box_Red",
			"Exile_Car_Van_Box_Guerilla01",
			"Exile_Car_Van_Box_Guerilla02",
			"Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04",
			"Exile_Car_Van_Box_Guerilla05",
			"Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07",
			"Exile_Car_Van_Box_Guerilla08",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Van_Fuel_White",
			"Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01",
			"Exile_Car_Van_Fuel_Guerilla02",
			"Exile_Car_Van_Fuel_Guerilla03",
			"Exile_Car_Tractor_Red",
			"Exile_Car_OldTractor_Red"
		];

	IL_Supported_OFFROAD = 
		[
			"C_Offroad_01_F",
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_armed_F",
			"Exile_Car_Offroad_Red",
			"Exile_Car_Offroad_Beige",
			"Exile_Car_Offroad_White",
			"Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed",
			"Exile_Car_Offroad_BlueCustom",
			"Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02",
			"Exile_Car_Offroad_Guerilla03",
			"Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05",
			"Exile_Car_Offroad_Guerilla06",
			"Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08",
			"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11",
			"Exile_Car_Offroad_Guerilla12",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"B_GEN_Offroad_01_gen_F",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Offroad_Armed_Guerilla02",
			"Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04",
			"Exile_Car_Offroad_Armed_Guerilla05",
			"Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07",
			"Exile_Car_Offroad_Armed_Guerilla08",
			"Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10",
			"Exile_Car_Offroad_Armed_Guerilla11",
			"Exile_Car_Offroad_Armed_Guerilla12",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Repair_Red",
			"Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White",
			"Exile_Car_Offroad_Repair_Blue",
			"Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom",
			"Exile_Car_Offroad_Repair_Guerilla01",
			"Exile_Car_Offroad_Repair_Guerilla02",
			"Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04",
			"Exile_Car_Offroad_Repair_Guerilla05",
			"Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07",
			"Exile_Car_Offroad_Repair_Guerilla08",
			"Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10",
			"Exile_Car_Offroad_Repair_Guerilla11",
			"Exile_Car_Offroad_Repair_Guerilla12"
		];

	IL_Supported_SUV = 
		[
			"C_SUV_01_F",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUV_Black",
			"Exile_Car_SUV_Grey",
			"Exile_Car_SUV_Orange",
			"Exile_Car_SUV_Rusty1",
			"Exile_Car_SUV_Rusty2",
			"Exile_Car_SUV_Rusty3",
			"Exile_Car_SUVXL_Black"
		];

	IL_Supported_Hatchback = 
		[
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"Exile_Car_Octavius_White",
			"Exile_Car_Octavius_Black",
			"Exile_Car_Lada_Green",
			"Exile_Car_Lada_Taxi",
			"Exile_Car_Lada_Red",
			"Exile_Car_Lada_White",
			"Exile_Car_Lada_Hipster",
			"Exile_Car_Volha_Blue",
			"Exile_Car_Volha_White",
			"Exile_Car_Volha_Black"
		];

	IL_Supported_HMMWV = 
		[
			"CUP_B_HMMWV_Ambulance_ACR",  // HMMWV Ambulance
			"CUP_B_HMMWV_AGS_GPK_ACR",  // HMMWV M1114 AGS
			"CUP_B_HMMWV_DSHKM_GPK_ACR",  // HMMWV M1114 DSHKM
			"CUP_B_HMMWV_M2_GPK_ACR",  // HMMWV M1151 M2
			"CUP_B_HMMWV_UNARMED_NATO_T",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_NATO_T",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_NATO_T",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_NATO_T",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_NATO_T",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_NATO_T",  // HMMWV M2
			"CUP_B_HMMWV_MK19_NATO_T",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_NATO_T",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_NATO_T",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_NATO_T",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_NATO_T",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_NATO_T",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_NATO_T",  // M1151 (M2)
			"CUP_B_M1151_Deploy_NATO_T",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_NATO_T",  // M1151 (Mk19)
			"CUP_B_M1151_NATO_T",  // M1151 (Unarmed)
			"CUP_B_M1152_NATO_T",  // M1152 EVC
			"CUP_B_M1165_GMV_NATO_T",  // M1165 GMV (M134)
			"CUP_B_M1167_NATO_T",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USA",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USA",  // HMMWV Ambulance
			"CUP_B_HMMWV_Crows_M2_USA",  // HMMWV CROWS M2
			"CUP_B_HMMWV_Crows_MK19_USA",  // HMMWV CROWS MK19
			"CUP_B_HMMWV_M2_GPK_USA",  // HMMWV M115 M2
			"CUP_B_HMMWV_M2_USA",  // HMMWV M2
			"CUP_B_HMMWV_MK19_USA",  // HMMWV MK19
			"CUP_B_HMMWV_SOV_M2_USA",  // HMMWV SOV (M2)
			"CUP_B_HMMWV_SOV_USA",  // HMMWV SOV (Mk19)
			"CUP_B_HMMWV_TOW_USA",  // HMMWV TOW
			"CUP_B_HMMWV_Transport_USA",  // HMMWV Transport
			"CUP_B_HMMWV_Terminal_USA",  // HMMWV UAV Terminal
			"CUP_B_M1151_M2_USA",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USA",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USA",  // M1151 (Mk19)
			"CUP_B_M1151_USA",  // M1151 (Unarmed)
			"CUP_B_M1152_USA",  // M1152 EVC
			"CUP_B_M1165_GMV_USA",  // M1165 GMV (M134)
			"CUP_B_M1167_USA",  // M1167 (TOW-2)
			"CUP_B_HMMWV_UNARMED_USMC",  // HMMWV (Unarmed)
			"CUP_B_HMMWV_Ambulance_USMC",  // HMMWV Ambulance
			"CUP_B_HMMWV_M2_USMC",  // HMMWV M2
			"CUP_B_HMMWV_M1114_USMC",  // HMMWV M240
			"CUP_B_HMMWV_MK19_USMC",  // HMMWV MK19
			"CUP_B_HMMWV_TOW_USMC",  // HMMWV TOW
			"CUP_B_M1151_M2_USMC",  // M1151 (M2)
			"CUP_B_M1151_Deploy_USMC",  // M1151 (M2) Deployment
			"CUP_B_M1151_Mk19_USMC",  // M1151 (Mk19)
			"CUP_B_M1151_USMC",  // M1151 (Unarmed)
			"CUP_B_M1152_USMC",  // M1152 EVC
			"CUP_B_M1165_GMV_USMC",  // M1165 GMV (M134)
			"CUP_B_M1167_USMC",  // M1167 (TOW-2)
			"Exile_car_HMMWV_M134_Green",  // HMMWV (M134)
			"Exile_car_HMMWV_M134_Desert",  // HMMWV (M134)
			"Exile_car_HMMWV_M2_Desert",  // HMMWV (M2)
			"Exile_car_HMMWV_M2_Green",  // HMMWV (M2)
			"Exile_car_HMMWV_MEV_Desert",  // HMMWV (MEV)
			"Exile_car_HMMWV_MEV_Green",  // HMMWV (MEV)
			"Exile_car_HMMWV_UNA_Desert",  // HMMWV (Unarmed)
			"Exile_car_HMMWV_UNA_Green",  // HMMWV (Unarmed)
			"HMMWV_UNA",  // HMMWV (Unarmed)
			"HMMWV_UNA_des",  // HMMWV (Unarmed)
			"HMMWV_M2_GPK_Base",  // HMMWV M1151 M2 Forest
			"HMMWV_M2_GPK_1",  // HMMWV M1151 M2 Sand
			"HMMWV_M134_des",  // HMMWV-M134
			"HMMWV_M134",  // HMMWV-M134
			"HMMWV_M2_des",  // HMMWV-M2
			"HMMWV_M2",  // HMMWV-M2
			"HMMWV_MEV_des",  // HMMWV-MEV
			"HMMWV_MEV"  // HMMWV-MEV
		];

	IL_Supported_Quadbike = 
		[				
			"Exile_Bike_QuadBike_Black",
			"Exile_Bike_QuadBike_Blue",
			"Exile_Bike_QuadBike_Red",
			"Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato",
			"Exile_Bike_QuadBike_Csat",
			"Exile_Bike_QuadBike_Fia",
			"Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02",
			"B_G_Quadbike_01_F",
			"O_T_Quadbike_01_ghex_F",
			"Exile_Car_Kart_BluKing",
			"Exile_Car_Kart_RedStone",
			"Exile_Car_Kart_Vrana",
			"Exile_Car_Kart_Green",
			"Exile_Car_Kart_Blue",
			"Exile_Car_Kart_Orange",
			"Exile_Car_Kart_White",
			"Exile_Car_Kart_Yellow",
			"Exile_Car_Kart_Black",
			"C_Kart_01_Fuel_F",
			"I_Quadbike_01_F",
			"C_Quadbike_01_F",
			"O_Quadbike_01_F",
			"B_Quadbike_01_F"
		];

	IL_Supported_Supply_Crate = 
		[
			"B_CargoNet_01_ammo_F",  // cargo net [NATO]
			"B_CargoNET_01_F",  // ???
			"B_supplyCrate_F",  // supply box [NATO]
			"C_supplyCrate_F",  // supply box [CTRG]
			"CargoNet_01_box_F",  // cargo net (box)
			"I_CargoNet_01_ammo_F",  // cargo net [AAF]
			"I_CargoNET_01_F",  // ???
			"I_supplyCrate_F",  // supply box [AAF]
			"IG_supplyCrate_F",  // supply box [FIA]
			"O_CargoNet_01_ammo_F",  // cargo net [CSAT]
			"O_CargoNET_01_F",  // ???
			"O_supplyCrate_F",  // supply box [CSAT]

			// moved here because it's literally a large, netted supply crate
			"Exile_Container_SupplyBox"  // supply box
		];

	IL_Supported_Veh_Ammo = 
		[
			"ASC_B_box",  // ???
			"Box_East_AmmoVeh_F",  // vehicle ammo [CSAT]
			"Box_IND_AmmoVeh_F",  // vehicle ammo [AAF]
			"Box_NATO_AmmoVeh_F",  // vehicle ammo [NATO]
			"Land_CargoBox_V1_F"  // small container
		];

	IL_Supported_Barrel = 
		[
			// "Land_BarrelEmpty_F",
			// "Land_BarrelEmpty_grey_F",
			// "Land_BarrelSand_F",
			// "Land_BarrelSand_grey_F",
			// "Land_BarrelTrash_F",
			// "Land_BarrelTrash_grey_F",
			// "Land_BarrelWater_F",
			// "Land_BarrelWater_grey_F",
			// "Land_MetalBarrel_F"
		];//, "Land_MetalBarrel_empty_F", "MetalBarrel_burning_F"];

	IL_Supported_Tank = 
		[
			// "Land_WaterBarrel_F",
			// "Land_WaterTank_F"
		];

	IL_Supported_Rubberboat = 
		[
			"I_Boat_Transport_01_F",
			"O_Boat_Transport_01_F",
			"B_G_Boat_Transport_01_F",
			"B_Boat_Transport_01_F",
			"C_Rubberboat",
			"O_Lifeboat",
			"B_Lifeboat",
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"C_Scooter_Transport_01_F",
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"I_C_Boat_Transport_02_F",
			"C_Boat_Transport_02_F"
		];

	IL_Supported_SDV = 
		[
			"I_SDV_01_F",
			"O_SDV_01_F",
			"B_SDV_01_F",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
		];

	IL_Supported_Box_H1 = 
		[
			"Box_East_Wps_F",  // basic weapons [CSAT]
			"Box_East_WpsLaunch_F",  // launchers [CSAT]
			"Box_East_WpsSpecial_F",  // special weapons [CSAT]

			"Box_IND_Wps_F",  // basic weapons [AAF]
			"Box_IND_WpsLaunch_F",  // launchers [AAF]
			"Box_IND_WpsSpecial_F",  // special weapons [AAF]

			"Box_NATO_Wps_F",  // basic weapons [NATO]
			"Box_NATO_WpsLaunch_F",  // launchers [NATO]
			"Box_NATO_WpsSpecial_F"  // special weapons [NATO]
		];

	IL_Supported_Box_H2 = 
		[
			"Box_East_Ammo_F",  // basic ammo [CSAT]
			"Box_East_AmmoOrd_F",  // explosives [CSAT] 
			"Box_East_Grenades_F",  // grenades [CSAT]
			"Box_East_Support_F",  // support [CSAT]

			"Box_IND_Ammo_F",  // basic ammo [AAF]
			"Box_IND_AmmoOrd_F",  // explosives [AAF]
			"Box_IND_Grenades_F",  // grenades [AAF]
			"Box_IND_Support_F",  // support [AAF]

			"Box_NATO_Ammo_F",  // basic ammo [NATO]
			"Box_NATO_AmmoOrd_F",  // explosives [NATO]
			"Box_NATO_Grenades_F",  // grenades [NATO]
			"Box_NATO_Support_F"  // support [NATO]
		];
	IL_Supported_Cargo20 = 
		[
			"Land_Cargo20_blue_F", 	// cargo container (medium, blue)
			"Land_Cargo20_brick_red_F",  	// cargo container (medium, brick red)
			"Land_Cargo20_cyan_F",  	// cargo container (medium, cyan)
			"Land_Cargo20_grey_F",  	// cargo container (medium, grey)
			"Land_Cargo20_light_blue_F",  	// cargo container (medium, light blue)
			"Land_Cargo20_light_green_F",  	// cargo container (medium, light green)
			"Land_Cargo20_military_green_F",  	// cargo container (medium, military green)
			"Land_Cargo20_orange_F",  	// cargo container (medium, orange)
			"Land_Cargo20_red_F",  	// cargo container (medium, red)
			"Land_Cargo20_sand_F",   	// small container sand
			"Land_Cargo20_white_F",   	// cargo container (medium, white)
			"Land_Cargo20_yellow_F"  	// cargo container (medium, yellow)
		];
		
	//*****************************************************************************************************************
	//*										VIOC Units declaration
	//*****************************************************************************************************************	
	
	IL_Supported_Motorcicle_Cargo = 
		[
			"R71USA",
			"R71GerPre43",
			"R71Ger44",
			"R71Ger44Camo",
			"R71RusOlive",
			"R71RusGreenCamo",
			"R71RusDark",
			"R71RusGreen"
		];
	
	IL_Supported_Small_Crates = [];
	IL_Supported_Medium_Crates =  [];
	IL_Supported_Large_Crates =  [];
	IL_Supported_Stacket_Crates =  [];
	IL_Supported_Bike_Cargo = [];
	IL_Supported_Mini_Static_Cargo =  [];
	IL_Supported_Small_Static_Cargo =  [];
	IL_Supported_Medium_Static_Cargo =  [];
	IL_Supported_Large_Static_Cargo =  [];
	IL_Supported_XLarge_Static_Cargo =  [];
	IL_Supported_Motorcicle_Cargo =  [];
	IL_Supported_Gaz_Zis5_Cargo =  [];
	IL_Supported_Truck_Cargo =  [];
	IL_Supported_Car_Cargo =  [];
	IL_Supported_Armoured_Cargo =  [];
	IL_Supported_Small_Tank_Cargo = [];
	IL_Supported_Gaz_Zis5_Cargo = [];
	IL_Supported_Truck_Cargo = [];
	IL_Supported_Car_Cargo = [];
	IL_Supported_Armoured_Cargo = [];
	IL_Supported_Small_Tank_Cargo = [];
	IL_Supported_Medium_Tank_Cargo = [];
	IL_Supported_Large_Tank_Cargo = [];
	
	
	
	{
		//IL_Supported_Small_Crates pushBack format["%1", _x];
		
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_81mm_Mo_HE", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_81mm_Mo_Smoke", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Box_82mm_Mo_Smoke", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_BasicAmmunitionBox_US", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_BasicAmmunitionBox_SU", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_AmmoCrate_Mortar_SU", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_Lone_Big_Box", _x];
		IL_Supported_Small_Crates pushBack format["%1LIB_AmmoCrate_Arty_SU", _x];
		
		IL_Supported_Medium_Crates pushBack format["%1LIB_Box_60mm_Mo_HE", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_Box_60mm_Mo_Smoke", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_AmmoCrate_Mortar_GER", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_BasicAmmunitionBox_GER", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_Mine_Ammo_Box_Ger", _x];
		IL_Supported_Medium_Crates pushBack format["%1LIB_AmmoCrate_Arty_GER", _x];
		
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_GER", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_4Rnd_RPzB", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_UK", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_US", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_BasicWeaponsBox_SU", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_Mine_AmmoBox_US", _x];
		IL_Supported_Large_Crates pushBack format["%1LIB_Mine_Ammo_Box_Su", _x];
		
		IL_Supported_Stacket_Crates pushBack format["%1LIB_WeaponsBox_Big_GER", _x];
		IL_Supported_Stacket_Crates pushBack format["%1LIB_WeaponsBox_Big_SU", _x];
		
		IL_Supported_Bike_Cargo pushBack format["%1Exile_Bike_OldBike", _x];
		IL_Supported_Bike_Cargo pushBack format["%1Exile_Bike_MountainBike", _x];
		
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GER_SearchLight", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_SU_SearchLight", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG34_Lafette_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG34_Lafette_low_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG42_Lafette_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_MG42_Lafette_low_Deployed", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1IFA3_DSHkM_Mini_TriPod", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_M1919_M2", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1ifa3_M2StaticMG_base", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Maxim_M30_base", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Maxim_M30_Trench", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_Vickers_MMG", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GrWr34", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_GrWr34_g", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_BM37", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1LIB_M2_60", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_MG34t", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_zb30jt", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1csa38_GrW34", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_2inch_vehicle", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_brenmkiit", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_brenmkiit2", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_TKVZ24mg", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_TKVZ37MG", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_mvz17", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1CSA38_mvz36", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_low_s_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type92_tripod_low_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type97_mortar_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_type97_mortar_adv_ija", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_vickers_uk", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_m37", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_m41", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_mm", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usa_p", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc_camo01", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc_camo02", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m1919_tripod_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_usa", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_adv_usa", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1fow_w_m2_mortar_adv_usmc", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_81krh32", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_50krh38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_39_50rm38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_50rm38", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_Maxim_41", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_41_Lahti_L39", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_41", _x];
		
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Lahti_L39AA", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_SOV_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_High", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_Medium", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_Maxim", _x];
		IL_Supported_Mini_Static_Cargo pushBack format["%1NORTH_SOV_Maxim_High", _x];
		
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_30_w", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_30", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_38_w", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1LIB_FlaK_38", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_37PSTK36", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_39_45mm1937", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_45mm1937", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_45PSTK37", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_41_76RK27", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1927", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_76mm1927", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1927art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_76mm1927art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_76RK27art", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_S_41_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_W_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_FIN_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_W_Maxim_Quad", _x];
		IL_Supported_Small_Static_Cargo pushBack format["%1NORTH_SOV_Maxim_Quad", _x];
		
		IL_Supported_Medium_Static_Cargo pushBack format["%1Ifa3_p27G", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1Ifa3_p27", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1IFA3_Pak38", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1IFA3_53K", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_57mm_M1", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_QF6_pdr", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Flakvierling_38_w", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Flakvierling_38", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41_Camo", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_Nebelwerfer41_Gelbbraun", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_M45_Quadmount_UK", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1LIB_M45_Quadmount", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_FR", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_late", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_W", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_pak35_DE", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1csa38_KPUV37", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_ija", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_uk", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_usa", _x];
		IL_Supported_Medium_Static_Cargo pushBack format["%1fow_w_6Pounder_usmc", _x];
		
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_leFH18", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_leFH18_AT", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_61k", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Pak40_w", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_DAK_Pak40", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Pak40", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Zis3_w", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1LIB_Zis3", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_camo_foliage_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_camo_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_yellow_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1fow_w_pak40_gray_ger_heer", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_W_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_S_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_76k02", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1902", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_76mm1902", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_41_S_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_W_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_FIN_76k02art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1902art", _x];
		IL_Supported_Large_Static_Cargo pushBack format["%1NORTH_SOV_76mm1902art", _x];
		
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_AA_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_ARTY_w", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36_AA", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_DAK_FlaK_36_ARTY", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_AA", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1LIB_FlaK_36_ARTY", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_camo_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_gray_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_green_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1fow_w_flak36_tan_ger_heer", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_41_152H38", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_39_152mm1938", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_152mm1938", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_41_76k36", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_39_76mm1936", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_76mm1936", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_S_41_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_W_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_FIN_76k36art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_W_76mm1936art", _x];
		IL_Supported_XLarge_Static_Cargo pushBack format["%1NORTH_SOV_76mm1936art", _x];
		
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis6_parm_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis6_Parm", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_fuel_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_Fuel", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_med_w", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_Med", _x];
		IL_Supported_Gaz_Zis5_Cargo pushBack format["%1LIB_Zis5v_61K", _x];
		
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Open_Cargo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Tent_Cargo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US6_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Tent_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Open_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Parm_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ammo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Fuel_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Fuel", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_US_GMC_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ambulance_w", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ambulance", _x];	
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Open", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Tent", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Parm_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Parm", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ammo_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Fuel_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_OpelBlitz_Fuel", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7_Ammo", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7_w", _x];
		IL_Supported_Truck_Cargo pushBack format["%1LIB_SdKfz_7", _x];	
		
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_M1919_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_US_NAC_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42_camo", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_MG42_sernyt", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Kfz1_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1_hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_DAK_Kfz1_MG42", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_GazM1_SOV", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_GazM1_SOV_camo_sand", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Hood_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Hood", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_M1919_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_M1919", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Ambulance_w", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_DR_Willys_MB_Ambulance", _x];
		IL_Supported_Car_Cargo pushBack format["%1LIB_UK_Willys_MB_Ambulance", _x];
		
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_m3_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_M3_Halftrack_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_US_NAC_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_M8_Greyhound", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_SdKfz251", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_SdKfz251_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Sdkfz251_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_DAK_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SOV_M3_Halftrack_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SOV_M3_Halftrack", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_SdKfz251_captured_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_m3_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3_FFV_w", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1LIB_Scout_M3_FFV", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_W_41_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_S_41_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_FIN_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_SOV_W_39_BA10", _x];
		IL_Supported_Armoured_Cargo pushBack format["%1NORTH_SOV_41_BA10", _x];
		
		//IL_Supported_Armoured_Cargo pushBack format["%1", _x];
		//IL_Supported_XLarge_Static_Cargo pushBack format["%", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_SOV", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_SOV", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_w", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier_desert", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_UniversalCarrier", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_UK_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_DR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart_UK", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_UK_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_DR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart_UK", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M3A3_Stuart", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1LIB_M5A1_Stuart", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIA", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwI_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIA_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwI_FR", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR2_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_DE2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_1", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_PL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm35_FR2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIa_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIb_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzII_FR", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_mzm35t_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR2_W", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_mzm35t", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzbfwIamb_DE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_FR2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_LATE", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltm38_LATE2", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37ADW", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD8", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD6", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD7", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD9", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD10", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD11", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD12", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD13", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD458", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD456", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD457%", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD459", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD452", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD453", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD454", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD455", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD45", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4510", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4511", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4512", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a37AD4513", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17ADW", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD4", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD3", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17AD2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_TCvz33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz34", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIAvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzkpfwIvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz35", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_pzIIvcz", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1CSA38_ltvz38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a1", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m5a17APL", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3RU2", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1csa38_m3a3RU1", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M33com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M33com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M31", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26E", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26E", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M33", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_Vickers6t", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT5Com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT5Com", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_SOV_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_BT42", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT5", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_BT42", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T20", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T38", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M39", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1NORTH_FIN_T26_M39", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7A", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7_M1937", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1SOV_BT_BT7TU_M1937", _x];
		
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_1_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_2_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_ija_type95_HaGo_3_ija", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_universalCarrier", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m5a1_usa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m5a1_usmc", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m4a2_usa", _x];
		IL_Supported_Small_Tank_Cargo pushBack format["%1fow_v_m4a2_usmc", _x];
		
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G_WS_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_StuG_III_G", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_SdKfz124", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_PzKpfwIV_H_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_DAK_PzKpfwIV_H", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_PzKpfwIV_H", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_FlakPanzerIV_Wirbelwind_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_I_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_IB_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_UK_DR_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_I", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_Sherman_IB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_UK_Italy_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_US_NAC_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_75_Tubes", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4E5_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4E5", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_76", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4T34_Calliope", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A3_76_HVSS", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_FlakPanzerIV_Wirbelwind", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_76_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_76", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A2_SOV_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_M4A2_SOV", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_85_w", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1LIB_T34_85", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_StugIII", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_DAK2", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_PL", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_FR", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIB_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIC_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIID_LATE", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVC_W", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVC_DAK", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIV", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVB", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVcv38", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIBvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIICvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIIIDvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34cz5", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34cz1", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1CSA38_pzIVBvcz", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU3", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU1", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1csa38_t34RU2", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28e", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7A", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_BT7Com_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7A", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_BT7Com_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T28_M34", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_W_39_T28_M34_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_M34", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_SOV_41_T28_M34_com", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_39_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_BT7", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT7_M35", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_BT7", _x];
		
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usa_p", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usa", _x];
		IL_Supported_Medium_Tank_Cargo pushBack format["%1fow_v_lvta2_usmc", _x];
		

		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_E_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_DAK_PzKpfwVI_E", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_E", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwV_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwV", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_B_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_PzKpfwVI_B", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_SU85_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_SU85", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_JS2_43_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_JS2_43", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile_desert", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_AVRE", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Howitzer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Churchill_Mk7_Crocodile", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk4_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk6_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_Cromwell_Mk6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_IC_Firefly_w", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_IC_Firefly", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1LIB_M4A4_FIREFLY", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_camo_foliage_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_panther_camo_ger_heer", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1fow_v_cromwell_uk", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPL2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CPLHELA", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DPL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_PL", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo9W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo10W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo12W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo11W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo1W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo4W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_CW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo5W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo6W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo7W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo8W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS2W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCSW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS3W", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4ENW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo9", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo10", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo11", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo12", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2B", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_2camo8", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4EN", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_DCS2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo9", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo10", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo11", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo12", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C453", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C452", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_C45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D452", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D453", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_D45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_145", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_345", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo7", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_245camo8", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_5EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_6EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_cromwell_4EN45", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIRU2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIRU1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIW", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkII3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_valentineMkIIgreen4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_RU2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_RU1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_3", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_2", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_6", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_1", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_4", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaii_5", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1csa38_matildaiiCS_5", _x];
		
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_SOV_W_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_SOV_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_W_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_S_41_T34_76_1941", _x];
		IL_Supported_Large_Tank_Cargo pushBack format["%1NORTH_FIN_T34_76_1941", _x];
				
	} forEach _sid;
		
	/*
	IL_Supported_Cargo_Veh_C17 = IL_Supported_Cargo_Veh_C130J;
	IL_Supported_Cargo_NonVeh_C17 = IL_Supported_Cargo_NonVeh_C130J;
	IL_Supported_Cargo_C17 = IL_Supported_Cargo_Veh_C17 + IL_Supported_Cargo_NonVeh_C17;*/
	
	
	//*****************************************************************************************************************
	//*										VIOC Cargo declaration
	//*****************************************************************************************************************
	//cargo with extra set of higth after unload
	IL_Cargo_To_Drop = IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo + IL_Supported_Medium_Static_Cargo + IL_Supported_Large_Static_Cargo + IL_Supported_XLarge_Static_Cargo;
	
	//IL_Supported_Bike_Cargo
	
	IL_Supported_Crates_place_near = IL_Supported_Small_Crates + IL_Supported_Medium_Crates + IL_Supported_Large_Crates;
		
	IL_Supported_Cargo_Veh_Gaz = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Gaz = IL_Supported_Crates_place_near + IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20 + IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo;
	IL_Supported_Cargo_Gaz = IL_Supported_Cargo_Veh_Gaz + IL_Supported_Cargo_NonVeh_Gaz;
	
	IL_Supported_Cargo_Veh_Praga = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Praga = IL_Supported_Crates_place_near + IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20 + IL_Supported_Mini_Static_Cargo + IL_Supported_Small_Static_Cargo;
	IL_Supported_Cargo_Praga = IL_Supported_Cargo_Veh_Gaz + IL_Supported_Cargo_NonVeh_Gaz;
	
	IL_Supported_Cargo_Veh_Blitz = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_Blitz = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_Blitz = IL_Supported_Cargo_Veh_Blitz + IL_Supported_Cargo_NonVeh_Blitz;
	
	IL_Supported_Cargo_Veh_BlitzCSA = IL_Supported_Cargo_Veh_Blitz;
	IL_Supported_Cargo_NonVeh_BlitzCSA = IL_Supported_Cargo_NonVeh_Blitz;
	IL_Supported_Cargo_BlitzCSA = IL_Supported_Cargo_Blitz;
	
	IL_Supported_Cargo_Veh_US6 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_US6 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_US6 = IL_Supported_Cargo_Veh_US6 + IL_Supported_Cargo_NonVeh_US6;
	
	IL_Supported_Cargo_Veh_GMC = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_GMC = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_GMC = IL_Supported_Cargo_Veh_GMC + IL_Supported_Cargo_NonVeh_GMC;
	
	IL_Supported_Cargo_Veh_GMCFOW = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_GMCFOW = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Medium_Static_Cargo;
	IL_Supported_Cargo_GMCFOW = IL_Supported_Cargo_Veh_GMC + IL_Supported_Cargo_NonVeh_GMC;
	
	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Car_Cargo + IL_Supported_Motorcicle_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_SdKfz7 = IL_Supported_Cargo_NonVeh_US6 + IL_Supported_Large_Static_Cargo + IL_Supported_XLarge_Static_Cargo;
	IL_Supported_Cargo_Veh_SdKfz7 = IL_Supported_Cargo_Veh_SdKfz7 + IL_Supported_Cargo_NonVeh_SdKfz7;
	
	IL_Supported_Cargo_Veh_LCVP = IL_Supported_Car_Cargo + IL_Supported_Small_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_LCVP = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCVP = IL_Supported_Cargo_Veh_LCVP + IL_Supported_Cargo_NonVeh_LCVP;

	IL_Supported_Cargo_Veh_LCM3 = IL_Supported_Armoured_Cargo + IL_Supported_Gaz_Zis5_Cargo + IL_Supported_Truck_Cargo + IL_Supported_Cargo_Veh_LCVP;
	IL_Supported_Cargo_NonVeh_LCM3 = IL_Supported_Cargo_NonVeh_US6;
	IL_Supported_Cargo_LCM3 = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Cargo_NonVeh_LCM3;
	
	IL_Supported_Cargo_Veh_C47 = IL_Supported_Motorcicle_Cargo;
	IL_Supported_Cargo_NonVeh_C47 = IL_Supported_Cargo_NonVeh_Gaz + IL_Supported_Stacket_Crates + IL_Supported_Barrel + IL_Supported_Tank;
	IL_Supported_Cargo_C47 = IL_Supported_Cargo_Veh_C47 + IL_Supported_Cargo_NonVeh_C47;
	
	IL_Supported_Cargo_Veh_Liberty = IL_Supported_Cargo_Veh_LCM3 + IL_Supported_Medium_Tank_Cargo + IL_Supported_Large_Tank_Cargo;
	IL_Supported_Cargo_NonVeh_Liberty = IL_Supported_Cargo_NonVeh_LCM3;
	IL_Supported_Cargo_Liberty = IL_Supported_Cargo_Veh_Liberty + IL_Supported_Cargo_NonVeh_Liberty;
};

//	PROCEDURES AND FUNCTIONS
if (isnil "IL_Procedures") then
{
	IL_Procedures = true;

	IL_Init_Veh =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Veh.", IL_Script_Inst];
		};
		
		private["_obj", "_obj_type", "_force"];
		_obj = _this select 0;
		_force = if (count _this > 1) then {_this select 1} else {false};
		_obj_type = (typeOf _obj);

		if ((isNil {_obj getVariable "default_mass"}) || (_force)) then
			{
				if (isNil {_obj getVariable "default_mass"}) then
				{
					_obj setVariable["default_mass", getMass _obj, true];
				}
				else
				{
					_obj setMass (_obj getVariable "default_mass");
				};
			};

		/*
		if (_obj_type in IL_Supported_Vehicles_C17) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C17, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.25, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 16, true];};//4.5, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		*/
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		// Gaz
		if (_obj_type in IL_Supported_Vehicles_Gaz) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Gaz, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};	//-0.65
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
		};
		// Praga
		if (_obj_type in IL_Supported_Vehicles_Praga) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Praga, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// Blitz
		if (_obj_type in IL_Supported_Vehicles_Blitz) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Blitz, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.1, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// Blitz
		if (_obj_type in IL_Supported_Vehicles_BlitzCSA) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_BlitzCSA, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// US6
		if (_obj_type in IL_Supported_Vehicles_US6) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_US6, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 0.15, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.3, true];};  // how far the container animates to load
		};
		// GMC
		if (_obj_type in IL_Supported_Vehicles_GMC) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_GMC, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};
		// GMC FoW
		if (_obj_type in IL_Supported_Vehicles_GMCFOW) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_GMC, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 1.1, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};  // how far the container animates to load
		};
		// SdKfz7
		if (_obj_type in IL_Supported_Vehicles_SdKfz7) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_SdKfz7, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};  // how far the container animates to load
		};
		// LCVP
		if (_obj_type in IL_Supported_Vehicles_LCVP) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCVP, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -3, true];};  // how far the container animates to load
		};
		// LCM3
		if (_obj_type in IL_Supported_Vehicles_LCM3) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_LCM3, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.5, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -3, true];};  // how far the container animates to load
		};
		// Liberty Ship
		if (_obj_type in IL_Supported_Vehicles_Cargo_Ship) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_Liberty, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -2, true];};  // how high the container animates to load
			if ((isNil {_obj getVariable "zload_offset"}) || (_force)) then {_obj setVariable["zload_offset", -5, true];};  // how high the container ends to load
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 90, true];};  // how far the container animates to load
		};
		
		if (_obj_type in IL_Supported_Vehicles_C47) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -4.57, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
			//if (_obj_type == "C130J_Cargo") then
			//{
				if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_C47, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 8.5, true];};
			//}
			//else
			//{
				//if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", (IL_Num_Slots_C47 / 2) - 1, true];};
				//if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 13.5, true];};
			//};
		};
	};
//	END IL_Init_Veh

	IL_Init_Box =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
		};

		private["_obj", "_obj_type", "_bbr", "_p0", "_p1"];
		_obj = _this select 0;
		
		_obj setVariable["attachedPos", 0, true];
		_obj setVariable["attachedTruck", _obj, true];
		_obj setVariable["doors", "N", true];
		
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0, true];
		
		_bbr = boundingBoxReal _obj;
		_p0 = _bbr select 0;
		_p1 = _bbr select 1;
		_obj setVariable["zload_cargo", abs (_p0 select 2), true];
		
		_obj_type = (typeOf _obj);
		
		if (_obj_type in IL_Supported_Cargo20) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.6, true];//HEMETT Box ~2.09281
			//LOCAL
			//_obj setMass 2400;
			[_obj, 2400] call IL_SetNewMass;
		};
		
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		if (_obj_type in IL_Supported_Small_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 60] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Medium_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 120] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Large_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 240] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Stacket_Crates) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0, true];
			[_obj, 1200] call IL_SetNewMass;
		};
		if (_obj_type in IL_Supported_Motorcicle_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Gaz_Zis5_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Truck_Cargo) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Car_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Armoured_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Small_Tank_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Medium_Tank_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_Large_Tank_Cargo) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2, true];
		};		
		if (_obj_type in IL_Supported_Mini_Static_Cargo) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Small_Static_Cargo) then
		{
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Medium_Static_Cargo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
		};
		if (_obj_type in IL_Supported_Large_Static_Cargo) then
		{
			_obj setVariable["slots", 3, true];
			_obj setVariable["cargo_offset", 1, true];
		};	
		if (_obj_type in IL_Supported_XLarge_Static_Cargo) then
		{
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 2, true];
		};
	};
//	END IL_Init_Box

	IL_Server_AddScore =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_AddScore.", IL_Script_Inst];
		};
		if (isServer) then
		{
			((_this select 1) select 0) addScore ((_this select 1) select 1);
		};
	};
//	END IL_Server_AddScore

	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
//	END publicVariable "IL_SetScore";

	IL_Score = 
	{
		private ["_obj", "_score"];
		
		_obj = _this select 0;
		_score = _this select 1;
		
		if (_score != 0) then
		{
			IL_SetScore = [_obj, _score];
			if (isServer) then
			{
				["Cos", IL_SetScore] spawn IL_Server_AddScore;
			}
			else
			{
				publicVariableServer "IL_SetScore";
			};
		};
	};
//	END IL_Score

	IL_Server_SetDir =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj", "_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);
	};
//	END IL_Server_Turn_Obj

	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
//	END publicVariable "IL_SetDir";

	IL_Rotate = 
	{
		private ["_obj", "_to", "_change"];
		
		_obj = _this select 0;
		_to = _this select 1;
		_change = _this select 2;
		
		_change = (getDir _obj + _change) - getDir _to;
		
		IL_SetDir = [_obj, _change];
		if (local _obj) then
		{
			["Cos", IL_SetDir] spawn IL_Server_SetDir;
		}
		else
		{
			if (isDedicated) then
			{
				(owner _obj) publicVariableClient "IL_SetDir";
			}
			else
			{
				publicVariableServer "IL_SetDir";
			};
		};
	};
//	END IL_Rotate
	
	IL_Server_SetMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
		};
		private ["_obj", "_mass"];
		_obj = _this select 1 select 0;
		_mass = _this select 1 select 1;
		if ((getMass _obj) != _mass) then
		{
			_obj setMass _mass;
		};
	};
//	END IL_Server_SetMass
	
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
//	END publicVariable "IL_SetMass";

	IL_GetCargoMass =
	{
		private ["_v", "_cargo_mass"];
		_v = _this select 0;
		_cargo_mass = 0;
		if (count(attachedObjects _v) > 0) then
		{
			{
				_cargo_mass = _cargo_mass + getMass _x;
			} forEach attachedObjects _v;
		};
		_cargo_mass;
	};
//	END IL_GetCargoMass

	IL_GetDefaultMass =
	{
		private ["_v"];
		_v = _this select 0;
		_v getVariable "default_mass";
	};
//	END IL_GetDefaultMass

	IL_SetNewMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_SetMass", IL_Script_Inst];
		};
		
		if !(IL_Mass) ExitWith {};
		private ["_v", "_v_def_mass", "_cargo_mass"];
		_v = _this select 0;
		_v_def_mass =  if (count _this > 1) then {_this select 1} else {0};
		_cargo_mass =  if (count _this > 2) then {_this select 2} else {0};
		
		if (_v_def_mass == 0) then
		{
			_v_def_mass = [_v] call IL_GetDefaultMass;
		};
		if (_cargo_mass == 0) then
		{
			_cargo_mass = [_v] call IL_GetCargoMass;
		};
		
		if ((getMass _v) != (_v_def_mass + _cargo_mass)) then
		{
			IL_SetMass = [_v, (_v_def_mass + _cargo_mass)];
			if (local _v) then
			{
				["Cos", IL_SetMass] spawn IL_Server_SetMass;
			}
			else
			{
				if (isDedicated) then
				{
					(owner _v) publicVariableClient "IL_SetMass";
				}
				else
				{
					publicVariableServer "IL_SetMass";
				};
			};
		};
	};
//	END IL_SetNewMass
	
	IL_Vehicle_Chat =
	{
		private["_v", "_msg", "_mass_info", "_text", "_cargo_mass", "_v_def_mass"];
		_v = _this select 0;
		_msg = _this select 1;
		_mass_info =  if (count _this > 2) then {_this select 2} else {false};

		_v vehicleChat _msg;
		if (_mass_info && IL_Mass) then
		{
			_cargo_mass = 0;
			_v_def_mass = [_v] call IL_GetDefaultMass;
			_cargo_mass = [_v] call IL_GetCargoMass;
			
			_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "picture")];
			_text = _text + Format ["<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t><br/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo   mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _cargo_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass + _cargo_mass];
		};
		if (vehicle Player != _v) then
		{
			if (_mass_info && IL_Mass) then
			{
				_text = _text + _msg;
				hint parseText (_text);
			}
			else
			{
				Hint Format ["%1", _msg];
			};
		}
		else
		{
			if (_mass_info && IL_Mass) then
			{
				hint parseText (_text);
			};
		};
	};
//	END IL_Vehicle_Chat
	
	IL_Move_Attach=
	{
		private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
		_veh = _this select 0;
		_obj = _this select 1;
		_from = _this select 2;
		_to = _this select 3;
		_step = _this select 4;
		_turn = if (count _this > 5) then {_this select 5} else {false};
		
		_from_x = _from select 0;
		_from_y = _from select 1;
		_from_z = _from select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _from_x =""%2"", _from_y =""%3"", _from_z =""%4""", IL_Script_Inst, _from_x, _from_y, _from_z];
		};

		_to_x = _to select 0;
		_to_y = _to select 1;
		_to_z = _to select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _to_x =""%2"", _to_y =""%3"", _to_z =""%4""", IL_Script_Inst, _to_x, _to_y, _to_z];
		};
		
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x =""%2"", _y =""%3"", _z =""%4""", IL_Script_Inst, _x, _y, _z];
		};
		
		if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
		{
			_steps = round ((abs _x) / _step);
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x > _y and _z, _steps =""%2""", IL_Script_Inst, _steps];
			};
		}
		else
		{
			if ((abs _y) > (abs _z)) then
			{
				_steps = round ((abs _y) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _y > _z, _steps =""%2""", IL_Script_Inst, _steps];
				};
			}
			else
			{
				_steps = round ((abs _z) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _z > _y, _steps =""%2""", IL_Script_Inst, _steps];
				};
			};
		};

		_i = 0;
		_obj AttachTo [_veh, _from];
		while {_i < _steps} do
		{
			_i = _i + 1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_veh, _pos];
			if (_turn) then
			{
				[_obj, _veh, -90] call IL_Rotate;
				_turn = false;
			};
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _pos =""%2"" [%3]", IL_Script_Inst, _pos, getPos _obj];
			};
			sleep 0.25;
		};

		_obj AttachTo [_veh, _to];
	};
//	END IL_Move_Attach

	IL_Create_And_Attach =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Create_And_Attach", IL_Script_Inst];
		};
		_type = _this select 0;
		_to = _this select 1;
		_x = if (count _this > 2) then {_this select 2} else {0};
		_y = if (count _this > 3) then {_this select 3} else {0};
		_z = if (count _this > 4) then {_this select 4} else {0};
		_m = createVehicle [_type, position _to, [], 0, "CAN_COLLIDE"];
		_m AttachTo [_to,[_x,_y,_z]];
		_m
	};
//	END IL_Create_And_Attach

	IL_Cargo_Para =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Cargo_Para", IL_Script_Inst];
		};
		[Player, IL_Unload_Score] call IL_Score;
		private ["_smoke", "_light", "_damage", "_smoke_type", "_chemlight_type", "_cargo_pos", "_last_attach_pos", "_dist", "_velocity", "_tmp"];
		_cargo = _this select 0;
		_v = _this select 1;
		_last_attach_pos = _this select 2;
		if (((IL_Para_Smoke) || (IL_Para_Smoke_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_smoke_type = IL_Para_Smoke_Veh;
		}
		else
		{
			_smoke_type = IL_Para_Smoke_Default;
		};
		if (((IL_Para_Light) || (IL_Para_Light_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_chemlight_type = IL_Para_Light_Veh;
		}
		else
		{
			_chemlight_type = IL_Para_Light_Default;
		};

		_cargo_pos = [0,0,0];
		
		_damage = getDammage _cargo;
		detach _cargo;
		_dist = _v distance _cargo;
		_tmp = [_cargo] spawn
		{
			while {(getPosATL (_this select 0)) select 2 > IL_Para_Drop_Open_ATL} do
			{
				sleep 0.2;
			};
		};
		while {(_v distance _cargo) - _dist < 20} do
		{
			sleep 0.2;
		};
		if (IL_Para_Drop_Open_ATL > 0) then
		{
			while {(getPosATL _cargo) select 2 > (IL_Para_Drop_Open_ATL + ((velocity _cargo) select 2) * -0.5)} do
			{
				sleep 0.2;
			};
		};
		_chute = createVehicle ["B_Parachute_02_F", position _cargo, [], 0, "CAN_COLLIDE"];
		_chute attachTo [_cargo, _cargo_pos];
		_velocity = velocity _cargo;
		detach _chute;

		if (IL_Para_Drop_Velocity) then
		{
			_chute setVelocity _velocity;
		};
		_cargo attachTo [_chute, _cargo_pos];
		
		if (IL_Para_Smoke) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
		};
		if (IL_Para_Light) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
		};
		while {(getPos _cargo) select 2 > 2} do
		{
			sleep 0.2;
		};
		detach _cargo;
		if (IL_Para_Smoke) then
		{
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light) then
		{
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
		//Additional lights and smoke
		if (IL_Para_Smoke_Add) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light_Add) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
//	END IL_Cargo_Para
		
		_cargo setPosASL getPosASL _cargo;
		
		if (IL_CDamage == 0) then
		{
			_cargo setDamage 0;
		};
		
		if (IL_CDamage == 1) then
		{
			_cargo setDamage _damage;
			if (_damage != (getDammage _cargo)) then
			{
				sleep 1;
				_cargo setDamage _damage;
			};
		};
	};

	IL_Do_Load =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Do_Load", IL_Script_Inst];
		};

		private["_NoBoxHint", "_v", "_supported_cargo", "_zload", "_x_cargo_offset", "_cargo_offset", "_sdist", "_spoint", "_slot_num", "_counter", "_done", "_obj_lst", "_damage", "_obj_type", "_doors", "_box_num", "_dummy", "_nic", "_turn", "_force", "_cargo"];
		_NoBoxHint = "The box is in the vicinity. Perhaps it is outside of the loading area.";
		_v = _this select 0;
		_supported_cargo = _this select 1;
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		_force = if (count _this > 3) then {_this select 3} else {false};
		_cargo = if (count _this > 4) then {_this select 4} else {ObjNull};
		
		_v setVariable["can_load", false, true];
		_zload = _v getVariable "zload";
		_obj_type = (typeOf _v);
		_sdist = 0;

		_counter = 0;
		_done = false;
		_turn = false;

		// APC
		/*
		if ((_obj_type in IL_Supported_Vehicles_C17) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-16.5,-3];//Ramp end [0,-13.5,-3.2]
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		*/
		//*****************************************************************************************************************
		//*										VIOC Units declaration
		//*****************************************************************************************************************
		//Gaz
		if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			//_spoint = _v modelToWorld [0,-4.5,-1.6];
			_spoint = _v modelToWorld [0,-4.5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// Praga
		if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// Blitz
		if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// Blitz
		if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// US6
		if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// GMC
		if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// GMC FoW
		if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		//SdKfz7
		if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// LCVP
		if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 20;	//IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			//_spoint = _v modelToWorld [0,12,0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// LCVP
		if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 30;	//IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			//_spoint = _v modelToWorld [0,6,0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		// Liberty Ship
		if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 50;	//IL_SDistL;
			_spoint = _v modelToWorld [0,(_v getVariable "load_offset"),0];
			//_spoint = _v modelToWorld [0,6,0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		//C47
		if ((_obj_type in IL_Supported_Vehicles_C47) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = 20;	//IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-9,-5.4];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if !(_force) then
		{
			//nearestObjects [position, types, radius, 2Dmode]
			_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
		}
		else
		{
			_obj_lst = [_cargo];
		};

		if (count (_obj_lst) > 0) then
		{
			{
				if( locked _x > 1 ) exitWith {
					["Cannot load a locked vehicle",false] call SA_Hint;
				};
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". Cargo: ""%2"" found.", IL_Script_Inst, _x];
				};
				if (isNil {_x getVariable "attachedPos"}) then
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". Init box: ""%2"".", IL_Script_Inst, _x];
					};
					[_x] call IL_Init_Box;
				};
				/*
				*
				*
				*	TODO: change turn to number for th deg to turn!
				*
				*/
				if ((typeOf _x) in (IL_Supported_Cargo20 + ["Land_WaterTank_F"])) then
				{
					_turn = true;
				};
				//It allows you to load oversize loads, but they must be on the list of supported cargo!!!
				if ((abs(_slot_num - _box_num) < (_x getVariable "slots")) && (_box_num != 0)) then
				{
					[_v, "This cargo is to big. "] call IL_Vehicle_Chat;
				}
				else
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". _box_num: ""%2"" _slot_num: ""%3""", IL_Script_Inst,  _box_num, _slot_num];
					};
					/*if (_obj_type in IL_Supported_Vehicles_MH9) then
					{
						_turn = !_turn;
					};*/
					if ((_box_num > _slot_num) && !_done) then
					{
						[_v, Format ["Loading ""%1"" on ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_counter = (_box_num);
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_zload_offset = (_v getVariable "zload_offset");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						}
						else
						{
							_x_cargo_offset = 0;
						};
						_damage = getDammage _x;
						
						if ((typeOf _x) in IL_Supported_SDV) then
						{
							_x animate ["periscope", 3]; 
							_x animate ["Antenna", 3]; 
							_x animate ["HideScope", 3]; 
							_x animate["display_on_R", 1];
							//animationPhase
							[_v, "Waiting for periscope."] call IL_Vehicle_Chat;
							while {_x animationPhase "periscope" < 3} do
							{
								sleep 1;
							};
						};

						/*
						if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-14,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-13,-1.75 + _zload], [_x_cargo_offset,-6.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-5.5,_zload], [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						*/
						//*****************************************************************************************************************
						//*										VIOC Units declaration
						// IL_Move_Attach
						// private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
						// _v = "_veh"
						// _x = "_obj"
						// [...] = "_from"
						// [...] = "_to"
						// 1 = "_pos"
						// _turn = "_step"
						//*****************************************************************************************************************
						// Gaz
						if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
						{
							/*if(_x in IL_Supported_Crates_place_near) then {
								[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.1 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							} else {
								[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							};*/
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Praga
						if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-5 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-5 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// US6
						if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC
						if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC FoW
						if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// SdKfz7
						if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-1 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,8,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCM3
						if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,10,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Liberty Ship
						if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							//[_v, _x, [_x_cargo_offset,10,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							//[_v, _x, [_x_cargo_offset,_cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 + 50,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 + 50,_zload_offset], 1, _turn] call IL_Move_Attach;
						};
						//C47
						if ((_obj_type in IL_Supported_Vehicles_C130J)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-9,-0.93 + _zload], [_x_cargo_offset,-8,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-7,-0.93 + _zload], [_x_cargo_offset,-3.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-2.5,_zload], [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};

						_counter = _counter - (_x getVariable "slots");

						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
						};
						/*if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _x, true];
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _x, true];
						};*/
						
						[_v] call IL_SetNewMass;
						
						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed 0;
						};
						
						_x setVariable["attachedPos", _counter, true];
						_x setVariable["attachedTruck", _v, true];
						_x setVariable["doors", _doors, true];
						
						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						
						if (_counter > _slot_num) then
						{
							[_v, Format ["""%1"" is loaded onto ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), abs(_slot_num - _counter)], true] call IL_Vehicle_Chat;
						}
						else
						{
							[_v, Format ["""%1"" is loaded onto ""%2"" There is no more space.", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")], true] call IL_Vehicle_Chat;
						};
						//player addScore IL_Load_Score;
						[Player, IL_Load_Score] call IL_Score;
					}
					else
					{
						if ((_box_num > _slot_num) && !_done) then
						{
							[_v, _NoBoxHint] call IL_Vehicle_Chat;
						};
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
		}
		else
		{
			_msgErr = format["Vehicles found: %1", _obj_lst];
			//_msgErr = format["Vehicles found: %1", _supported_cargo];
			[_v, _msgErr] call IL_Vehicle_Chat;
			//[_v, _NoBoxHint] call IL_Vehicle_Chat; _supported_cargo
		};
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Load

	IL_Do_Unload =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Do_Unload.", IL_Script_Inst];
		};

		private ["_v", "_para", "_supported_cargo", "_doors", "_counter", "_done", "_obj_lst", "_zload", "_x_cargo_offset", "_cargo_offset", "_obj_type", "_damage", "_nic", "_free_slots", "_turn", "_skip", "_last_attach_pos", "_cargo_type"];
		_v = _this select 0;
		_para = if (count _this > 1) then {_this select 1} else {false};
		//_para = _this select 1;
		// _supported_cargo = _this select 2;
		// _doors = if (count _this > 3) then {_this select 3} else {"B"};
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		
		_v setVariable["can_load", false, true];
		_counter = 0;
		_done = false;
		_turn = false;
		_skip = true;
		_obj_lst = [];

		_obj_type = (typeOf _v);
		/*if (_obj_type in IL_Supported_Vehicles_MH9) then
		{
			if (_doors == "L") then
			{
				_obj_lst = [_v getVariable "box_l"];
			}
			else
			{
				_obj_lst = [_v getVariable "box_r"];
			};
		}
		else
		{
			//_obj_lst = nearestObjects[_v, _supported_cargo, IL_SDistU];
			_obj_lst = attachedObjects _v;
		};*/
		_obj_lst = attachedObjects _v;
		
		if (count (_obj_lst) > 0) then
		{
			{
				_obj_type = (typeOf _v);
				
				if (_x getVariable "doors" == _doors) then
				{
					if (_doors == "B") then
					{
						_counter = (_v getVariable "box_num");
					};
					if (_doors == "L") then
					{
						_counter = (_v getVariable "box_num_l");
					};
					if (_doors == "R") then
					{
						_counter = (_v getVariable "box_num_r");
					};
					if (((_x getVariable "attachedTruck") == _v) && ((_x getVariable "attachedPos") == (_counter)) && (_counter < 0) && !_done) then
					{
						[_v, Format ["Unloading ""%1"" from ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_skip = false;
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_zload_offset = (_v getVariable "zload_offset");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						_damage = getDammage _x;
						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						}
						else
						{
							_x_cargo_offset = 0;
						};

						_obj_type = (typeOf _v);

						/*
						if ((_obj_type in IL_Supported_Vehicles_C17)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 32 - _cargo_offset,_zload], [_x_cargo_offset,-5.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-6.5,_zload], [_x_cargo_offset,-13,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-14,-1.75 + _zload], [_x_cargo_offset,-16.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								[_v, _x, [_x_cargo_offset,-16.5,-1.75 + _zload], [_x_cargo_offset,-19.5,-1.75 + _zload], 1, _turn] call IL_Move_Attach;
								_last_attach_pos = [_x_cargo_offset,-19.5,-1.75 + _zload];
							};
						};*/
						//*****************************************************************************************************************
						//*										VIOC Units declaration
						//*****************************************************************************************************************
						//Gaz
						if ((_obj_type in IL_Supported_Vehicles_Gaz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Praga
						if ((_obj_type in IL_Supported_Vehicles_Praga) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_Blitz) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Blitz
						if ((_obj_type in IL_Supported_Vehicles_BlitzCSA) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// US6
						if ((_obj_type in IL_Supported_Vehicles_US6) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC
						if ((_obj_type in IL_Supported_Vehicles_GMC) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// GMC FoW
						if ((_obj_type in IL_Supported_Vehicles_GMCFOW) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						//SdKfz7
						if ((_obj_type in IL_Supported_Vehicles_SdKfz7) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCVP) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,8,_zload], 1, _turn] call IL_Move_Attach;
						};
						// LCVP
						if ((_obj_type in IL_Supported_Vehicles_LCM3) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,10,_zload], 1, _turn] call IL_Move_Attach;
						};
						// Liberty Ship
						if ((_obj_type in IL_Supported_Vehicles_Cargo_Ship) && (_doors == "B")) then
						{
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,10,_zload], 1, _turn] call IL_Move_Attach;
							//[_v, _x, [_x_cargo_offset,_counter + 0.25 + 50,_zload], [_x_cargo_offset,_cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,_counter + 0.25 + 50,_zload_offset], [_x_cargo_offset,_cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						//C47
						if ((_obj_type in IL_Supported_Vehicles_C47)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 17 - _cargo_offset,_zload], [_x_cargo_offset,-2.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-3.5,_zload], [_x_cargo_offset,-7,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-8,-0.93 + _zload], [_x_cargo_offset,-9,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								[_v, _x, [_x_cargo_offset,-10,-0.93 + _zload], [_x_cargo_offset,-12,-0.93 + _zload], 1, _turn] call IL_Move_Attach;
								_last_attach_pos = [_x_cargo_offset,-12,_zload];
							};
						};
					
						if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
						{
							[_x, _v, _last_attach_pos] spawn IL_Cargo_Para;
						}
						else
						{
							sleep 0.2;
							detach _x;
							_x enableSimulationGlobal true;  // Lyrae: wtf is this
							_x setVelocity [0, 0, -0.2];
						};

						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed -1;
						};
						
						_counter = _counter + (_x getVariable "slots");
						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
							_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
						};
						if (_doors == "L") then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _v, true];
							_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
						};
						if (_doors == "R") then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _v, true];
							_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
						};
						
						[_v] call IL_SetNewMass;
						
						_x setVariable["attachedPos", 0, true];
						_x setVariable["attachedTruck", _x, true];
						_x setVariable["doors", "N", true];

						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						
						//som WW2 statics hovering in the air after unloade them, fixed it
						_cargo_type = (typeOf _x);
						if (_cargo_type in IL_Cargo_To_Drop) then {
							_x setPos [getPos _x select 0, getPos _x select 1, 0];
						};
						
						[_v, Format ["""%1"" was unloaded from the ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), _free_slots], true] call IL_Vehicle_Chat;
						//player addScore IL_Unload_Score;
						[Player, IL_Unload_Score] call IL_Score;
						sleep 1;
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
			if (_skip) then
			{
				[_v, "Can not find cargo. Try again."] call IL_Vehicle_Chat;
				
				if (_counter < 0) then
				{
					_counter = _counter + 1;
				};
				
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
					_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
				};
				if (_doors == "L") then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _v, true];
					_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
				};
				if (_doors == "R") then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _v, true];
					_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
				};
			};
		}
		else
		{
			[_v, "BOX 404 error. Box not found O.o. Vehicle data reset..."] call IL_Vehicle_Chat;
			[_v, true] call IL_Init_Veh;
			[_v, "Vehicle data reset done."] call IL_Vehicle_Chat;
		};
		[_v] call IL_SetNewMass;
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Unload

	IL_GetOut =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};

		private ["_v", "_player", "_para", "_chute",  "_backpack", "_pos", "_x_offset", "_dist", "_dist_out", "_dist_out_para", "_velocity"];
		_v = _this select 0;
		_player = _this select 1;
		_para = if (count _this > 2) then {_this select 2} else {false};

		/*if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
		{
			_dist_out = 5;
			_dist_out_para = 5;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_MOHAWK) then
		{
			_dist_out = 5;
			_dist_out_para = 11;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_CHINOOK) then
		{
			_dist_out = 7;
			_dist_out_para = 11;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_C17) then
		{
			_dist_out = 15;
			_dist_out_para = 20;
		};*/
		if ((typeOf _v) in IL_Supported_Vehicles_C130J) then
		{
			_dist_out = 7;
			_dist_out_para = 15;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_C47) then
		{
			_dist_out = 7;
			_dist_out_para = 15;
		};
		/*
		_pos = (_v worldToModel (getPosATL _player));
		_x_offset = _pos select 0;
		if (_x_offset < 0) then
		{
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = 90;
			}
			else
			{
				_x_offset = 8;
			};
		}
		else
		{
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = -90;
			}
			else
			{
				_x_offset = -8;
			};
		};*/
//	END IL_GetOut
		
		_player allowDamage false;
		sleep 0.2;
		unassignVehicle _player;
		_player action ["EJECT",vehicle _player];
		sleep 0.5;
	 
		if !(_para) then
		{
			_player setDir ((getDir _v) + 180);
			_pos = ([_v, _dist_out, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
		}
		else
		{
			_pos = ([_v, _dist_out_para, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
			_dist = _v distance _player;
			while {(_v distance _player) - _dist < 20} do
			{
				sleep 0.2;
			};
			if (IL_Para_Jump_Open_ATL > 0) then
			{
				while {(getPosATL _player) select 2 > IL_Para_Jump_Open_ATL} do
				{
					sleep 0.2;
				};
			};
			if !(unitBackpack _player isKindOf "B_Parachute") then
			{
				_chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "CAN_COLLIDE"];
//				_chute setPos getPos _player;
				_chute AttachTo [_player, [0,0,0]];
				detach _chute;
				_velocity = velocity _player;
				_player moveInDriver _chute;
				if (IL_Para_Jump_Velocity) then
				{
					_chute setVelocity _velocity;
				};
			};
		};
		_player allowDamage true;
		
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut. Player ATL: ""%2""", IL_Script_Inst, _pos];
		};
	};
};
//	END PROCEDURES AND FUNCTIONS

//	MAIN CODE
_vsupported = false;
/*
if (_obj_main_type in IL_Supported_Vehicles_C17) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C17.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_NonVeh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C17</t>",
	{
		[_this select 0, IL_Supported_Cargo_C17] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-16.5,-3.2], IL_Supported_Cargo_Veh_C17, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#007f0e"">Get in C17</t>",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<t color=""#ff0000"">Get out C17</t>",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C17</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'back_ramp' == 1)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Open cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp', 1];
		_this select 0 animate ['back_ramp_door_main', 1];
		_this select 0 animate ['back_ramp_st', 1];
		
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Close cargo doors in C17</t>",
	{
		_this select 0 animate ['back_ramp_st', 0];
		_this select 0 animate ['back_ramp', 0];
		_this select 0 animate ['back_ramp_door_main', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-16.5 + IL_SDistL + IL_SDistL_Heli_offset,-2], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'back_ramp' == 1) && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];
};
*/

//*****************************************************************************************************************
//*										VIOC Units declaration
//*****************************************************************************************************************
//Gaz
if (_obj_main_type in IL_Supported_Vehicles_Gaz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Gaz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Gaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_Gaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Gaz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Praga) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Praga.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Praga] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Praga, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_Blitz) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Blitz.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Blitz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Blitz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Blitz
if (_obj_main_type in IL_Supported_Vehicles_BlitzCSA) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_BlitzCSA.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Blitz</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_BlitzCSA] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_BlitzCSA, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Blitz</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// US6
if (_obj_main_type in IL_Supported_Vehicles_US6) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_US6.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on US6</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_US6] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_US6, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from US6</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMC) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMC.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMC] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMC, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// GMC
if (_obj_main_type in IL_Supported_Vehicles_GMCFOW) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_GMCFOW.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on GMC</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_GMCFOW] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_GMCFOW, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from GMC</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// SdKfz7
if (_obj_main_type in IL_Supported_Vehicles_SdKfz7) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_SdKfz7.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on SdKfz7</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_SdKfz7] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_SdKfz7, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from SdKfz7</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCVP
if (_obj_main_type in IL_Supported_Vehicles_LCVP) then
{
	IL_SDistL_boat = 6; //IL_SDistL
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCVP.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCVP</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCVP] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCVP, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCVP</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// LCM3
if (_obj_main_type in IL_Supported_Vehicles_LCM3) then
{
	IL_SDistL_boat = 10; //IL_SDistL
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_LCM3.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on LCM3</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_LCM3] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_LCM3, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from LCM3</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	//"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
// Liberty Ship
if (_obj_main_type in IL_Supported_Vehicles_Cargo_Ship) then
{
	IL_SDistL_boat = 70; //IL_SDistL
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_Cargo_Ship.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*
	this addAction
	[
		"title",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
		},
		nil,		// arguments
		1.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"true", 	// condition
		50,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
	*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Liberty, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Liberty, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on Cargo Ship</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Liberty] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Liberty, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	"(count(nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Liberty, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from Cargo Ship</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	//"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,(_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
//C47
if (_obj_main_type in IL_Supported_Vehicles_C47) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_C47.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	/*if (_obj_main_type == "C130J") then
	{
		_obj_main addAction [
		"<t color=""#ff0000"">Get out on the side of ramp</t>",
		{
			[_this select 0, _this select 1, false] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' > 0.43) && (_target getVariable 'usable_ramp')"
		];

		_obj_main addAction [
		"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff""> Eject</t>",
		{
			[_this select 0, _this select 1, true] call IL_GetOut;
		},[],IL_Action_LU_Priority,false,true,"",
		"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' > 0.9) && (_target getVariable 'usable_ramp')"
		];
	};*/
	
	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	//"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_NonVeh_C47, 30]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], 30])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	"(count(nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_C47, IL_SDistL_boat]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,6 - (_target getVariable 'load_offset'),0], [], IL_SDistL_boat + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load vehicle on C47</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_C47] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-9,-5.4], IL_Supported_Cargo_Veh_C47, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from C47</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-9,-5.4], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];

	_obj_main addAction [
	"<img image='IgiLoad\images\unload_para.paa' /><t color=""#b200ff"">  Unload cargo with parachute</t>",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<img image='IgiLoad\images\unload_all_para.paa' /><t color=""#a50b00"">  Unload ALL cargo with parachute</t>",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'ramp_bottom' == 1) && (_target animationPhase 'ramp_top' == 1)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading for Co-Pilot</t>",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
/*
	_obj_main addAction [
	"<t color=""#0000ff"">Enable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable usable ramp</t>",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];*/
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};
//	EOF
