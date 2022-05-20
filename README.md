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

===========================
Simple Offline Release Cantidate (SORC) OMIMSWAC

1) Step one. Download the Zip folder called RCSImplePreRequisites.zip (Quit the script and when it asks to put in a cluster name.) Find it in the Downloads folder. 
Use this link then move to step 2:

```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandSImplePreRequisites.ps1'));Invoke-RCSimplePreRequsites
```


 2) Follow steps in the bullets below. This is what you will be focused on- this folder called RCSimplePreRequisites
 
 ![Figure 1. Script folder RCSimplePreRequisites](https://user-images.githubusercontent.com/79279019/169087650-67d497fb-14cb-4c5d-b1dd-833020e2a8f4.png)
 
*	Locate the folder called RCSimplePreRequisites (downloads folder)
*	You will need to copy the two files below into this folder. 
* 	Download this file https://downloads.dell.com/FOLDER07549599M/1/DellEMC-iDRACTools-Web-WINX64-10.2.0.0-4583_A00.exe 
    *	Rename the file to  racadmininstall.exe and place inside the RCSIMPLEPreRequisites folder. 
*	Download this file : https://downloads.dell.com/FOLDER07508105M/1/OM-iSM-Dell-Web-X64-4.1.0.0-2410_A00.exe 
    *	Rename this file to  isminstall.exe and place it into the  RCSIMPLEPreRequisites folder
* 	Copy the script folder to a cluster node. 
* 	Open PowerShell as administrator and run  .\RcSimplePrerequisites.ps1 , from inside the RCSimplePreRequisites  folder . 

Hit yes every single time an approval pops up, without fail. This is your pre-requisites being applied. 16 nodes is 64 yes’s!



 
