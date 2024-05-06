::Uninstalls Dell Command update if it exists and waits for process to finish
START /WAIT C:/Windows/Setup/Apps/Windows/Dell-Command-Update_5P2R9_WIN_3.1.3_A00.EXE /passthrough /s /x /v"/qn"
::Uninstalls Dell Command update for Windows 10 if it exists and waits for process to finish
START /WAIT C:/Windows/Setup/Apps/Windows/Dell-Command-Update-Application-for-Windows-10_46RYM_WIN_3.1.3_A00.EXE /passthrough /s /x /v"/qn"
::Uninstalls Dell Command Monitor if it exists and waits for process to finish
START /WAIT C:/Windows/Setup/Apps/Windows/Dell-Command-Monitor_18YKF_WIN_10.3.1.138_A00.EXE /s /x /v"/qn"
::Uninstalls Dell Command Monitor if it exists and waits for process to finish
START /WAIT msiexec /x {91E79414-DB41-4030-9A13-E133EE30F1D5} /qn
::Removes Dell-Command-Update.exe from device
del /f "C:/Windows/Setup/Apps/Windows/Dell-Command-Update_5P2R9_WIN_3.1.3_A00.EXE" /y
::Removes Dell-Command Update for Windows 10.exe from device
del /f "C:/Windows/Setup/Apps/Windows/Dell-Command-Update-Application-for-Windows-10_46RYM_WIN_3.1.3_A00.EXE" /y