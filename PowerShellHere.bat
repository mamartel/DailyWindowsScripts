@echo off

REM Usage: PowerShellAdminHere [directory]
REM
REM Options:
REM     directory - Initial directory. Uses current working directory if unspecified.
REM

if ["%~1"]==[""] (
    SET HERE=%CD%
) else (
    REM Using `%*` merges all user-supplied arguments, allowing unquoted 
    REM paths containing spaces.
    SET HERE=%*
)

REM Using `start PowerShell...`  doesn't load console settings specific to PowerShell.exe (blue background, white text, font)
mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute(""PowerShell"", ""-NoExit -Command Set-Location '%HERE%' "", """", """", 1)(window.close)")
