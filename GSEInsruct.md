Automation script for deployment and troubleshooting OMIMSWAC

## GSE send List of items for cusotmer to complete - Items 1-5

## Support assist with steps 6 7 and 8 below, using this script: 

```Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-Expression('$module="setupWacInstall";$repo="PowershellScripts"'+(new-object System.net.webclient).DownloadString('https://raw.githubusercontent.com/Louisjreeves/SetupWacInstall/main/ExpandSImplePreRequisites.ps1'));Invoke-RCSimplePreRequsites
```



# # 1 Export repository - for index catalog- Azure HCI

 https://www.youtube.com/watch?v=KIfyntBUL38
 
 Very important to choose these options for S2d catalog. For AX 650 choose R640, for AX 700 chooe R700 etc...
 
 ![image](https://user-images.githubusercontent.com/79279019/171456049-0aa28fa0-0a8b-4b86-86c4-74b5929200ef.png)

![image](https://user-images.githubusercontent.com/79279019/171456094-0d4277b5-03fd-4443-bbd8-e51a50e7e7b7.png)

create the share sturucture around the updates folder location : 

      1. Main share \\Servername\Dellupdates
          2. DEllUpdates - Folder where all the OMIMSWAC files will be located \\Servername\Folder
          3. DSU - Dell Server Update EXE- Place in this folder - \\Servername\DEllUpdates\DSU
                   (i) Download DSU from  https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  \\Servername\DEllUpdates\DSU\Systems-Management_Application_5C2CW_WN64_1.9.2.0_A00.EXE
          4. IC Inventory COllector. place in the path created -  \\Servername\DEllUpdates\IC\
                   (i) Download from  Download https://dl.dell.com/omimswac/ 
                   (ii) path will later be used by OMIMSWAC  - \\Servername\DEllUpdates\IC\invcol_8YPK7_WIN64_21_12_200_1196_A00.exe
                   
Export Dell repository manager updates into the updates folder in this path: 

      1. Deploy Dell Repository manager to this share machine. 
          2. Create a repository for the Cluster server Model (IE ax640). Use these shares for the repository location.
          3. EXPORT EXPORT EXPORT the repository to this share into an updates folder. this locaton will have 4 total sub folders
          4. DO NOT download the repostiory it does not work wth OMIMSWAC (catalog created on export)
                (i) path will later be used by OMIMSWAC- Export  to \\Servername\DEllUpdates\updates\hcios21h2_1.00_Catalog.xml

SAVE ALL THESE PATHS TO THE DESKTOP OF THE WAC SERVER, FOR INPUT INTO OMIMSWAC!

# # 2 Setup a Virtual computer object in  AD- I used Add and delete child items - for permissions 

https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds

  1. Before you do, go to ADUC and create a computer account in the same OU as the cluster nodes
          2. Once Created go to the OU above and right click ->properties-> security tab-click add -> change object type to computer
          3. add the Computer name just created. and add the rights to write computer ojects 
          4. Read/Write computer ojbects, Read/Write child objects, Read and write.
          5. make sure the cluster is also in this OU and has full control over the cluster nodes
          6. reference https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds

# #3. Use cluster manager - CAU Gui to enable CAU role with the Pre-created VCO
video example - use pre-created name and perform this- https://youtu.be/pT0gK7KwYSs
DOnt worry about dates or anything else. Next next finished! Just make sure you put in the CVO! VCO! 

![image](https://user-images.githubusercontent.com/79279019/171456546-4845bbe3-c912-4dca-87d9-d30087481b16.png)


# #4 Remove WAC and Dell EMC system Update if your first install failed. from all nodes remove Dell EMC systemUpdate. 
![image](https://user-images.githubusercontent.com/79279019/171456890-e6df5998-dd78-4a7a-b57c-427b4de4a41b.png)


# #5  Idrac settings connectivity and service - Enable redfish and set IP unique for each node, but only in 4th octet!

![image](https://user-images.githubusercontent.com/79279019/171454618-45a73743-6c74-4fb9-ab52-193ecbe37f5b.png)

############ Cusotmer completed 1-5 above ################## GSE or support complete 6-9 below#############################


# #6 - # # On One Node of the cluster perform script options  1-5
![image](https://user-images.githubusercontent.com/79279019/171457210-cf6a4195-1343-45f4-9996-b7596b6c321e.png)


# #7 On WAC machine perform  Options 1 (above menu) and option item 1 (below menu) from menu item 5 (above menu) (install wac)
![image](https://user-images.githubusercontent.com/79279019/171457357-5ca6c00e-f690-4177-8fd8-2972b26b1df5.png)

wait 5 min after and then move to disable cluster communicaitons #8 below 

# #8  do other options in menu 5 - on one cluster node  - like disable cluster communications for USBNIC network. 
![image](https://user-images.githubusercontent.com/79279019/171457400-03b11ece-fa3c-455a-a87d-d4a07a7175da.png)

# #9. Run menu #9 Proxy setup with 159.254 exceptions if your in a proxy! Or Inventory won't work. - if proxy Updates only work
with Ofline repository!!!! - ONLINE Updates WONT WORK with Proxy exceptions. Discovery wont work without Proxy exceptions!!!!!!
![image](https://user-images.githubusercontent.com/79279019/171457474-5d99df1a-3d5e-470e-af3c-4a1a44828318.png)

# #10 Guide for HCP - Policy Reference Guide—Network Integration and Host Network Configuration Options | Dell Technologies Info Hub

https://infohub.delltechnologies.com/t/reference-guide-network-integration-and-host-network-configuration-options-1/

# # GSE check list 

Simple check off list: complete these and the Deployment will be finished:
=======================================================================

![image](https://user-images.githubusercontent.com/79279019/171467173-67f0d39a-b1f3-4a0c-8db3-2fdfe967c62f.png)

=======================================================================

 ONCE WAC is installed, add the paths on the desktop into OMIMSWAC: 
 
    (1) Add IC DSU and Updates catalog location paths to the two locations showing in the SCREEN SHOT BELOW
             (i) The Settings ICON will have the IC and DSU File paths- required to be entered. 
             (ii) Once YOu choose the UPDATE tab, choose manual and DRM radio button for the catalog path (updates path)
    
     
 ![Image](https://github.com/Louisjreeves/SetupWacInstall/blob/main/OMIMSWAC.jpg?raw=true) 
      
             
   ===============================================================================================
   
   # # Log collection- #7  uses a share to collect logs from all nodes - and converts files to txt: 
     
      


          
  This completes your Deployment. Enjoy you years of Updates and Patching to work !!! 
  
 e. Backup - this folder will be used for log collection to a central location (Option #8)
