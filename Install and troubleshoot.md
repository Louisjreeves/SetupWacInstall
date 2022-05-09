




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
     * a.	Install OMIMSWAC extension using gear tab (you will need to install manually using gear icon, choose extensions)
5. Final Steps for setup
     * a. Use cluster manager to deploy CAU. 
          *(0) Before you do, go to ADUC and create a computer account in the same OU as the cluster nodes
          *(1) Once Created go to the OU above and right click ->properties-> security tab-click add -> change object type to computer
          *(2) add the Computer name just created. and add the rights to write computer ojects 
          *(3) Read/Write computer ojbects, Read/Write child objects, Read and write.
          *(4) make sure the cluster is also in this OU and has full control over the cluster nodes
          *(5) reference https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds
      * b. Create a share - not in the cluster or vms on cluster- all nodes need full control to this folder. 
          *(1) Main share \\Servername
          *(2) DEllUpdates - Folder where all the OMIMSWAC files will be located \\Servername\Folder
          *(3) DSU - Dell Server Update EXE- Place in this folder - \\Servername\DEllUpdatesDSU\
             *(i) Download DSU from  https://dl.dell.com/omimswac/ 
             *(ii) path will go to OMIMSWAC \\Servername\DEllUpdates\DSU\Systems-Management_Application_5C2CW_WN64_1.9.2.0_A00.EXE
          *(4) IC Inventory COllector. place in the path created -  \\Servername\DEllUpdates\IC\
             *(i) Download from  Download https://dl.dell.com/omimswac/ 
             *(ii) path will go to OMIMSWAC  - \\Servername\DEllUpdates\IC\invcol_8YPK7_WIN64_21_12_200_1196_A00.exe
       *c. Open Repository manager (DRM)
             
      *c. Add Paths to OMIMSWAC for Upates to work
         *(1) Add IC DSU and Updates catalog location paths to the two locations showing in the screen shot below
      *d. Backup 
      
      
 ![Image](https://github.com/Louisjreeves/SetupWacInstall/blob/main/OMIMSWAC.jpg?raw=true) 

          
      *   *(1) Deploy Dell Repository manager to this machine. 
      *   *(2) Create a repository for the Cluster server Model. use this share for the repository location.
      *   *(3) Export the repository to this share into an updates folder. this locaton will have 4 total sub folders




2.	Add Paths to OMIMSWAC
     * a.	IC, and DSU path for files in share for step 1b -above. see the setting icon in the screen shot below.
     * b.	DRM settings have just the  Updates share path (with catalog xml) see DRM setting in screen shot below.

Additional Tools Available

 



 
      


Troubleshooting

1.	(8) collect logs- run on one cluster node
2.	(6) test redfish
3.	(4) Several Tests
4.	(2) Repair usb
5.	(3) repair ISM
6.	(1) cleanup for wac only
7.	(0) Re-apply pre-requisites
8.	(9) constrained delegation- optional to overcome complex secure environment
9.	Test-cluster or cluster validation
10.	Restart every drac
11.	Restart every cluster node


Redeploy

1. Remove OMIMSWAC
2. Remove WAC
3. Run setup wac install tool 1-9
4. Reinstall WAC and install OMIMSWAC (option 5 in setup tool)
5. Insall new versions of cluster extension and other related extensions
6. Discover cluster


log collection 

Option #1 or Option #8
 
 Run from S2d node by running this command on the local PowerShell Line: 

 ```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="SetupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandAndSetupCORP.ps1'));Invoke-SetupWacInstall
```
 
 

