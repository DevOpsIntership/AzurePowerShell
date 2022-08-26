Write-Host 'Create VM';
$VmImage = 'Win2016Datacenter'
$VmPricingtier = 'Standard_D2s_v3'
$rg = 'psautomation'
$location ='northeurope'


$vmParams = @{
  ResourceGroupName = $rg
  Name = "VMWindows"
  Location = $location
  ImageName = $VmImage
  Size = $VmPricingtier
  VirtualNetworkName = "Vnet"
  SubnetName = "windows"
  SecurityGroupName = "nsgwindowsPowershell"
  AllocationMethod = "Static"

}
New-AzVM @vmParams
