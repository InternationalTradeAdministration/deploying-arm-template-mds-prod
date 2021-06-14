#  Deploying an arm Template
There are several ways to deploy a template.
We will cover in high level some of the deployment methods, to get you started with deploying templates:

## Deployment Mode
Deployments can be either Incremental or Complete. In Incremental mode, resources are deployed without deleting existing resources that are not included in the template. In complete mode resources are deployed and existing resources in the resource group not included in the template are deleted. The default mode is Incremental. For more info, visit [Deploy an application with Azure Resource Manager template](https://azure.microsoft.com/en-gb/documentation/articles/resource-group-template-deploy/)

## Powershell
Azure PowerShell is currently available in two releases - 1.0 and 0.9.8. The examples in this section use the 1.0 version.
For information about the 1.0 release, including how to install and uninstall the release, see [Azure PowerShell 1.0 Preview](https://azure.microsoft.com/en-us/blog/azps-1-0-pre/). 

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
New-AzureRmResourceGroupDeployment -Name MyARMDeployment -ResourceGroupName ITA-MDS-Prod-Storage-East1 -TemplateUri <template uri> -TemplateParameterUri <parameters file uri>
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
![azure template deployment](../images/template_deployment_portal1.png)

2. Paste/write you template in the "Edit Template" section, update the parameters and deploy:
![edit template](../images/template_deployment_portal2.png)

## Resorces and References
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/

https://azure.microsoft.com/en-us/blog/azps-1-0-pre/