_side = _this;
_sid = "";

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

//Defense Guns for Towns
_classes_town = [];
_categories_town = [];

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW >= 0) then {
		//_classes_town pushBack 		format["%1LIB_GER_SearchLight", _sid];
		//_categories_town pushBack 	"View";
			
		_classes_town pushBack 		format["%1LIB_MG34_Lafette_Deployed", _sid];
		_categories_town pushBack 	"MG";
			
		//_classes_town pushBack 		format["%1LIB_MG34_Lafette_low_Deployed", _sid];
		//_categories_town pushBack 	"Defense";
			
		_classes_town pushBack 		format["%1LIB_GrWr34", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1LIB_GrWr34_g", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_FlaK_30", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1LIB_leFH18", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1LIB_leFH18_AT", _sid];
		_categories_town pushBack 	"AT";
		
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_classes_town pushBack 		format["%1LIB_FlaK_30_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_AA_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Flakvierling_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Pak40_w", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_AA", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_ARTY", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_Pak40", _sid];
			_categories_town pushBack 	"AT";
		};
		
		_classes_town pushBack 		format["%1LIB_MG42_Lafette_Deployed", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_MG42_Lafette_low_Deployed", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_FlaK_36", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1LIB_FlaK_36_AA", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1LIB_FlaK_38", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1LIB_Nebelwerfer41", _sid];
		_categories_town pushBack 	"Artillery";
			
		_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Camo", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Gelbbraun", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1LIB_Flakvierling_38", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1LIB_Pak40", _sid];
		_categories_town pushBack 	"AT";
	};
	if(CTI_FOW_ADDON > 0) then {
		_classes_town pushBack 		format["%1fow_w_mg42_deployed_ger_heer", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_pak40_gray_ger_heer", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"AA";
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_mg42_deployed_high_ger_heer
		fow_w_mg42_deployed_s_ger_heer
		fow_w_mg42_deployed_middle_ger_heer
		fow_w_pak40_camo_foliage_ger_heer
		fow_w_pak40_camo_ger_heer
		fow_w_pak40_yellow_ger_heer
		fow_w_flak36_camo_ger_heer
		fow_w_flak36_green_ger_heer
		fow_w_flak36_tan_ger_heer*/
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//if(CTI_IFA3_NEW >= 0) then {
	//};
	if(CTI_FOW_ADDON > 0) then {
		_classes_town pushBack 		format["%1fow_w_type92_tripod_ija", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_type97_mortar_ija", _sid];
		_categories_town pushBack 	"Mortar";
	
		_classes_town pushBack 		format["%1fow_w_6Pounder_ija", _sid];
		_categories_town pushBack 	"AT";
		
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_type92_tripod_high_ija
		fow_w_type92_tripod_low_s_ija
		fow_w_type92_tripod_low_ija
		fow_w_type92_tripod_middle_ija
		fow_w_type97_mortar_adv_ija*/
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW >= 0) then {
		_classes_town pushBack 		format["%1LIB_SU_SearchLight", _sid];
		_categories_town pushBack 	"View";
		if(CTI_IFA3_NEW == 1) then {
			_classes_town pushBack 		format["%1LIB_Maxim_M30_Deployed", _sid];
			_categories_town pushBack 	"MG";
		} else {
			_classes_town pushBack 		format["%1LIB_Maxim_M30_base", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_Maxim_M30_Trench", _sid];
			_categories_town pushBack 	"MG";
			
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				_classes_town pushBack 		format["%1LIB_Zis3_w", _sid];
				_categories_town pushBack 	"AT";
			};
			_classes_town pushBack 		format["%1LIB_Zis3", _sid];
			_categories_town pushBack 	"AT";
		};
		
		_classes_town pushBack 		format["%1LIB_BM37", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};	
	//if(CTI_FOW_ADDON > 0) then {
	//};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW >= 0) then {
		_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
		
		if(CTI_IFA3_NEW == 1) then {
			_classes_town pushBack 		format["%1LIB_57mm_M1", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1LIB_M45_Quadmount", _sid];
			_categories_town pushBack 	"AA";
		} else {
			_classes_town pushBack 		format["%1LIB_Zis3", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1LIB_61k", _sid];
			_categories_town pushBack 	"AA";
		};
	};
	if(CTI_FOW_ADDON > 0) then {
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_6Pounder_uk", _sid];
		_categories_town pushBack 	"AT";
		//no matching classes found		
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1fow_w_6Pounder_uk", _sid];
		_categories_town pushBack 	"Artillery";
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA3_NEW >= 0) then {	
		if(CTI_IFA3_NEW == 1) then {
			_classes_town pushBack 		format["%1LIB_Vickers_MMG", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_QF6_pdr", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1LIB_M45_Quadmount_UK", _sid];
			_categories_town pushBack 	"AA";
		} else {
			_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
			_categories_town pushBack 	"MG";
				
			_classes_town pushBack 		format["%1LIB_Zis3", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1LIB_61k", _sid];
			_categories_town pushBack 	"AA";
		};
		
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
	};
	if(CTI_FOW_ADDON > 0) then {
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m37", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m41", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_m2_mortar_usa", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1fow_w_6Pounder_usa", _sid];
		_categories_town pushBack 	"AT";
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m41", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_m2_mortar_usa", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_m1919a6_deployed_high_usa_m41
		fow_w_m1919a6_deployed_high_usa_m37
		fow_w_m1919a6_deployed_usa_m37
		fow_w_m1919a6_deployed_usa_m41
		fow_w_m1919a6_deployed_middle_usa_m37
		fow_w_m1919a6_deployed_middle_usa_m41
		fow_w_m1919_tripod_usa_mm
		fow_w_m1919_tripod_usa_p
		fow_w_m1919a6_deployed_high_usa_p
		fow_w_m1919a6_deployed_high_usa_mm
		fow_w_m1919a6_deployed_usa_mm
		fow_w_m1919a6_deployed_usa_p
		fow_w_m1919a6_deployed_middle_usa_mm
		fow_w_m1919a6_deployed_middle_usa_p
		fow_w_m1919_tripod_usmc_camo01
		fow_w_m1919_tripod_usmc_camo02
		fow_w_m1919_tripod_usmc
		fow_w_m1919a6_deployed_high_usmc
		fow_w_m1919a6_deployed_high_usmc_camo01
		fow_w_m1919a6_deployed_high_usmc_camo02
		fow_w_m1919a6_deployed_usmc
		fow_w_m1919a6_deployed_usmc_camo02
		fow_w_m1919a6_deployed_usmc_camo01
		fow_w_m1919a6_deployed_middle_usmc_camo01
		fow_w_m1919a6_deployed_middle_usmc_camo02
		fow_w_m1919a6_deployed_middle_usmc
		fow_w_m2_mortar_adv_usa
		fow_w_m2_mortar_usmc
		fow_w_m2_mortar_adv_usmc
		fow_w_6Pounder_usmc*/
	};
};


//--- Defenses management for towns.
if (isServer) then {[_side, _classes_town, _categories_town] Call Compile preprocessFileLineNumbers "Common\Config\Config_Defenses_Towns.sqf"};