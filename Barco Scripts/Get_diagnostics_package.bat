@echo off
echo Create diagnostics package

::IP value of the projector is 
set IP=%1%

::Check the path of communicator

IF EXIST "C:\Program Files (x86)\BARCO\communicator\cs.exe" (
        set ComPath="C:\Program Files (x86)\BARCO\communicator\"
) ELSE (
        IF EXIST "C:\Program Files\BARCO\communicator\cs.exe" (
 	       set ComPath="C:\Program Files\BARCO\communicator\"
 	) ELSE (
   	     echo "Communicator is not installed or is located on a different location." >output.txt
	     goto NO_FOUND
 	)
)
echo Communicator path = %ComPath%


::Change current directory and create a diagnostics-package

FOR /F "DELIMS=" %%A IN ('CD') DO SET currentDir=%%A
echo current directory = %currentDir%
cd %ComPath%
cs.exe create diagnostics-package %IP% -pf "%IP%" >> "%currentDir%\output.txt"

cd %currentDir%


::Copy the diagnostics package and the logs to the current directory

FOR /f %%A IN ('DIR /b %ComPath%log_cs ^| FIND "%IP%"') DO SET filename1=%%A
move %ComPath%log_cs\%filename1% .\%filename1%

FOR /f %%A IN ('DIR /b %ComPath% ^| FIND "%IP%"') DO SET filename2=%%A
move %ComPath%%filename2% .\%filename2%


::Make a executionresult-file

find "exit status 0" .\output.txt
if ERRORLEVEL 1 goto NO_FOUND
if ERRORLEVEL 0 goto FOUND

:NO_FOUND
echo Failed^|see output.txt >> executionresult.txt
goto end


:FOUND
echo Success >> executionresult.txt
:end


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            