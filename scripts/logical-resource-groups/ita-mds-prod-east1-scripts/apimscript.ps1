#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription a841ba7e-6d43-49bb-8fff-fcc287a14bea

#create a new resources group and specify the location
New-AzResourceGroup `
  -Name armtemplate `
  -Location "East US"

#set your RG & apim name and other details 
$RGName ="armtemplate"
$ApimServiceName = "apim-mds-test"
$Location = "East US"
$Organisation = "ITA"
$AdminEmail = "MDS@trade.gov"


#this command will create azure api manager
New-AzApiManagement -ResourceGroupName $RGName -Name $ApimServiceName -Location $Location -Organization $Organisation -AdminEmail $AdminEmail

#this will deploy ARM template
New-AzResourceGroupDeployment -Name MyARMDeployment -ResourceGroupName $RGName -TemplateFile "C:\Users\tarpe\Desktop\ITA\MDS\armtemplatetest\apim_mds_arm_template.json" -TemplateParameterFile "C:\Users\tarpe\Desktop\ITA\MDS\armtemplatetest\apim_mds_arm_template_parameters.json"


