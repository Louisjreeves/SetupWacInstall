Simple Offline Release Cantidate (SORC) OMIMSWAC

Open Manage Integration for Windows Admin Center Quick Start Guide. Offline steps
BASE prerequisites OMIMSWAC, WAC, DRM, IDRAC, CAU
=========================================================================
Note for high security enviroments. You may have a problem getting started. 
 
1. This script is designed to help with this difficulty. 
2. Before running this scipt make sure you can access the C$ share from each node to each node
3. Make sure you can successfully etsn (enter-psSession) to every node from any other node
4. Login with admin credentials. This tool uses the logged in creds for all actions. 
5. Make sure to run Powershell as administrator. 

THis Script will Allow you to run on one node, and install the Drac tools on all nodes, as well as ISM module and add every needed
fix to run the OMIMSWAC.

------------------------------------------------------------------------

 ![Figure 1. Script folder RCSimplePreRequisites](https://user-images.githubusercontent.com/79279019/169087650-67d497fb-14cb-4c5d-b1dd-833020e2a8f4.png)

This is the Folder you will copy to one cluster node. 

-------------------------------------------------------------------

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
