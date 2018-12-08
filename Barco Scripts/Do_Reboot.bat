@echo off 
cd ..\cs reboot 
CALL ProjectorActivation.exe --install 
IF ERRORLEVEL 0 (echo Success > ../scriptExecution/executionresult.txt) 
ELSE (echo Failed^|The update license process encountered errors. Please 
see Output.txt for 
    more information > ../scriptExecution/executionresult.txt) 
 
cd ..\scriptExecution 
@echo on 
 
Save the example script file to e.g. LightLeaseScript.bat." 
 
It would be good if i get examples or some documentation on how to make 
them, or provided examples for Log extraction, Remote reboot ect. 
 