_trg1 = createTrigger["EmptyDetector",getMarkerPos "TOUR_mkrSector_1", false];
_trg1 setTriggerArea[200,250,293.9,true];
_trg1 setTriggerActivation["ANY","PRESENT",false];
_trg1 setTriggerStatements["({(side _x == WEST)&&(alive _x)}count thisList > 0) && ({(side _x == EAST)&&(alive _x)}count thisList < 3)&& ({(_x inArea ""TOUR_mkrSector_1"")&&((damage _x) < 0.7)}count TOUR_mortars == 0)", "_s = 1 execVM 'scripts\control\sectorSecure.sqf';", ""];

_trg2 = createTrigger["EmptyDetector",getMarkerPos "TOUR_mkrSector_2", false]; 
_trg2 setTriggerArea[200,250,293.9,true];
_trg2 setTriggerActivation["ANY","PRESENT",false];
_trg2 setTriggerStatements["({(side _x == WEST)&&(alive _x)}count thisList > 0) && ({(side _x == EAST)&&(alive _x)}count thisList < 3)&& ({(_x inArea ""TOUR_mkrSector_2"")&&((damage _x) < 0.7)}count TOUR_mortars == 0)", "_s = 2 execVM 'scripts\control\sectorSecure.sqf';", ""];

_trg3 = createTrigger["EmptyDetector",getMarkerPos "TOUR_mkrSector_3", false]; 
_trg3 setTriggerArea[200,250,293.9,true];
_trg3 setTriggerActivation["ANY","PRESENT",false];
_trg3 setTriggerStatements["({(side _x == WEST)&&(alive _x)}count thisList > 0) && ({(side _x == EAST)&&(alive _x)}count thisList < 3)&& ({(_x inArea ""TOUR_mkrSector_3"")&&((damage _x) < 0.7)}count TOUR_mortars == 0)", "_s = 3 execVM 'scripts\control\sectorSecure.sqf';", ""];

_trg4 = createTrigger["EmptyDetector",getMarkerPos "TOUR_mkrSector_4", false]; 
_trg4 setTriggerArea[200,250,293.9,true];
_trg4 setTriggerActivation["ANY","PRESENT",false];
_trg4 setTriggerStatements["({(side _x == WEST)&&(alive _x)}count thisList > 0) && ({(side _x == EAST)&&(alive _x)}count thisList < 3)&& ({(_x inArea ""TOUR_mkrSector_4"")&&((damage _x) < 0.7)}count TOUR_mortars == 0)", "_s = 4 execVM 'scripts\control\sectorSecure.sqf';", ""];

_trg5 = createTrigger["EmptyDetector",getMarkerPos "TOUR_mkrSector_5", false]; 
_trg5 setTriggerArea[200,250,293.9,true];
_trg5 setTriggerActivation["ANY","PRESENT",false];
_trg5 setTriggerStatements["({(side _x == WEST)&&(alive _x)}count thisList > 0) && ({(side _x == EAST)&&(alive _x)}count thisList < 3)&& ({(_x inArea ""TOUR_mkrSector_5"")&&((damage _x) < 0.7)}count TOUR_mortars == 0)", "_s = 5 execVM 'scripts\control\sectorSecure.sqf';", ""];
