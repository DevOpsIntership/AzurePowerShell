Write-Host 'Create Apps';


$rg='psautomation'
$PlanName='Plan'
$loc='westeurope'
$Price='Basic'
$AppName='adam98020testpower'
New-AzAppServicePlan -ResourceGroupName $rg -Name $PlanName -Location $loc -Tier $Price -NumberofWorkers 1  -Linux
New-AzWebApp -ResourceGroupName $rg -Name $AppName -Location $loc -AppServicePlan $PlanName -ContainerImageName docker/getting-started

