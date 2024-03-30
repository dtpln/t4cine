@echo off
md "%localappdata%\Plutonium\storage\t4\mods"
xcopy /s "%cd%\mp_t4cine" "%localappdata%\Plutonium\storage\t4\mods\mp_t4cine\"
echo T4Cine (Pluto) installed successfully.
pause