@echo off

REM Usage: PowerShellAdminHere [directory]
REM
REM Options:
REM     directory - Initial directory. Uses current working directory if unspecified.
REM

if ["%~1"]==[""] (
    SET HERE=%CD%
) else (
    REM Allows users to not quote paths with spaces.
    SET HERE=%*
)

REM Using `start PowerShell...`  doesn't load console settings specific to PowerShell.exe (blue background, white text, font)
mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute(""PowerShell"", ""-NoExit -Command Set-Location '%HERE%' "", """", """", 1)(window.close)")
