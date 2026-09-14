echo off
biosp %1 %2 %3
if errorlevel 1 goto exit
echo Loading SOURCER.
sr bios.def %1 %2 %3
:exit
