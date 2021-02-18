@echo off

REM Opens a new command window as administrator.
REM
REM Usage: CmdAdminHere [directory]
REM
REM Options:
REM     directory - Initial directory. Uses current working directory if unspecfied.
REM

if ["%~1"]==[""] (
    SET HERE=%CD%
) else (
    REM Allows users to not quote paths with spaces.
    SET HERE=%*
)

mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute(""cmd"", ""/s /k pushd """"%HERE%\"""" "", """", ""runas"", 1)(window.close)")
