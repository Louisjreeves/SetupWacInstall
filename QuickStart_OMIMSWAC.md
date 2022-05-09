
Full Deployment Setup and Configuration for OMIMSWAC, WAC, DRM, IDRAC, CAU
=========================================================================

Estimated time : 

1. Setup of OMIMSWAC: 30 minutes
2. Estimated time of DRM: 30 Minutes
3. Learning curve: MODERATE
4. Complexity of Product:  HIGH - Do not deviate from the steps. - This setup Protects you from several possible failure Points. 


## SetupWacInstall Pic Example
![Image](https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/SetupWacInstall.jpg) 

Initial steps
1.	Go to drac on every node and enable redfish
2.	Set the redfish Ip on each drac to a unique value- to other dracs (only the last octet- IP must be 169.254.1.x)
3.	Make sure the drac sessions tab sessions is not full of sessions. if clear out- if not clear out
4.	Make sure the drac users tab has free spaces
 
Deployment steps- Deploy assist tool
 
0.	(0) Required - All prerequsites for the product to work. - Run on one Cluster node and WAC machine
1.	(1) Required - Clears files and old installs. Run on one node and on the WAC server.
2.	(2) Required - Install ISM module. Run on one node and all nodes are addressed. Run on one node and on the WAC server.
3.	(3) Required - Checks many failure points. run on each node- or on suspect nodes only
4.	(4) Required - Install WAC on Wac server. Do not run on Cluster node
     a.	Install OMIMSWAC extension using gear tab (you will need to install manually using gear icon, choose extensions)
5. Final Steps for setup
     a. Use cluster manager to deploy CAU. 
     
          1. Before you do, go to ADUC and create a computer account in the same OU as the cluster nodes
          2. Once Created go to the OU above and right click ->properties-> security tab-click add -> change object type to computer
          3. add the Computer name just created. and add the rights to write computer ojects 
          4. Read/Write computer ojbects, Read/Write child objects, Read and write.
          5. make sure the cluster is also in this OU and has full control over the cluster nodes
          6. reference https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds
        
     b. Create a share - not in the cluster or vms on cluster- all nodes need full control to this folder. 
     
          1. Main share \\Servername
          2. DEllUpdates - Folder where all the OMIMSWAC files will be located \\Servername\Folder
          3. DSU - Dell Server Update EXE- Place in this folder - \\Servername\DEllUpdatesDSU\
                   (i) Download DSU from  https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  \\Servername\DEllUpdates\DSU\Systems-Management_Application_5C2CW_WN64_1.9.2.0_A00.EXE
          4. IC Inventory COllector. place in the path created -  \\Servername\DEllUpdates\IC\
                   (i) Download from  Download https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  - \\Servername\DEllUpdates\IC\invcol_8YPK7_WIN64_21_12_200_1196_A00.exe
                   

     c. Deploy Repository manager (DRM)
     
          1. Deploy Dell Repository manager to this share machine. 
          2. Create a repository for the Cluster server Model number . use these shares for the repository location.
          3. EXPORT EXPORT EXPORT the repository to this share into an updates folder. this locaton will have 4 total sub folders
          4. DO NOT download the repostiory it does not work wth OMIMSWAC (catalog created on export)
                (i) path will later be used by OMIMSWAC- Export  to \\Servername\DEllUpdates\updates\hcios21h2_1.00_Catalog.xml


             
     d. Add Paths to OMIMSWAC for Upates to work
     
          (1) Add IC DSU and Updates catalog location paths to the two locations showing in the SCREEN SHOT BELOW
             (i) The Settings ICON will have the IC and DSU File paths- required to be entered. 
             (ii) Once YOu choose the UPDATE tab, choose manual and DRM radio button for the catalog path (updates path)
             
             
             
    e. Backup - this folder will be used for log collection to a central location (Option #8)
 
 
 
  
      
 ![Image](https://github.com/Louisjreeves/SetupWacInstall/blob/main/OMIMSWAC.jpg?raw=true) 

          
  This completes your Deployment. Enjoy you years of Updates and Patching to work !!! 
==========================================================================================================================
Additional Tools Available
==========================================================================================================================     


Troubleshooting

* Option 8 - Use this to collect logs to send to support 
* Option 9  Constrained Delegation adds trust for the nodes and the WAC server for each other - only for Kerberos. This may be required or desirable. 
* Option 6 - Redfish test setup
     *(a) Use this if the product is not working. This will let you know the redfish is not working
     *(b) If this is the case. Use option 5. Do this on a per Node basis. This will clear the USB NIC for reuse. No changes required. 
* Option 5 - Clears the USB NIC so OMIMSWAC will recreate the needed Network Components to function- this is automated by OMIMSWAC. 
* Option 7 - Will recreate the CAU role, but the assumption is the CVO is already created and works. DO step 5A first. 

Additional Troubleshooting if Updates Fail 

1.	Test-cluster or cluster validation
2.	Restart every drac
3.	Restart every cluster node


Redeploy

1. Remove OMIMSWAC
2. Remove WAC
3. Run SetupWacInstall Option 7 To recreate the CAU with original working CVO name
4. Run SetupWacInstall Options 0,1,2,3
   *(a) Correct any issues found from option 3
   *(b) Run option 3 from each node. correct each node and any issues 
5. Run Option 4 from the WAC server. This will deploy fresh install. 
6. Insall new versions of cluster extension and other related extensions
7. Discover cluster with OMIMSWAC


log collection 

Option #1 or Option #8
 
 Run from S2d node by running this command on the local PowerShell Line: 

 ```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="SetupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandAndSetupCORP.ps1'));Invoke-SetupWacInstall
```
 
 

