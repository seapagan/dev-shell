@echo off
rem *********************************************************************************
rem * dev-shell Bootstrap v0.1                                                      *
rem *                                                                               *
rem * This command script will bootstrap the checked out git source into a complete *
rem * development system for MinGW / MSYS.                                          *
rem *                                                                               *
rem * Usage : double-click or run from the command line, runs fully automatically.  *
rem *********************************************************************************

rem note that there is limited error checking or idiot-proofing in the file at this time.


echo dev-shell bootstrap v0.1 (c) seapagan 2015
echo.
echo Downloading the 'TinyPerl' distribution ...
%~dp0mingw32\wget -q --show-progress -c --trust-server-names -c --directory-prefix=%~dp0support\packages http://sourceforge.net/projects/tinyperl/files/tinyperl/2.0/tinyperl-2.0-580-win32.zip/download
if NOT EXIST %~dp0support\packages\tinyperl-2.0-580-win32.zip (
	echo Failure to download tinyperl distribution, please check your internet connection and report as a bug otherwise!
	echo.
	pause
	exit /b 255
)
echo.
echo Unpacking TinyPerl ...
rem erase TinyPerl directory first if exists ...
if EXIST "%~dp0support\tinyperl\" (
RD /S /Q %~dp0support\tinyperl
)
%~dp0support\unzip.exe -q %~dp0support\packages\tinyperl-2.0-580-win32.zip -d %~dp0support
move %~dp0support\tinyperl* %~dp0support\tinyperl > NUL
if NOT EXIST "%~dp0support\tinyperl\" (
	echo "Failure to unpack the TinyPerl distribution, please report any error messages, thanks."
	pause
	exit /b 254
)

rem now run the perl script to continue...
cd %~dp0support\bootstrap
%~dp0support\tinyperl\tinyperl bootstrap.pl

pause
