# # 1 Export repository - for index catalog- Azure HCI

 https://www.youtube.com/watch?v=KIfyntBUL38
 
 Very important to choose these options for S2d catalog. For AX 650 choose R640, for AX 700 chooe R700 etc...
 
 ![image](https://user-images.githubusercontent.com/79279019/171456049-0aa28fa0-0a8b-4b86-86c4-74b5929200ef.png)

![image](https://user-images.githubusercontent.com/79279019/171456094-0d4277b5-03fd-4443-bbd8-e51a50e7e7b7.png)


# # 2 Setup a Virtual computer object in  AD- I used Add and delete child items - for permissions 

https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds

# #3. Use cluster manager - CAU Gui to enable CAU role with the Pre-created VCO

# #4 Remove WAC 

# #5  Idrac settings connectivity and service - Enable redfish and set IP unique for each node, but only in 4th octet!

![image](https://user-images.githubusercontent.com/79279019/171454618-45a73743-6c74-4fb9-ab52-193ecbe37f5b.png)


# #6 - # # On One Node of the cluster perform script options  1-5

# #7 On WAC machine perform  Options 1 and 5 (install wac)

# #8  do other option in option 5 menu on one cluster node  - like disable cluster communications for USBNIC network. 

# #9. Run the Proxy setup with 159.254 exceptions if your in a proxy! Or Inventory won't work. 

# #10 Guide for HCP - Policy Reference Guide—Network Integration and Host Network Configuration Options | Dell Technologies Info Hub



 
