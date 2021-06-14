#connect to your account and specify the subscription to deploy to
Connect-AzAccount -Subscription <subscription>

#create a new resources group if it doesnt exist and specify the location
New-AzResourceGroup `
  -Name ITA-MDS-TPIS-Prod-East1  `
  -Location "East US"

#set your RG & sql server name
$RGName ="ITA-MDS-TPIS-Prod-East1 "
$ServerName = "ita-mds-test-east1"
$Location = "East US"


#this command will create azure sql server 
New-AzSqlServer -ResourceGroupName $RGName `
    -ServerName $ServerName `
    -Location $Location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "sqladmin", $(ConvertTo-SecureString -String "Administrator2021$" -AsPlainText -Force))

#this will deploy ARM template
New-AzResourceGroupDeployment `
-Name MyARMDeployment `
-ResourceGroupName $RGName `
-TemplateUri <PathOrLinkToTemplateUri> `
-TemplateParameterUri <PathOrLinkToParameterUri>


