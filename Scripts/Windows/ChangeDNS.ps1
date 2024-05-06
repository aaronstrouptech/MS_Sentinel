Set-DnsClientServerAddress -InterfaceAlias Ethernet* -ServerAddresses "1.1.1.1","8.8.8.8"
Set-DnsClientServerAddress -InterfaceAlias Wi* -ServerAddresses "1.1.1.1","8.8.8.8"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f
Clear-DnsClientCache