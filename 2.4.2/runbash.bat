@echo off

call :dos2linux arg2 "%~2"
call :dos2linux arg3 "%~3"
call :dos2linux arg4 "%~4"
call :dos2linux arg5 "%~5"
call :dos2linux arg6 "%~6"
call :dos2linux arg7 "%~7"
call :dos2linux arg8 "%~8"
call :dos2linux arg9 "%~9"

set "BASHCMD="%~1\bin\bash.exe""
set "BASHCMD=%BASHCMD:\\=\%"
if NOT exist %BASHCMD% goto :findgit
:gotgit
%BASHCMD% -c "%arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8% %arg9%"
goto :EOF

:findgit
REM Try and find Git Install
set "GITPATH="
if exist "C:\Program Files\Git"       (set "GITPATH="C:\Program Files\Git"" & goto :foundgit)
if exist "C:\Program Files (x86)\Git" (set "GITPATH="C:\Program Files (x86)\Git"" & goto :foundgit)
if exist "D:\Program Files\Git"       (set "GITPATH="D:\Program Files\Git"" & goto :foundgit)
if exist "D:\Program Files (x86)\Git" (set "GITPATH="D:\Program Files (x86)\Git"" & goto :foundgit)
:nogit
echo.
echo *** A path to Git install was not found. Please install Git."
echo *** And add "custom.git.path.windows={path to git install}" to your
echo *** platform.local.txt file.
echo.
goto :EOF

:foundgit
for %%f in ( %GITPATH% ) do set "BASHCMD="%%~f\bin\bash.exe""
if NOT exist %BASHCMD% goto :nogit
for %%f in ( %GITPATH% ) do set "ZZZMSG="custom.git.path.windows=%%~f""
echo.
echo *** Add %ZZZMSG% to your platform.local.txt file.
echo.
set "ZZZMSG="
goto :gotgit

:dos2linux
set "zzztmp="%~2""
set "zzztmp=%zzztmp:\=/%"
set "zzztmp=%zzztmp://=/%"
set "zzztmp=%zzztmp: =\ %"
set "zzztmp=%zzztmp:C:/=/c/%"
set "zzztmp=%zzztmp:D:/=/d/%"
for %%f in ( %zzztmp% ) do set "%~1=\"%%~f\""
set "zzztmp="
goto :EOF

REM This script prepares a list of file path arguments for passing to and
REM running a bash script.
REM   ARG1 is the path to the bash.exe Program.
REM   ARG2 is the bash script to run.
REM   ARG3 through ARG9 are passed to the bash shell script as arg1 - arg7.
REM
REM Git must be installed for this script to be successful.
REM
REM Fix back slash in file paths for Linux tools.
REM Cleanup double slashes
REM Back slash spaces, so quotes are not needed.
REM Fix-up Drive path, (C: etc.) for bash shell. Only handles drives C: and D:
REM Finally, enshrine arg value in \" \" just in case.
REM If bash.exe not found via arg1, check for it in popular locations.
REM Only handles passing 7 arguments to bash script.
REM
REM CAVEATS:
REM   Parentheses in argument strings often, but not always, break DOS
REM   batch files. More contortions may be need. I don't know if there will be
REM   a problem with this simple case.
REM
REM   It is assumed that paths are at least one directory deep. This pertains
REM   to the ambiguity of having just a C: or D: as a path.
