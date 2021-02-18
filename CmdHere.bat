@echo off

REM Opens a new command window.
REM
REM Usage: CmdHere [directory]
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

start cmd /k pushd "%here%\"
