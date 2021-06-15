#connect to your account 
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1 `
  -Location "East US"

#set your KV & RG name
$RGName ="ITA-MDS-Prod-East1"
$VaultName = "ita-kv-mdssima"
$Location = "East US"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $resourceGroupName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


