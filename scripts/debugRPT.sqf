/* Creates an entry in the server and client RPT file with the mission name in place of the %1.
Makes it easier to debug when you know what mission created the error. */
diag_log text "";
diag_log text "==========================================================================";
diag_log text format["|============================= %1 =============================|", missionName];
diag_log text "==========================================================================";
diag_log text "";