$sourceVC = "10.10.2.6"
$sourceVCUsername = "root"
$sourceVCPassword = "vmware"
$vds = "dvSwitch"

# Connect to vCenter
$sourceVCConn = Connect-VIServer -Server $sourceVC -user $sourceVCUsername -password $sourceVCPassword
 
# Set the VDS Name to variable
$vdsname = get-vdswitch $vds -Server $sourceVCConn
 
# Import the CSV of VLAN IDs, Portgroups, and # of ports
$vdsPortgroup = Import-Csv e:\ben\vmware\New_Portgroups.csv
 
# Loop through each VLAN and create it in the vDS
foreach ($portgroup in $vdsPortgroup){
Get-vdswitch $vdsname -Server $sourceVCConn | New-VDPortgroup -name $portgroup.pgName -VlanId $portgroup.vlanID
}

# Disconnect from Source/Destination VC
Disconnect-VIServer -Server $sourceVCConn -Confirm:$false