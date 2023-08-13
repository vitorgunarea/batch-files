@echo off

netsh interface show interface Ethernet |find "Enabled" >nul && (
  netsh interface set interface "Ethernet" disabled
  netsh interface set interface "Wi-fi" enabled


echo.
echo   Disabling Ethernet
timeout /t 1 > nul
echo				.
timeout /t 1 > nul
echo					.
timeout /t 1 > nul
echo						.
timeout /t 1 > nul
echo.
echo				       	     		Wi-Fi	[ON]
timeout /t 4 > nul


) || (

netsh interface show interface Ethernet |find "Disabled" >nul && (
  netsh interface set interface "Ethernet" enabled
  netsh interface set interface "Wi-fi" disabled

echo.
echo   Disabling Wi-fi
timeout /t 1 > nul
echo				.
timeout /t 1 > nul
echo					.
timeout /t 1 > nul
echo						.
timeout /t 1 > nul
echo.
echo							Ethernet  [ON]
timeout /t 4 > nul
)
)
exit
