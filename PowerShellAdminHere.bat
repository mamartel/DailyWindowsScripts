@echo off

REM Usage: PowerShellHere [directory]
REM
REM Options:
REM     directory - Initial directory. Uses current working directory if not specified.
REM

if ["%~1"]==[""] (
    SET HERE=%CD%
) else (
    REM Allows users to not quote paths with spaces.
    SET HERE=%*
)

REM Faster than using `PowerShell -Command Start-Process -Verb RunAs Powershell...`
mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute(""PowerShell"", ""-NoExit -Command Set-Location '%HERE%' "", """", ""runas"", 1)(window.close)")
