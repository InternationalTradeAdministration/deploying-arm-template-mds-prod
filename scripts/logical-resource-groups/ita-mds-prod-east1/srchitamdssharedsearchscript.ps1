#connect to your account 
Connect-AzAccount -Subscription <subscriptionid>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1 `
  -Location "East US"

#set your Cognitive Search & RG name
$RGName ="ITA-MDS-Prod-East1"
$VaultName = "ita-mds-shared-search-prod"
$Location = "East US"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>