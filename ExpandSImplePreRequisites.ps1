#$cred = Get-Credential

$ans1 = Read-host "Would you like to download and run or do you have the file pre-downloaded? 1=Proceed online 2=I have the file "

If ($ans1 -ieq "1") { 
set-location c:\users\$env:username
$MyTemp=(Get-Item $env:temp).fullname
$mydownloads= (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$myuser= $env:USERNAME
 
try
 {
   $response = Invoke-WebRequest -Uri https://github.com/Louisjreeves/SetupWacInstall/raw/main/RCSimplePreRequsites.zip -OutFile $Mydownloads\RCSimplePreRequsites.zip
   $StatusCode = $Response.StatusCode
 } catch 
 {
    $StatusCode = $_.Exception.Response.StatusCode.value__
  }
  }
  
    Expand-Archive -Path $mydownloads\RCSimplePreRequsites.zip -DestinationPath $mydownloads\RCSimplePreRequsites -Force
 
 
 $activedirectory= "C:\Users\$myuser\RCSimplePreRequsites"
 cd c:\
 set-location $activedirectory
  .\RCSimplePreRequsites.ps1

 
 #OLD --------------------LEGACY---------------------------
 # $fullpath= "C:\Users\*\AppData\Local\Temp\ProSupportNTWKTtest.zip"

#$GetFile = $mytemp # diag-v-master.zip
#$getDIagVFol = (split-path $fullpath -Leaf).Split(".")[0]  #diag-v-master
#$getDiagpath = (split-path $fullpath -parent)  #C:\Users\Administrator.Corp\Desktop

#$md = "$env:ProgramFiles\WindowsPowerShell\Modules"
#$final= "c:\ProgramFiles\WindowsPowerShell\Modules\Diag-V-master\src\"
#$final2= "c:\Program Files\WindowsPowerShell\Modules\Diag-V-master\src\diag-v"
#$extractedDiag= "Diag-v-master"
#$finalFile= "diag-V"
#Expand-Archive -Path $getdiagpath\$getDIagVFol.zip -DestinationPath $md -Force
#cp -Recurse $getfile $md -Force -ErrorAction Stop
#cp -Recurse $final2 $md -Force -ErrorAction stop
#Import-module -Verbose $md\$finalfile -Force
#start-sleep 5
