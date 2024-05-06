#Unzips archive to specific location
Expand-Archive C:\Windows\Setup\Apps\Windows\SQLWorkbench125.zip -DestinationPath C:\Windows\Setup\Apps\Windows\ -Force
#Moves SQL Workbench to Public Desktop
Copy-Item -Path "C:\Windows\Setup\Apps\Windows\SQLWorkbench125\Launch SQLWorkbench.lnk" -Destination C:\Users\Public\Desktop
#Installs Java silently
C:\Windows\Setup\Apps\Windows\SQLWorkbench125\JavaSetup.exe /s