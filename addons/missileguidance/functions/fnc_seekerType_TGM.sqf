#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Seeker Type: TGM (Television Guidance)
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_TGM;
 *
 * Public: No
 */

params ["", "_args"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams"];
_firedEH params ["", "", "", "", "", "", "_projectile"];
_launchParams params ["", "_targetParams"];
_targetParams params ["_target"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];

// Move camera with projectile
GVAR(tgmCamera) setPos (getPos _projectile);
GVAR(tgmCamera) setVectorDirAndUp [vectorDir _projectile, vectorUp _projectile];

private _steerVector = vectorNormalized [GVAR(tgmInput) select 0, 1, GVAR(tgmInput) select 1];

(getPosASL _projectile) vectorAdd (_projectile vectorModelToWorld _steerVector)
