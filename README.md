# RCSimplePreRequsites (SWIC)
Helps clean Up WAC and OMIMSWAC for Cluster Management and Patch to succeed

# RCSimplePreRequsites (SWIC)

Automation tool for Windows Admin center and Open Manage Integration for Windows Admin Center.
Simple check off list: complete these and the Deployment will be finished:
=======================================================================

![image](https://user-images.githubusercontent.com/79279019/170914104-6e1a1861-f0b6-4532-97d0-a923d596d7ff.png)
 ![image](https://user-images.githubusercontent.com/79279019/171221698-5c4b25fb-7029-43de-969a-1a13d5666f31.png)

=======================================================================

 # # Download and run from powershell as administrator
If anything goes wrong just make sure the RCSimplePreRequsites.ps1 runs from then unzipped folder RCSimplePreRequsites, from the downloads folder in your profile. 
  ```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandSImplePreRequisites.ps1'));Invoke-RCSimplePreRequsites
```  

## RCSimplePreRequsites Pic Example
 
 ![image](https://user-images.githubusercontent.com/79279019/171219454-91acb77b-87b1-4566-ba6d-eb8b453ba69b.png)


## Deployment steps- Deploy assist tool
 Use step eight, option 1 to begin the RCSimplePreRequsitesl script- option 81 will download online. 
 if your offline, you can still use tool for ISM module and Drac tools deploy. copy renamed files for Isminstall.exe and racadmininstall.exe to C:\Users\$Env:Username\Downloads\RCSimplePreRequsites 
 
1.	Option 1 Required -  All prerequisites for the product to work. - Run on one Cluster node and WAC machine
2.	Option 2 Required - Install ISM module. Run on one node and all nodes are addressed. Run on one node and on the WAC server.
3.	Option 3 Required - Checks Steps one and 2.
4.	Option 4 Required - Checks USBNIC status and IP connectivity
5.      Option 5 Optional - Checks port 445 and 5985 connectivity and verifies.
6.      Option 6 Multi-Menu 

	 *1.  Troubleshooting -Repair Cluster Performance History
	 *2.  Troubleshooting -Repair CAU Cluster aware update if CAU VCO virtual computer object is already defined and setup. 
	 *3.  Troubleshooting -remove USB Drac Network from cluster communication
	 *4.  Troubleshooting - Restart all dracs
	 *5.  Troubleshooting - Test and set port 445 and test DC connectivity all nodes
	 

7.      Option 7 - Troubleshooting - Collect logs, auto convert to text and save to local share. 
8.      Option 8 Multi-Menu

	 *1. Recommended - Windows Admin Center Install 
	 *2. Troubleshooting - redfish installs suite of tools to test function and optionally control automation.
	 *3. Troubleshooting - Repair Remove USBNIC to allow for rediscovery
	 *4. Optional setup - Constrained Delegation 
	 *5. Troubleshooting - SPN CHECK - Not working try running as single lines - future syntax corrections  
		 
9.     Option 9 Deployment for proxy organizations - required! and Patch and update not supported if you use proxy - use manual Dell DRM download  

g.     Hidden option- search for gsespace in script and you can add your own script and run as option g in the menu. 

============================================================================================================================================
## Prerequisites to allow OMIMSWAC to work properly

     a. Use cluster manager to deploy CAU. 
     
          1. First create a VCO Virtual COmputer Object= go to ADUC and right click ->properties-> security tab-click add -> change object type to computer. Then                    create a computer account in the same OU as the cluster nodes
          2. Once Created go to the OU above and add the Computer name just created. and add the rights to write computer objects 
          3. Read/Write computer objects, Read/Write child objects, Read and write.
          4. make sure the cluster is also in this OU and has full control over the cluster nodes
          5. reference https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds
        
     b. Create a share - not in the cluster or vms on cluster- Not on the WAC server. All nodes need full control to this folder. 
     
          1. Main share \\Servername
          2. DEllUpdates - Folder where all the OMIMSWAC files will be located \\Servername\Folder
          3. DSU - Dell Server Update EXE- Place in this folder - \\Servername\DEllUpdatesDSU\
                   (i) Download DSU from  https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  \\Servername\DEllUpdates\DSU\Systems-Management_Application_5C2CW_WN64_1.9.2.0_A00.EXE
          4. IC Inventory Collector. place in the path created -  \\Servername\DEllUpdates\IC\
                   (i) Download from  Download https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  - \\Servername\DEllUpdates\IC\invcol_8YPK7_WIN64_21_12_200_1196_A00.exe
                   

     c. Deploy Repository manager (DRM)
     
          1. Deploy Dell Repository manager to this share machine. 
          2. Create a repository for the Cluster server Model number . use these shares for the repository location.
          3. ## EXPORT EXPORT EXPORT # # the repository to this share into an updates folder. this location will have 4 total sub folders
          4. DO NOT download (but do export) the repository it download does not work wth OMIMSWAC (catalog created on export)
                (i) path will later be used by OMIMSWAC- Export  to \\Servername\DEllUpdates\updates\hcios21h2_1.00_Catalog.xml


             
     d. Add Paths to OMIMSWAC for Updates to work
     
          (1) Add IC DSU and Updates catalog location paths to the two locations showing in the SCREEN SHOT BELOW
             (i) The Settings ICON will have the IC and DSU File paths- required to be entered. 
             (ii) Once You choose the UPDATE tab, choose manual and DRM radio button for the catalog path (updates path)
             
    
    		Populate share locations in OMIMSWAC
		* The shares are covered well in the section below called "Offline Instructions for Running Deployment"
		* The files downloaded are as well
		
      
    e. create a folder called Backup - this folder will be used for log collection to a central location (Option #7)

  	\\Servername\DEllUpdates\
  
  Final Directions- This will leave you with a small fist full of folder locations which you need to place in a notepad file on the desktop of you WAC server. 
  This will afford you the ability to recover from a WAC update quickly. After WAC updates, you will need to rediscover the cluster and place these share locations back   into OMIMSWAC. The backup folder is for the use of this tool. 
  
	  \\Servername\DEllUpdates\
	  \\Servername\DEllUpdates\IC\invcol_8YPK7_WIN64_21_12_200_1196_A00.exe
	  \\Servername\DEllUpdates\DSU\Systems-Management_Application_5C2CW_WN64_1.9.2.0_A00.EXE
	  \\Servername\DEllUpdates\updates\hcios21h2_1.00_Catalog.xml
   
# # Download and run from powershell as administrator
If anything goes wrong just make sure the RCSimplePreRequsites.ps1 runs from then unzipped folder RCSimplePreRequsites, from the downloads folder in your profile. 
  ```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandSImplePreRequisites.ps1'));Invoke-RCSimplePreRequsites
```  
# # See the quick start guide for the deployment and troubleshooting steps. 
follow steps 1-5 then perform the wac install on option 8 step 1 for deployment. 

# # Offline Instructions for Running Deployment 

 1) Follow steps in the bullets below. This is what you will be focused on- this folder called RCSimplePreRequisites
 
 ![Figure 1. Script folder RCSimplePreRequisites](https://user-images.githubusercontent.com/79279019/169087650-67d497fb-14cb-4c5d-b1dd-833020e2a8f4.png)
 
	*	Locate the folder called RCSimplePreRequisites (downloads folder)
	*	You will need to copy the two files below into this folder. 
	* 	Download this file https://downloads.dell.com/FOLDER07549599M/1/DellEMC-iDRACTools-Web-WINX64-10.2.0.0-4583_A00.exe 
   	*	Rename the file to  racadmininstall.exe and place inside the RCSIMPLEPreRequisites folder. 
	*	Download this file : https://downloads.dell.com/FOLDER07508105M/1/OM-iSM-Dell-Web-X64-4.1.0.0-2410_A00.exe 
   	*	Rename this file to  isminstall.exe and place it into the  RCSIMPLEPreRequisites folder
	* 	Copy the script folder to a cluster node. 
	* 	Open PowerShell as administrator and run  .\RcSimplePrerequisites.ps1 , from inside the RCSimplePreRequisites  folder . 

Hit yes every single time an approval pops up, without fail. you may have the same popup, due to multiple nodes being queried!
 
