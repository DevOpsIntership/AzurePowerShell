Write-Host 'Assign NSG';
$Vnetname='Vnet'
$subnetName  = 'ubuntu','windows';
$VirtualNetwork = Get-AzVirtualNetwork -Name $Vnetname -ResourceGroup 'psautomation'
$arraysubnet = '10.0.0.0/25', '10.0.0.128/25';
$ubuntysecgroup = Get-AzNetworkSecurityGroup -Name 'nsgubuntupowershell'
$windowssecgroup= Get-AzNetworkSecurityGroup -Name 'nsgwindowsPowershell'
$nsg= $ubuntysecgroup, $windowssecgroup

for ($i = 0; $i -lt $subnetName.Count; $i++) {
    Set-AzVirtualNetworkSubnetConfig -AddressPrefix $arraysubnet[$i] -Name $subnetName[$i] -VirtualNetwork $VirtualNetwork -NetworkSecurityGroup $nsg[$i]

}
$VirtualNetwork | Set-AzVirtualNetwork