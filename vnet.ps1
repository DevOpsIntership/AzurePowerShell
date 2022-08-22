Write-Host 'Create Vnet';
$name='Vnet';
$location='northeurope';
$rg='psautomation'
$address='10.0.0.0/16'
$arraysubnet = '10.0.0.0/25', '10.0.0.128/25';
$subnetName  = 'ubuntu','windows';

$VirtualNetwork = New-AzVirtualNetwork -Name $name -Location $location -ResourceGroupName $rg -AddressPrefix $address
for ($i = 0; $i -lt $arraysubnet.Count; $i++) {
  Add-AzVirtualNetworkSubnetConfig -Name $subnetName[$i] -VirtualNetwork $VirtualNetwork -AddressPrefix $arraysubnet[$i] 
}
$VirtualNetwork | Set-AzVirtualNetwork

