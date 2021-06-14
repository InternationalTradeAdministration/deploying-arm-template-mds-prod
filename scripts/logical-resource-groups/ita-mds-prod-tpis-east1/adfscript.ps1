#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <subscription>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ita-mds-prod-tpis-east1 `
  -Location "East US"

#set your RG & data factory name
$resourceGroupName ="ita-mds-prod-tpis-east1"
$dataFactoryName = "adf-mdstpis-Prod"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $resourceGroupName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


