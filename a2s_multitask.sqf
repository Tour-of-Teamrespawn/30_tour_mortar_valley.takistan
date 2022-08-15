/*
     a2s_multitask.sqf
        Core script of the MutliTask multiplayer-compatible task system
	 Version: 0.2.1
     URL: http://code.google.com/p/a2script/
     License: Creative Commons Attribution Share Alike (http://creativecommons.org/licenses/by-sa/3.0/)
	 
	 REQUIRES a2s_friendlyerror.sqh (Friendly Error) to be placed in the same directory!
	 
     USAGE:
	    core execVM "a2s_multitask.sqf";
	     * core = Object which MultiTask will save information to. Must never become null. Functions module recommended.
*/

A2S_missionCore = _this;

waitUntil{!isNil "bis_fnc_init"};

#include "a2s_friendlyerror.sqh"
#define var(x) x 

if (isServer) then
{
	A2S_missionCore setVariable ["A2S_taskArray", [], true];
};

A2S_taskCommitLocal =
{
	var(_fncName) = "MultiTask::A2S_taskCommitLocal";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_task"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task = A2S_missionCore getVariable ("A2S_task_" + _taskName);
			if ( (player in (_task select 7)) || ((group player) in (_task select 8)) || ((side player) in (_task select 9)) || (count (_task select 7) == 0 && count (_task select 8) == 0 && count (_task select 9) == 0) ) then
			{
				private "_taskToEdit";
				if (isNil _taskName) then
				{ //Create if does not exist yet
					private "_newTask";
					if (isNil {_task select 1}) then
					{
						_newTask = player createSimpleTask [call (_task select 0)];
					}
					else
					{
						private "_parentTask";
						_parentTask = call compile format ['%1', _task select 1];
						_newTask = player createSimpleTask [call (_task select 0), _parentTask];
					};
					_newTask call compile format ['%1 = _this', _taskName];
					
					_taskToEdit = _newTask;
				}
				else
				{
					_taskToEdit = call compile format ['%1', _taskName];
				};
				
				_taskToEdit setSimpleTaskDescription [call (_task select 2), call (_task select 3), call (_task select 4)];
				
				if (!isNil {_task select 5}) then
				{
					_taskToEdit setSimpleTaskDestination (_task select 5);
				};
				if (!isNil {_task select 6}) then
				{
					_taskToEdit setTaskState (_task select 6);
				};
			}
			else
			{
				if (!isNil _taskName) then
				{
					_taskName call A2S_removeSimpleTaskLocal;
				};
			};
		}
		else
		{
			[format ['ERROR IN %1!|    Task variable "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_taskCommit =
{
	var(_fncName) = "MultiTask::A2S_taskCommit";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private "_taskName";
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			[_taskName,"A2S_taskCommitLocal"] call BIS_fnc_MP;
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_tasksSync =
{
	waitUntil {!isNil {A2S_missionCore getVariable "A2S_taskArray"}};
	_taskArray = A2S_missionCore getVariable "A2S_taskArray";
	
	{
		_x call A2S_taskCommitLocal;
	} forEach _taskArray;
};
A2S_taskExists =
{
	if (["MultiTask::A2S_taskExists", _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private "_taskName";
		_taskName = _this;
		
		(_taskName in (A2S_missionCore getVariable "A2S_taskArray"))
	}
	else
	{
		false
	};
};
A2S_createSimpleTask =
{
	var(_fncName) = "MultiTask::A2S_createSimpleTask";
	
	if ([_fncName, _this, ["STRING", "CODE"], true, false] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_title", "_parent", "_taskArray"];
		_taskName = _this select 0;
		_title = _this select 1;
		
		if (( ((toArray (toLower _taskName)) select 0 ) in ( toArray "abcdefghijklmnopqrstuvwxyz" )) ) then
		{
			_taskArray = A2S_missionCore getVariable "A2S_taskArray";
			if (! (_taskName in _taskArray) ) then
			{
				_taskArray set [count _taskArray, _taskName];
				A2S_missionCore setVariable ["A2S_taskArray", _taskArray, true];
				if (isNil {_this select 2}) then //No parent task
				{
					A2S_missionCore setVariable ["A2S_task_" + _taskName, [_title, nil, {""}, {""}, {""}, nil, "created", [], [], []], true];
				}
				else
				{
					
					if ([_fncName, _this, ["STRING", "CODE", "STRING"]] call A2S_friendlyError_paramsMatch) then
					{
						_parent = _this select 2;
						if (_parent call A2S_taskExists) then
						{
							A2S_missionCore setVariable ["A2S_task_" + _taskName, [_title, _parent, {""}, {""}, {""}, nil, "created", [], [], []], true];
						}
						else
						{
							[format ['ERROR IN %1!|    Cannot create child task "%2" - the parent task "%3" does not exist', _fncName, _taskName, _parent]] call A2S_friendlyError_alert;
						};
					};
				};
			}
			else
			{
				[format ['ERROR IN %1!|    Duplicate task name "%2"', _fncName, _taskName]] call A2S_friendlyError_alert;
			};
		}
		else
		{
			[format ['ERROR IN %1!|    Invalid task name "%2"', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_createTask =
{
	_this call A2S_createSimpleTask;
};
A2S_setSimpleTaskDescription =
{
	var(_fncName) = "MultiTask::A2S_setSimpleTaskDescription";
	if ([_fncName, _this, ["STRING", "CODE", "CODE", "CODE"]] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_desc", "_title", "_caption", "_task"];
		_taskName = _this select 0;
		_desc = _this select 1;
		_title = _this select 2;
		_caption = _this select 3;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_task set [2, _desc];
			_task set [3, _title];
			_task set [4, _caption];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_setTaskDescription =
{
	_this call A2S_setSimpleTaskDescription;
};
A2S_taskDescription =
{
	var(_fncName) = "MultiTask::A2S_taskDescription";
	var(_return) = "";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_task"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ A2S_missionCore getVariable ("A2S_task_" + _taskName);
			
			_return = [_task select 2, _task select 3, _task select 4];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
	
	_return
};
A2S_getSimpleTaskDescription =
{
	(_this call A2S_taskDescription)
};
A2S_getTaskDescription =
{
	(_this call A2S_taskDescription)
};
A2S_setSimpleTaskDestination =
{
	var(_fncName) = "MultiTask::A2S_setSimpleTaskDestination";
	if ([_fncName, _this, ["STRING", ["SCALAR", "SCALAR"]], true, false] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_pos", "_task"];
		_taskName = _this select 0;
		_pos = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_task set [5, _pos];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_setTaskDestination =
{
	_this call A2S_setSimpleTaskDestination;
};
A2S_taskDestination =
{
	var(_fncName) = "MultiTask::A2S_taskDestination";
	var(_return) = [0,0,0];
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private "_taskName";
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_return = ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 5);
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		}
	};
	
	_return
};
A2S_getSimpleTaskDestination =
{
	(_this call A2S_taskDestination)
};
A2S_getTaskDestination =
{
	(_this call A2S_taskDestination)
};
A2S_setTaskState =
{
	var(_fncName) = "MultiTask::A2S_setTaskState";
	if ([_fncName, _this, ["STRING", "STRING"]] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_state", "_task"];
		_taskName = _this select 0;
		_state = _this select 1;
		
		if (toLower _state in ["succeeded", "failed", "canceled", "created", "assigned", "updated"]) then
		{
			if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
			{
				_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
				_task set [6, _state];
				A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
			}
			else
			{
				[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
			};
		}
		else
		{
			[format ['ERROR IN %1!|    Invalid task state "%2"', _fncName, _state]] call A2S_friendlyError_alert;
		};
	};
};
A2S_taskState =
{
	var(_fncName) = "MultiTask::A2S_taskState";
	var(_return) = "canceled";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private "_taskName";
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_return = (toLower ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 6));
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
	
	_return;
};
A2S_getTaskState =
{
	(_this call A2S_taskState)
};
A2S_setTaskUnits =
{
	var(_fncName) = "MultiTask::A2S_setTaskUnits";
	if ([_fncName, _this, ["STRING", []], true, false] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_units", "_task"];
		_taskName = _this select 0;
		_units = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_task set [7, _units];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_addTaskUnit =
{
	var(_fncName) = "MultiTask::A2S_addTaskUnit";
	if ([_fncName, _this, ["STRING", "OBJECT"]] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_unit", "_task", "_units"];
		_taskName = _this select 0;
		_unit = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_units =+ (_task select 7);
			_units set [count _units, _unit];
			_task set [7, _units];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_taskUnits =
{
	var(_fncName) = "MultiTask::A2S_taskUnits";
	var(_return) = [];
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_task"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_return = ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 7);
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
	
	_return
};
A2S_getTaskUnits =
{
	(_this call A2S_taskUnits)
};
A2S_setTaskGroups =
{
	var(_fncName) = "MultiTask::A2S_setTaskGroups";
	if ([_fncName, _this, ["STRING", []], true, false] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_groups", "_task"];
		_taskName = _this select 0;
		_groups = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_task set [8, _groups];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_addTaskGroup =
{
	var(_fncName) = "MultiTask::A2S_addTaskGroup";
	if ([_fncName, _this, ["STRING", "GROUP"]] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_group", "_task", "_groups"];
		_taskName = _this select 0;
		_group = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_groups =+ (_task select 8);
			_groups set [count _groups, _group];
			_task set [8, _groups];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_taskGroups =
{
	var(_fncName) = "MultiTask::A2S_taskGroups";
	var(_return) = [];
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_task"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_return = ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 8);
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_getTaskGroups =
{
	(_this call A2S_taskGroups)
};
A2S_setTaskSides =
{
	var(_fncName) = "MultiTask::A2S_setTaskSides";
	if ([_fncName, _this, ["STRING", []], true, false] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_sides", "_task"];
		_taskName = _this select 0;
		_sides = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_task set [9, _sides];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_addTaskSide =
{
	var(_fncName) = "MultiTask::A2S_addTaskSide";
	if ([_fncName, _this, ["STRING", "SIDE"]] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_side", "_task", "_sides"];
		_taskName = _this select 0;
		_side = _this select 1;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_task =+ (A2S_missionCore getVariable ("A2S_task_" + _taskName));
			_sides =+ (_task select 9);
			_sides set [count _sides, _side];
			_task set [9, _sides];
			A2S_missionCore setVariable ["A2S_task_" + _taskName, _task, true];
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_taskSides =
{
	var(_fncName) = "MultiTask::A2S_taskDestination";
	var(_return) = [];
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_task"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_return = ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 9);
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
	
	_return
};
A2S_getTaskSides =
{
	(_this call A2S_taskSides)
};
A2S_removeSimpleTaskLocal =
{
	var(_fncName) = "MultiTask::A2S_removeSimpleTaskLocal";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_msg"];
		_taskName = _this;
		
		if (!isNil _taskName) then
		{
			call compile format ['
				player removeSimpleTask %1;
				%1 = nil;
			', _taskName];
		}
		else
		{
			[format ['ERROR IN %1!|    Task variable "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_removeTaskLocal =
{
	_this call A2S_removeSimpleTaskLocal;
};
A2S_removeSimpleTask =
{
	var(_fncName) = "MultiTask::A2S_removeSimpleTask";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_taskArray"];
		_taskName = _this;
		
		if (!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)}) then
		{
			_taskArray =+ (A2S_missionCore getVariable "A2S_taskArray");
			_taskArray = _taskArray - [_taskName];
			A2S_missionCore setVariable ["A2S_taskArray", _taskArray, true];
			
			A2S_missionCore setVariable ["A2S_task_" + _taskName, nil];
			[_taskName,"A2S_removeSimpleTaskLocal"] call BIS_fnc_MP;
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
A2S_removeTask =
{
	_this call A2S_removeSimpleTask;
};
A2S_taskHintLocal =
{

	var(_fncName) = "MultiTask::A2S_taskHintLocal";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		if (!isDedicated) then
		{
			private ["_taskName", "_params"];
			_taskName = _this;
			
			if ((!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)})&&(toLower (_taskName call A2S_getTaskState) in ["succeeded","failed","canceled","created","assigned","updated"])) then
			{
				if (!isNil _taskName) then
				{
					[("task" + (_taskName call A2S_getTaskState)),["",(call ((A2S_missionCore getVariable ("A2S_task_" + _taskName)) select 3))]] call BIS_fnc_showNotification;
				};
			}
			else
			{
				[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
			};
		};
	};
};
A2S_taskHint =
{
	var(_fncName) = "MultiTask::A2S_taskHint";
	if ([_fncName, _this, "STRING"] call A2S_friendlyError_paramsMatch) then
	{
		private ["_taskName", "_msg"];
		_taskName = _this;
		
		if ((!isNil {A2S_missionCore getVariable ("A2S_task_" + _taskName)})&&(toLower (_taskName call A2S_getTaskState) in ["succeeded","failed","canceled","created","assigned","updated"])) then
		{
			[_taskName,"A2S_taskHintLocal"] call BIS_fnc_MP;
		}
		else
		{
			[format ['ERROR IN %1!|    Task "%2" does not exist', _fncName, _taskName]] call A2S_friendlyError_alert;
		};
	};
};
