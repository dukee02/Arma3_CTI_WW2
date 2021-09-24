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
	waitUntil { scriptDone _waitdelay };
*/
private _delay = 20;

if (canSuspend) then {
	//_delay = round(CTI_TOWNS_SPAWNDELAY_MIN + random CTI_TOWNS_SPAWNDELAY_MAX);
	if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\functions\WaitDelay.sqf", format["spawn delay: <%1> ", _delay]] call CTI_CO_FNC_Log; };
	sleep _delay;
}else {
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\WaitDelay.sqf", format["spawn delay executed: <%1> ", false]] call CTI_CO_FNC_Log; };
};

/*
_delay = round(CTI_TOWNS_SPAWNDELAY_MIN + random CTI_TOWNS_SPAWNDELAY_MAX);
if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\functions\WaitDelay.sqf", format["spawn delay: <%1> ", _delay]] call CTI_CO_FNC_Log; };
sleep _delay;
*/

/*
waitUntil {
	// Wait 5 minutes
	_until = diag_tickTime + 5 * 60;
	waitUntil {sleep 1; diag_tickTime > _until;};

	if(_condition) then {
		call myAmmoBoxSpawnScript; // Or execVM or spawn or even entire ammo box spawn code here
	};

	false; // Loop waitUntil forever
};
*/


/*
mysleep = 
{
	if (!canSuspend) exitWith {_this spawn mysleep};
	sleep _this;
	hint ("slept " + str _this);
};

5 call mysleep;
*/