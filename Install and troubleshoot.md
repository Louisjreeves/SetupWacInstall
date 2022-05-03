




## SetupWacInstall Pic Example
![Image](https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/SetupWacInstall.jpg) 

Initial steps
1.	Go to drac on every node and enable redfish
2.	Set the redfish Ip on each drac to a unique value- to other dracs
3.	Make sure the drac sessions tab sessions empty - if not clear out
4.	Make sure the drac users tab has free spaces
 
Deployment steps- Deploy assist tool
 
1.	(0) From one Cluster node and WAC machine
2.	(1) From one cluster node and wac machine
3.	(2)(3)- optional but ok for deployment
4.	(4) Step 4 makes sure nothing will cause deployment failure 
5.	(5) Install WAC on Wac server
      a.	Install OMIMSWAC extension using gear tab
6.	Use Cluster manager and setup the CAU role with CAU GUI.
7.	Define a computer name CVO/CNO 
      a.	Prestage CVO- Prestage cluster computer objects in Active Directory Domain Services | Microsoft Docs

https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds

![Image](https://github.com/Louisjreeves/SetupWacInstall/blob/main/OMIMSWAC.jpg?raw=true)

Setup Updates
 
1.	Install Dell Repository manager on a server with share
      a.	Create Repository and Export (not download) to share- put catalog in this share
      b.	Create a folder called IC and another called DSU
      c.	Put IC file and DSU 1.92 file - in those folders-dl.dell.com - /omimswac/
2.	Add Paths to OMIMSWAC
      a.	IC, and DSU path for files in 1b -2 paths to define (settings)
      b.	DRM settings have just the  Updates share path (with catalog xml)


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
 
 

