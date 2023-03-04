set PATH=%cd%\SourcePackages\chrome;%PATH%
set PYTHONPATH=${PYTHONPATH}:%cd%\SourcePackages
.\SourcePackages\chrome\python\python.exe .\SourcePackages\pandalearning.py
pause