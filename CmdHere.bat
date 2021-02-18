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
    REM Allows users to not quote paths with spaces.
    SET HERE=%*
)

REM Must end with `\`. There can be multiple.
start cmd /k pushd "%here%\"
