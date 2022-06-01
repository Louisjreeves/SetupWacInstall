# # 1 Export repository - for index catalog- Azure HCI

 https://www.youtube.com/watch?v=KIfyntBUL38
 
 Very important to choose these options for S2d catalog. For AX 650 choose R640, for AX 700 chooe R700 etc...
 
 ![image](https://user-images.githubusercontent.com/79279019/171456049-0aa28fa0-0a8b-4b86-86c4-74b5929200ef.png)

![image](https://user-images.githubusercontent.com/79279019/171456094-0d4277b5-03fd-4443-bbd8-e51a50e7e7b7.png)


# # 2 Setup a Virtual computer object in  AD- I used Add and delete child items - for permissions 

https://docs.microsoft.com/en-us/windows-server/failover-clustering/prestage-cluster-adds

# #3. Use cluster manager - CAU Gui to enable CAU role with the Pre-created VCO

DOnt worry about dates or anything else. Next next finished! Just make sure you put in the CVO! VCO! 

![image](https://user-images.githubusercontent.com/79279019/171456546-4845bbe3-c912-4dca-87d9-d30087481b16.png)


# #4 Remove WAC and Dell EMC system Update if your first install failed. from all noded for Dell EMC systemUpdate. 
![image](https://user-images.githubusercontent.com/79279019/171456890-e6df5998-dd78-4a7a-b57c-427b4de4a41b.png)


# #5  Idrac settings connectivity and service - Enable redfish and set IP unique for each node, but only in 4th octet!

![image](https://user-images.githubusercontent.com/79279019/171454618-45a73743-6c74-4fb9-ab52-193ecbe37f5b.png)


# #6 - # # On One Node of the cluster perform script options  1-5
![image](https://user-images.githubusercontent.com/79279019/171457210-cf6a4195-1343-45f4-9996-b7596b6c321e.png)


# #7 On WAC machine perform  Options 1 (above menu) and 5 (below menu) (install wac)
![image](https://user-images.githubusercontent.com/79279019/171457357-5ca6c00e-f690-4177-8fd8-2972b26b1df5.png)


# #8  do other options in menu 5 - on one cluster node  - like disable cluster communications for USBNIC network. 
![image](https://user-images.githubusercontent.com/79279019/171457400-03b11ece-fa3c-455a-a87d-d4a07a7175da.png)

# #9. Run menu #9 Proxy setup with 159.254 exceptions if your in a proxy! Or Inventory won't work. - if proxy Updates only work
with Ofline repository!!!! - ONLINE Updates WONT WORK with Proxy exceptions. Discovery wont work without Proxy exceptions!!!!!!
![image](https://user-images.githubusercontent.com/79279019/171457474-5d99df1a-3d5e-470e-af3c-4a1a44828318.png)

# #10 Guide for HCP - Policy Reference Guide—Network Integration and Host Network Configuration Options | Dell Technologies Info Hub

https://infohub.delltechnologies.com/t/reference-guide-network-integration-and-host-network-configuration-options-1/

 
