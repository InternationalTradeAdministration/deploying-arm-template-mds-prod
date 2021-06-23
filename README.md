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
We can also use Azure CLI to deploy azure arm templates. Get started with [Manage Azure resources by using Azure CLI](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resources-cli) overview.
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

2. Upload or write your template in the "Edit Template" section under "built your own template in the editor". Update the parameters and deploy:
[edit template](https://portal.azure.com/#create/Microsoft.Template)

## Resorces and References
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/

https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-portal