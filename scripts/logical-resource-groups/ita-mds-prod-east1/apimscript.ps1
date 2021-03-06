#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <subscription>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ita-mds-prod-east1 `
  -Location "East US"

#set your RG & apim name and other details 
$RGName ="ita-mds-prod-east1"
$ApimServiceName = "apim-mds-prod"
$Location = "East US"
$Organisation = "<organizationname>"
$AdminEmail = "<adminemail>"

#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


