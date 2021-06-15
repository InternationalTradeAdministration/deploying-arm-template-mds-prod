#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1  `
  -Location "East US"

#set your RG & network security group name
$RGName ="ITA-MDS-Prod-East1"
$NetworkSecurityGroupName = "nsg-ita-mds-prod-east1"
$Location = "East US"


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>