@echo on

net use w: \\PC\Users /user:Usuario-PC Arenque1-

shutdown -m \\PC -s -t 00 -f

timeout /t 3
rem cmd /k