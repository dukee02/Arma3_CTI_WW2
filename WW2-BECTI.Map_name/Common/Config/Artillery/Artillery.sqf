_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

_sid = [];
if(CTI_VIO_ADDON == 0) then {
	_sid = [""];
} else {
	_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];
};

{
	_c pushBack format["%1LIB_GrWr34", _x];
	_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
	
	_c pushBack format["%1LIB_GrWr34_g", _x];
	_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];

	_c pushBack format["%1LIB_BM37", _x];
	_m pushBack ["LIB_8Rnd_82mmHE_BM37","ARTY_LIB_8Rnd_82mmHE_BM37","LIB_1rnd_82mmHE_BM37","LIB_82mm_BM37_SmokeShell"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[240,1580], [360,2400], [480,3200], [480,3200]];

	_c pushBack format["%1LIB_M2_60", _x];
	_m pushBack ["LIB_8Rnd_60mmHE_M2","ARTY_LIB_8Rnd_60mmHE_M2","LIB_1rnd_60mmHE_M2","LIB_60mm_M2_SmokeShell"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[150,900], [230,1400], [310,1900], [310,1900]];


	_c pushBack format["%1LIB_Nebelwerfer41", _x];
	_m pushBack ["LIB_6Rnd_NbW41"];
	_b pushBack [1, 2, 4, 6];
	_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
	
	_c pushBack format["%1LIB_Nebelwerfer41_Camo", _x];
	_m pushBack ["LIB_6Rnd_NbW41"];
	_b pushBack [1, 2, 4, 6];
	_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
	
	_c pushBack format["%1LIB_Nebelwerfer41_Gelbbraun", _x];
	_m pushBack ["LIB_6Rnd_NbW41"];
	_b pushBack [1, 2, 4, 6];
	_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
	

	_c pushBack format["%1LIB_leFH18", _x];
	_m pushBack ["LIB_20x_Shell_105L28_Gr38_HE","LIB_20x_Shell_105L28_Gr39HlC_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[390,2200], [880,5000], [1840,10500], [1840,10500]];


	_c pushBack format["%1LIB_FlaK_36_ARTY", _x];
	_m pushBack ["LIB_SprGr_KwK36_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];
	
	_c pushBack format["%1LIB_FlaK_36_ARTY_w", _x];
	_m pushBack ["LIB_SprGr_KwK36_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];
	
	_c pushBack format["%1LIB_DAK_FlaK_36_ARTY", _x];
	_m pushBack ["LIB_SprGr_KwK36_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];


	_c pushBack format["%1LIB_US6_BM13", _x];
	_m pushBack ["LIB_16Rnd_BM13"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[950,1800], [1480,2900], [2130,4200], [2130,4200]];
	

	_c pushBack format["%1LIB_SdKfz124", _x];
	_m pushBack ["LIB_20x_Shell_105L28_Gr38_HE","LIB_20x_Shell_105L28_Gr39HlC_HE"];
	_b pushBack [1, 2, 4, 6, 8, 10];
	_r pushBack [[390,2200], [880,5000], [1840,10550], [1840,10550]];

	if(CTI_IFA3_NEW > 0) then {
		_c pushBack format["%1LIB_SdKfz251_2", _x];
		_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
		
		_c pushBack format["%1LIB_SdKfz251_2_w", _x];
		_m pushBack ["LIB_8Rnd_81mmHE_GRWR34"];
		_b pushBack [1, 2, 4];
		_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
	};
} forEach _sid;




[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";