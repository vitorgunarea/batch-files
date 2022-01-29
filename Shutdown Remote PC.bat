@echo on

net use w: \\PC\Users /user:User-PC UserPassword

shutdown -m \\PC -s -t 00 -f

timeout /t 3
rem cmd /k