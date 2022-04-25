# SetupWacInstall
Helps clean Up WAC and OMIMSWAC for Cluster Management and Patch to succeed

# SetupWacInstall

Automation tool for Windows Admin center and Open Manage Integration for Windows Admin Center.

This tool has 7 different options 

## ProSupportNTWKtest
![NTWKPic](https://user-images.githubusercontent.com/79279019/138011794-f2ad773f-b458-4f36-af78-2a89e3533f22.png)
 
This tool uses all the files to run a few different types of network pings, latency or bandwidth tests with Test-Netconnection, PSPING and IPV4 Network scan - See: https://github.com/BornToBeRoot
  
   

    
   How To Use: 
 Use the URL Below. Put into a powershell window and the files will download into the Downloads Folder. They will unzip and ProSupportNTWKTest will begin. You will 
 see the menu in the above screen shot. You may Test Ports and IP with Menu item 1. You may perform tests with Menu Item 2 and Menu Item 3 is to query a subnet for 
 Mac Addresses in a subnet. This will verify if a Vlan is working and keeping only macs in one segment, showing up in the returned list. :
```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="TestHVAAllocation";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/ProSupportNTWKtest/main/ExpandAnd Run.ps1')); Invoke-ProSupportNTWKTtest
``
