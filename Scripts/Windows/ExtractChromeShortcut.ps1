#Unzips archive to specific location
Expand-Archive -LiteralPath C:\Windows\Setup\Apps\Windows\VaroChrome.zip -DestinationPath C:\Windows\Setup\Apps\Windows\ -Force
Copy-Item "C:\Windows\Setup\Apps\Windows\Google Chrome - Varo.lnk" "c:\users\public\desktop"