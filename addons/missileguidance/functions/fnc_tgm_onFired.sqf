#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Seeker Type: TGM (Television Guidance)
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_SALH;
 *
 * Public: No
 */

params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

// Create empty display
private _tgmDisplay = (uiNamespace getVariable "RscDisplayMission") createDisplay "RscDisplayEmpty";
uiNamespace setVariable [QGVAR(tgmDisplay), _tgmDisplay];

// Save current HUD state
private _hudState = shownHUD;
private _oldHudState = +_hudState;
// Hide cursor
_hudState set [6, false];
showHUD _hudState;

// Create camera
GVAR(tgmCamera) = "camera" camCreate (position _projectile);
GVAR(tgmcamera) setVectorDirAndUp [vectorDir _projectile, vectorUp _projectile];
GVAR(tgmCamera) cameraEffect ["EXTERNAL", "BACK"];
GVAR(tgmCamera) camCommit 0;

// EH for mouse input
_tgmDisplay displayAddEventHandler ["MouseMoving", {
    params ["_display", "_xPos", "_yPos"];
    GVAR(tgmInput) = [_xPos, _yPos];
    setMousePosition [0.5,0.5];
}];

// Wait until projectile disappears or display terminates
[{isNull (_this select 0) || {isNull (uiNamespace getVariable [QGVAR(tgmDisplay), nil])}}, {
    showHUD (_this select 1);
    private _tgmDisplay = uiNamespace getVariable [QGVAR(tgmDisplay), nil];
    if (!isNil "_tgmDisplay") then {
        _tgmDisplay closeDisplay 1;
    };
    if (!isNil QGVAR(tgmCamera)) then {
        GVAR(tgmCamera) setPos (ASLToAGL eyePos player vectorAdd (eyeDirection player vectorMultiply 0.1));
        GVAR(tgmCamera) cameraEffect ["TERMINATE", "BACK"];
        camDestroy GVAR(tgmCamera);
    };
    GVAR(tgmCamera) = nil;
    uiNamespace setVariable [QGVAR(tgmDisplay), nil];
}, [_projectile, _oldHudState]] call CBA_fnc_waitUntilAndExecute;
