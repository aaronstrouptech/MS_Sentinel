@echo off 
::Release current IP address,Flushes the ARP cache, Refresh DCHP lease for IP address,Flushes the DNS cache,Re-registers with WINS,Re-register with DNS
ipconfig /release && arp -d * && nbtstat -R && ipconfig /renew all && ipconfig /flushdns && nbtstat -RR && ipconfig /registerdns
