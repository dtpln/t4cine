@echo off
md "%localappdata%\Activision\CoDWaW\mods"
xcopy /s "%cd%\mp_t4cine" "%localappdata%\Activision\CoDWaW\mods\mp_t4cine\"
echo T4Cine [Steam] installed successfully.
pause