#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1 `
  -Location "East US"

#set your RG & azure service plan name
$RGName ="ITA-MDS-Prod-East1"
$AzureServicePlanName = "az-asp-bea-api-prod"
$Location = "East US"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>