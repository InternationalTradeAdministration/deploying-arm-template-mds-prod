#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-Adf-East1  `
  -Location "East US"

#set your RG & data factory name
$resourceGroupName ="ITA-MDS-Prod-Adf-East1"
$dataFactoryName = "adf-mdssima-Prod"


#Resources dependencies 

#Before you deploy your adf, make sure the correspondent key vault has been provisioned within the subscription


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $resourceGroupName `
-TemplateUri  <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


