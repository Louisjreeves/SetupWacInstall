# SetupWacInstallTool (SWIC)
Helps clean Up WAC and OMIMSWAC for Cluster Management and Patch to succeed

# SetupWacInstall (SWIC)

Automation tool for Windows Admin center and Open Manage Integration for Windows Admin Center.

This tool has 7 different options

## SetupWacInstall Pic Example
![Image](https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/SetupWacInstall.jpg)

 
This tool uses all different sections. Start with Step one and work your way down from one to 7. The order attempts to: 
1. Clean Up old install 
2. cleanup old USB NIC
3. Install Idrac tools and ISM module
4. Test Nodes for connectivity and give a good test for success
5. Install Wac in Gateway Mode
6. Test Redfish from a target node to idrac
7. Remove CAU if needed and try to reinstall with the same objects
  
   

    
   How To Use: 
 Use the URL Below. Put into a powershell window and the files will download into the Downloads Folder. They will unzip and SetupWacInstall will begin. You will 
 see the menu in the above screen shot. You may Test and go over the WAC install. You may perform tests with Menu Item 1-7. :
```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="SetupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandAndSetupCORP.ps1'));Invoke-SetupWacInstall
```

