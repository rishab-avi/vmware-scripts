$sourcevmname = "dev-1604"
$destvmname= "dev-1604"
$sourceVC = "10.10.2.9"
$vmkernelAdapter = "vmk0"

$sourceVCConn = Connect-VIServer -Server $sourceVC -user $sourceVCUsername -password $sourceVCPassword

Get-VMHost -Server $sourceVCConn | Get-VMHostNetworkAdapter -Name $vmkernelAdapter |Set-VMHostNetworkAdapter -VMotionEnabled $true

Disconnect-VIServer -Server $sourceVCConn -Confirm:$false