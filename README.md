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

 =============================
 OFLINE INSTALLER - You will need to manually put the Following files into the applicaiton folder: 
 Dell Idrac tools - name the file racadmininstall.exe
 Dell ISM module - Name the file isminstall.exe
 Windows Admin Center. - name the file WindowsAdminCenter.msi
 
 ```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandOfflineWacInstall.ps1'));Invoke-OfflineWacInstall
```
===========================
Simple Offline Release Cantidate (SORC) OMIMSWAC
 * OFLINE INSTALLER - You will need to manually put the Following files into the applicaiton folder: 
 * Dell Idrac tools - name the file racadmininstall.exe
 * Dell ISM module - Name the file isminstall.exe
 * Windows Admin Center. - name the file WindowsAdminCenter.msi
 * [bold] After you choose "1" to dowload, Cancel instead of putting in the cluster name
 * You will need to copy the files drac tools, renamed as racadmininstall.exe to the script folder
 * You will need to copy the ISM files to the script folder, renamed as isminstall.exe
 * Run the script- this will prompt for yes - 4 times per node minumum. 
 * Uncomment lines 116 and 117 to allow the ISM module to install. Current default only installs drac tools on every node and completes fixes and repairs. 

```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandSImplePreRequisites.ps1'));Invoke-RCSimplePreRequsites
```
 
