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
    REM Using `%*` merges all user-supplied arguments, allowing unquoted 
    REM paths containing spaces.
    SET HERE=%*
)

REM `mshta` is faster than `PowerShell Start-Process -Verb RunAs ...` albeit way uglier.
mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute(""cmd"", ""/s /k pushd """"%HERE%\"""" "", """", ""runas"", 1)(window.close)")
