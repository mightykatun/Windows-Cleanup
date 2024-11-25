@echo off
goto check_Permissions
 :check_Permissions
 net session >nul 2>&1
 if NOT [%errorLevel%] == [0] (
 	echo Failure: Please run as admin
	pause
	exit
 )
echo Clearing...
rmdir /s /q "C:\Users\dionakk\AppData\Local\Temp" >nul 2>&1
echo Cleared Temp folder
rmdir /s /q "C:\Users\dionakk\AppData\LocalLow\webviewdata\" >nul 2>&1
echo Cleared webviewdata folder
rmdir /s /q "C:\Users\dionakk\AppData\LocalLow\Microsoft" >nul 2>&1
echo Cleared Microsoft cache folder
ipconfig /flushdns >nul 2>&1
echo Flushed DNS cache
for /f %%x in ('wevtutil el') do CALL wevtutil cl "%%x" >nul 2>&1
echo Cleared event log
echo Finished clearing
pause