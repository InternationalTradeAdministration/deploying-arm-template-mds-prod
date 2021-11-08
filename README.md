# Deploying Arm Template MDS Prod 
Deploying Azure ARM Template deployment using Build and Release in Azure Pipelines


## Overview ##

How to configure Azure ARM Template deployment using Build and Release in Azure Pipelines.

## Building MDS infrastructure with ARM Template (Azure DevOps Build) ##


### Creating a release pipeline from a template ###

1. Navigate to your team project on Azure DevOps.

1. Navigate to **Pipelines \| Releases**.

    ![](images/000.png)

1. Select **New pipeline** to create a new release pipeline.

    ![](images/001.png)

1. Click  **or start with an empty job**.

    ![](images/002.png)

1. It will show you an view with stage information. Ignore that and click on **1 job, 0 task** on left side

    ![](images/1.png)

1. Click the **+** sign on **Agent Job** bar

    ![](images/004.png)

1. search for **Azure Resource Group Deployment** and click **add**

    ![](images/005.png)

1. Select **Azure Deployment: Create or Update Resource** from left side

    ![](images/006.png)

1. Select Azure Subscription

    ![](images/007.png)
    
1. Select Resource Group from dropdown. If you don't have an existing resource group go and create one on azure portal. Come back to this step and click the refresh sign on right.

    ![](images/008.png)
    
1. Select Location (Recommended **East US**)

1. Select template Location  **Linked  artifact**
    
    ![](images/009.png)
    
1. View parameters that you can override by clicking **...*** on the right side. Normally this would work but this time it won't since Github doesn't allow CORS requests. Click **+Add** and enter **mysqlPassword** on name and then what you want on value. Then click **OK**

    ![](images/010.png)

1. Save your definition **Save**.

    ![](images/011.png)
    
1. Create new release

    ![](images/012.png)
    
1. Keep defaults and click **Create**

   ![](images/013.png)
   
1. Open your newly created **Release-1**

   ![](images/014.png)
   
1. Wait and enjoy the nice animation

   ![](images/015.png)
   
1. Validate from azure portal to confirm if the resource you just deployed is showing up in your resource group