_side = _this;
_sid = "";
_level = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];
/*
//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["ArmoredMBT", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 
*/
//Infantry setup for the AI groups
/*units_infantry = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	units_to_add = [format["%1LIB_UK_Rifleman", _sid], 1, 60];
	units_to_add pushBack [format["%1LIB_UK_Medic", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_UK_Rifleman_w", _sid], 1, 60];	
		units_to_add pushBack [format["%1LIB_UK_Medic_w", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_Rifleman", _sid], 1, 60];	
		units_to_add pushBack [format["%1LIB_UK_DR_Medic", _sid], 1, 20];
	};
	units_infantry pushBack units_to_add;
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
/*units_wheeled = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_to_add = [format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20];		
	};
	units_wheeled pushBack units_to_add;
};


_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
*/
//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
units_to_add = [];

//if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
//};
//if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
//};
if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
	if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_BT_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			units_to_add = [[format["%1SOV_BT_BT7A", _sid], 1, 40]];
			units_to_add pushBack [format["%1SOV_BT_BT7_M1937", _sid], 1, 40];
			units_to_add pushBack [format["%1SOV_BT_BT7TU_M1937", _sid], 1, 40];
			
			units_tracked pushBack units_to_add;
		};
	};
};
//if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
//};

if(count units_tracked > 0) then {
	_v pushBack "ArmoredMBT";
	_t pushBack "Tanks";
	_p pushBack units_tracked;
	_f pushBack CTI_HEAVY;
	_m pushBack 500;
	_c pushBack "Armored";
	_s pushBack [];
};

//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
/*units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_antiair = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_antiair = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 30]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_antiair = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 30]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_antiair = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 30]];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_antiair pushBack [format["%1LIB_UK_M16_Halftrack", _sid], 1, 50];
	};
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
units_to_add = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add = [[format["%1sab_gladiator", _sid], 1, 40]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_ca12bo", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_mb5", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_meteor", _sid], 1, 40];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_hurricane", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_hurricane_trop", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_hurricane_2", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_dh98", _sid], 1, 20];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_halifax", _sid], 1, 20];
			};
		};
	};
	units_air append units_to_add;
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add = [[format["%1sab_p26", _sid], 1, 30]];
			units_to_add pushBack [format["%1sab_ryanpt", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_texan", _sid], 1, 30];
			units_to_add pushBack [format["%1sab_dauntless", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_avenger", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_p38", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_corsair", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_mustang", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_p51b", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_a26", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_b25", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_tigercat", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_f6f", _sid], 1, 30];
			units_to_add pushBack [format["%1sab_b24", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_p61", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_b17", _sid], 1, 20];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_f4f", _sid], 1, 30];
			units_to_add pushBack [format["%1sab_fl_sbd", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_f4u", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_p51d", _sid], 1, 30];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_tbf", _sid], 1, 30];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_p40", _sid], 1, 30];
				units_to_add pushBack [format["%1sab_sw_p38", _sid], 1, 30];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_a26", _sid], 1, 20];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_b17", _sid], 1, 10];
			};
		};
	};
	units_air append units_to_add;
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add = [[format["%1sab_i16", _sid], 1, 30]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_la5", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_la5_2", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_p39", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_tusb2", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_il2", _sid], 1, 30];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_yak3", _sid], 1, 40];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_i16", _sid], 1, 40];
			};
		
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_il2", _sid], 1, 30];
				units_to_add pushBack [format["%1sab_sw_il2_2", _sid], 1, 30];
			};
		};
	};
	units_air append units_to_add;
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add = [[format["%1sab_avia", _sid], 1, 40]];
			units_to_add pushBack [format["%1sab_bu131", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_avia_2", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_w34", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_w34f", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_bf109", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_ju87", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_bf110", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_bf110_2", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_ju88", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_ju88_2", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fw190", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_fw190_2", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_he111", _sid], 1, 20];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_bv141", _sid], 1, 10];
			units_to_add pushBack [format["%1sab_do335", _sid], 1, 10];
			units_to_add pushBack [format["%1sab_ta152c", _sid], 1, 10];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_he162", _sid], 1, 10];
			units_to_add pushBack [format["%1sab_hix", _sid], 1, 10];
			units_to_add pushBack [format["%1sab_me262", _sid], 1, 20];
			units_to_add pushBack [format["%1sab_me262_2", _sid], 1, 20];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_bf109e", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_bf109f", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_fl_ju88a", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_bf109g", _sid], 1, 40];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_bf109k", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_fl_fw190a", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_he162", _sid], 1, 30];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_bf110", _sid], 1, 20];
				units_to_add pushBack [format["%1sab_sw_bf110_2", _sid], 1, 20];
				units_to_add pushBack [format["%1sab_sw_ju87", _sid], 1, 20];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_ju87_2", _sid], 1, 20];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_do335", _sid], 1, 10];
				units_to_add pushBack [format["%1sab_sw_he177", _sid], 1, 10];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				units_to_add pushBack [format["%1sab_sw_ar234", _sid], 1, 10];
			};
		};
	};
	units_air append units_to_add;
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add = [[format["%1sab_m6a", _sid], 1, 30]];
			units_to_add pushBack [format["%1sab_m6av2", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_a5m", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_aichival", _sid], 1, 30];
			units_to_add pushBack [format["%1sab_kate", _sid], 1, 30];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_ki61", _sid], 1, 40];
			units_to_add pushBack [format["%1sab_zero", _sid], 1, 60];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_ki100", _sid], 1, 20];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
			
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			units_to_add pushBack [format["%1sab_fl_a6m", _sid], 1, 60];
		};
	};
	units_air append units_to_add;
};

if(count units_air > 0) then {
	_v pushBack "Air";
	_t pushBack "Air";
	_p pushBack units_air;
	_f pushBack CTI_AIR;
	_m pushBack 1000;
	_c pushBack "Air";
	_s pushBack [];
};


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_small_mods.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
