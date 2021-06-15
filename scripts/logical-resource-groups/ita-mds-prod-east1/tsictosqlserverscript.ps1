#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-East1  `
  -Location "East US"

#set your RG & sql server name
$RGName ="ITA-MDS-Prod-East1 "
$ServerName = "ita-mds-tsictoserver-prod-east1"
$Location = "East US"

#Inorder to deploy azure sql server dont forget to provide your subscription id in the template parameter file under (maintenanceConfigurationId)


#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


