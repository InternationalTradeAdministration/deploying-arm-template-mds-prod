# Deploying Arm Template MDS Prod
There are several ways to deploy a template.
We will cover in high level some of the deployment methods in order to get started with deploying templates:

## Deployment Mode
Deployments can be either Incremental or Complete. In Incremental mode, resources are deployed without deleting existing resources that are not included in the template. In complete mode resources are deployed and existing resources in the resource group not included in the template are deleted. The default mode is Incremental. For more info, visit [Deploy an application with Azure Resource Manager template](https://azure.microsoft.com/en-gb/documentation/articles/resource-group-template-deploy/)
 
## Deploy Using Powershell

The following example will deploy a template file using a parameter file. In this example the template and parameters files are hosted localy:
```powershell
#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <YourSubscriptionId>

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-Prod-Storage-East1 `
  -Location "East US"

#set your RG name
$RGName ="ITA-MDS-Prod-Storage-East1"

#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateFile <PathOrLinkToTemplateFile> `
-TemplateParameterFile <PathOrLinkToParameterFile>
```

Deploy using inline parameters:
```powershell
New-AzResourceGroupDeployment -Name MyARMDeployment -ResourceGroupName ITA-MDS-Prod-Storage-East1  -TemplateFile <PathOrLinkToTemplate> -myParameterName "parameterValue"
```

Deploy using a parameters object:
```powershell
$parameters = @{"<ParameterName>"="<Parameter Value>"}
New-AzResourceGroupDeployment -Name MyARMDeployment  -ResourceGroupName ITA-MDS-Prod-Storage-East1 -TemplateFile <PathOrLinkToTemplate> -TemplateParameterObject $parameters
```

Deploy with template and parameters file URIs:
```powershell
New-AzureRmResourceGroupDeployment -Name MyARMDeployment -ResourceGroupName ITA-MDS-Prod-Storage-East1 -TemplateUri <templateuri> -TemplateParameterUri <parametersfileuri>
```
## Command Line Interface
I assume that you have some experiance with using the Azure CLI. if not, no harm - get started with [this](https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-azure-resource-manager/) overview.
The follwoing deploys a local template file using inline parameters:
```bash
azure login
azure config mode arm

azure group create -n ITA-MDS-Prod-Storage-East1 -l "East US"

azure group deployment create -f <PathToTemplate> -p "{\"ParameterName\":{\"value\":\"ParameterValue\"}}" -g ITA-MDS-Prod-Storage-East1 -n MyARMDeployment
```
Deploy using a template URI:
```bash
azure group deployment create --template-uri <LinkToTemplate> -p "{\"ParameterName\":{\"value\":\"ParameterValue\"}}" -g ITA-MDS-Prod-Storage-East1 -n MyARMDeployment
 ```
 
Deploying using a parameters file:
```bash
 azure group deployment create -f <PathToTemplate> -e <PathToParameterFile> -g  -n MyARMDeployment
```

## Azure Portal
The Azure Portal allows you to deploy your own templates in a UI exepriance. 

1. In the azure Portal, go to the marketplace blade, and search for "Template Deployment":
[azure template deployment](https://portal.azure.com/#blade/Microsoft_Azure_Marketplace/MarketplaceOffersBlade/selectedMenuItemId/home)

2. Paste/write you template in the "Edit Template" section, update the parameters and deploy:
[edit template](https://portal.azure.com/#blade/HubsExtension/TemplateEditorBladeV2/template/%7B%0A%20%20%20%20%22%24schema%22%3A%20%22https%3A%2F%2Fschema.management.azure.com%2Fschemas%2F2019-04-01%2FdeploymentTemplate.json%23%22%2C%0A%20%20%20%20%22contentVersion%22%3A%20%221.0.0.0%22%2C%0A%20%20%20%20%22parameters%22%3A%20%7B%7D%2C%0A%20%20%20%20%22resources%22%3A%20%5B%5D%0A%7D)

## Resorces and References
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/

https://azure.microsoft.com/en-us/blog/azps-1-0-pre/