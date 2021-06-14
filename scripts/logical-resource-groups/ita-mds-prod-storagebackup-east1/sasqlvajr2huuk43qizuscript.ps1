﻿
#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <subscription>

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-StorageBackup-East1  `
  -Location "East US"

#set your RG & storage account name
$RGName ="ITA-MDS-Prod-StorageBackup-East1"
$StorageAccountName = "tpisprod"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


















f77f3fb8-7095-4b35-aec0-49340169db57