#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <subscription>

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name ita-mds-prod-east1 `
  -Location "East US"

#set your RG & apim name and other details 
$RGName ="ita-mds-prod-east1"
$ApimServiceName = "apim-mds-prod"
$Location = "East US"
$Organisation = "<organizationname>"
$AdminEmail = "<adminemail>"


#this command will create azure api manager
New-AzApiManagement -ResourceGroupName $RGName -Name $ApimServiceName -Location $Location -Organization $Organisation -AdminEmail $AdminEmail

#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


