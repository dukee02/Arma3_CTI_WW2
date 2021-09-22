/*
  # HEADER #
	Script: 		Common\Functions\Common_WaitDelay.sqf
	Alias:			CTI_CO_FNC_WaitDelay
	Description:	waits an random time
	Author: 		dukee
	Creation Date:	21-09-2021
	
  # PARAMETERS #
    non
	
  # RETURNED VALUE #
	true if its finished
	
  # SYNTAX #
	call CTI_CO_FNC_WaitDelay
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
	_waitdelay = [] execVM "Common\Functions\Common_WaitDelay.sqf";
	waitUntil { scriptDone _waitdelay }
*/

_delay = round(CTI_TOWNS_SPAWNDELAY_MIN + random CTI_TOWNS_SPAWNDELAY_MAX);
if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\functions\WaitDelay.sqf", format["spawn delay: <%1> ", _delay]] call CTI_CO_FNC_Log; };
sleep _delay;
