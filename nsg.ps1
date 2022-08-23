Write-Host 'Create nsg';
$location='uksouth';
$name='nsgubuntupowershell', 'nsgwindowsPowershell';
$location='northeurope';
$rg='psautomation'
$nsgParamsUbuntu= @{

   name                     = 'AllowTrafic'
   Access                   = 'Allow'    
   Direction                = 'Outbound'
   Priority                 = 1000
   Protocol                 = '*'
   DestinationPortRange     = '*'
   DestinationAddressPrefix = '*' 
   SourcePortRange          = '*'
   SourceAddressPrefix      = 'Internet'
   

}

$nsgParamsWindows= @{

    name                     = 'AllowRdp'
    Access                   = 'Allow'    
    Direction                = 'Inbound'
    Priority                 = 1000
    Protocol                 = 'Tcp'
    DestinationPortRange     = 3389
    SourcePortRange          = '*'
    SourceAddressPrefix      = 'Internet'
    DestinationAddressPrefix = '*'
 
 }

$ubunturule = New-AzNetworkSecurityRuleConfig @nsgParamsUbuntu
$windowsrule = New-AzNetworkSecurityRuleConfig @nsgParamsWindows

New-AzNetworkSecurityGroup -ResourceGroupName $rg -Location $location -Name $name[0] -SecurityRules $ubunturule
New-AzNetworkSecurityGroup -ResourceGroupName $rg -Location $location -Name $name[1] -SecurityRules $windowsrule