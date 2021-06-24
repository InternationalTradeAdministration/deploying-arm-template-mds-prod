#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1 `
  -Location "East US"

#set your RG & azure fucntion app name
$RGName ="ITA-MDS-Prod-East1"
$FunctionAppName = "az-func-bea-api-prod"
$Location = "East US"

#Ensure that your service plan for the function app exist within your subscription before you deploy 


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>
