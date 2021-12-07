@echo off 

REM 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM 
if '%errorlevel%' NEQ '0' (
    echo "Please start the batch as admin (rightclick start as admin)"
    timeout /T 10  > nul
    goto End
) else ( goto isAdmin )


:isAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

if exist newlib.dll ( 
del lib.dll
MOVE /Y newlib.dll lib.dll
) 

start rundll32 lib.dll,main 



:End