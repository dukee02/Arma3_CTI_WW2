private ["_side","_texture"];
_side = _this;



switch (missionNamespace getVariable format["CTI_%1FLAG", _side]) do {
//switch (format["CTI_%1FLAG", _side]) do {
	case 1: {
		_texture = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";
	};
	case 2: {
		_texture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
	};
	case 3: {
		_texture = "\WW2\Core_t\IF_Decals_t\US\flag_USA_co.paa";
	};
	case 4: {
		_texture = "\A3\Data_F\Flags\Flag_uk_CO.paa";
	};
	case 5: {
		_texture = "\fow\fow_main\flags\flag_germany_co.paa";
	};
	case 6: {
		_texture = "\fow\fow_main\flags\flag_USA_co.paa";
	};
	case 7: {
		_texture = "\fow\fow_main\flags\flag_Japan02_co.paa";
	};
	case 8: {
		_texture = "\fow\fow_main\flags\flag_Japan01_co.paa";
	};
	case 9: {
		_texture = "\fow\fow_main\flags\flag_Australia_co.paa";
	};
	case 10: {
		_texture = "\fow\fow_main\flags\flag_canada_co.paa";
	};
	case 11: {
		_texture = "\fow\fow_main\flags\flag_New_Zealand_co.paa";
	};
	case 12: {
		_texture = "\fow\fow_main\flags\flag_horizon_islands_colonial_co.paa";
	};
	case 13: {
		_texture = "\fow\fow_main\flags\flag_netherlands_co.paa";
	};
	/*case 5: {
		_texture = "";
	};*/
	default {
		if(_side == "WEST_") then {
			_texture = "\A3\Data_F\Flags\Flag_blue_CO.paa";
		} 
		else {
			if(_side == "EAST_") then {
				_texture = "\A3\Data_F\Flags\Flag_red_CO.paa";
			} 
			else {
				_texture = "\A3\Data_F\Flags\Flag_green_CO.paa";
			};
		};
	};
};
	
if(_side == "WEST_") then {
	missionNamespace setVariable ["CTI_WESTFLAG", _texture];
} else {
	if(_side == "EAST_") then {
		missionNamespace setVariable ["CTI_EASTFLAG", _texture];
	} 
	else {
		missionNamespace setVariable ["CTI_GUERFLAG", _texture];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SetTownFlag.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", missionNamespace getVariable format["CTI_%1FLAG", _side], _texture]] call CTI_CO_FNC_Log;
};