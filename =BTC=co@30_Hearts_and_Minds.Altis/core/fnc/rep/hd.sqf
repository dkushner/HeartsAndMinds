
private ["_unit","_part","_dam","_injurer","_ammo"];

_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;
_ammo = _this select 4;

if ((_part == "body") || (_part in ["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","palivo","engine","glass1","glass2","glass3","glass4","karoserie","palivo","fuel_hitpoint","engine_hitpoint","body_hitpoint"])) then {
	if (isPlayer _injurer && {_dam > 0.3}) then	{
		systemChat str([_part,_dam]);
		btc_rep_malus_civ_hd call btc_fnc_rep_change;
		if (btc_global_reputation < 600) then {[getpos _unit] spawn btc_fnc_rep_eh_effects;};
		if (btc_debug_log) then {diag_log format ["REP HD = GREP %1 THIS = %2",btc_global_reputation,_this];};
	};
};

_dam