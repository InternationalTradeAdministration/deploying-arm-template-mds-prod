#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1  `
  -Location "East US"

#set your RG, & vitual network name
$RGName ="ITA-MDS-Prod-East1 "
$VirtualNetworkName = "vnet-ita-mds-prod-east1"

#Before deploying the vnet, ensure you have both the nsg and route tables for this vnet already deployed in your subscription.

#vnet resource dependencies 
#route tables
#network sercurity group


#Deploy the template in the defined resource group
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>