$webappname="adkwolekwebapp"
$storagename="$($webappname)storage"
$container="appbackup"
$location="West Europe"
$backupname="backup1"


# Create a storage account.
$storage = New-AzStorageAccount -ResourceGroupName automation `
-Name $storagename -SkuName Standard_LRS -Location $location

# Create a storage container.
New-AzStorageContainer -Name $container -Context $storage.Context

# Generates an SAS token for the storage container, valid for one month.
# NOTE: You can use the same SAS token to make backups in Web Apps until -ExpiryTime
$sasUrl = New-AzStorageContainerSASToken -Name $container -Permission rwdl `
-Context $storage.Context -ExpiryTime (Get-Date).AddMonths(1) -FullUri

# Create an App Service plan in Standard tier. Standard tier allows one backup per day.
New-AzAppServicePlan -ResourceGroupName myResourceGroup -Name $webappname `
-Location $location -Tier Standard

# Create a web app.
New-AzWebApp -ResourceGroupName myResourceGroup -Name $webappname `
-Location $location -AppServicePlan $webappname

# Create a one-time backup
New-AzWebAppBackup -ResourceGroupName myResourceGroup -Name $webappname `
-StorageAccountUrl $sasUrl -BackupName $backupname

