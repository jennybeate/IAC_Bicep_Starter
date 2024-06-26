1. ***Hands on testing (before modifying files)***: 
Follow the numbers. Test deploying and making modifications. Delete your resources and test redeploying them, or just redeploy while changing some values. 

***How to deploy:***

I have created resource groups for you in sandbox.

Connect-AzAccount 
$context = Get-AzSubscription -SubscriptionName 'sub-sbx-sandbox'
Set-AzContext $context
Get-AzSubscription
Set a default resource group if you like: Set-AzDefault -ResourceGroupName rsg-sbx-workshop-<yourname>

Set a default resource group if you like: Set-AzDefault -ResourceGroupName rsg-sbx-tab-auth - we were allowed to use this
Point to the path of your file
New-AzResourceGroupDeployment -TemplateFile 1.modules/1storage.bicep 
Get-AzResourceGroupDeployment -ResourceGroupName rsg-sbx-tab-auth | Format-Table

See the "Deployments blade" on the resource group you deployed to.

2. ***Get to know the resource format and documentation*** (just get an overview) 
Grab the resource providers such as "'Microsoft.Web/serverFarms@2022-03-01" and google it. Or use intellisense by hovering over the resource name: such as resource "thisname" 'resourceprovider/apiversion'. Go to "view documentation."
It will take you to the official docs, where you can see the possible values that the resource type can accept.
You can se multiple tabs for different api-versions like 2022-03-01 which will be a little different, but if you use an older one, it will still work just fine.
Usually you want to use the most recent one anyways just because "Ooh, it has support for private endpoints, while the old ones don't, etc".
As you can tell, there is a vast amount of flexibility there (usually equal amount in the portal), and the point of default parameters and templates, is to make it easier for you so that you don't have to choose. Also look at the different subtypes of the resource, such as blobstorage, a subresource of storage accounts.

4. ***Make modifications***
Try using the docs and intellisense from VS code to show you alternative parameters you can input into files in 1.modules. Just test updating what you have deployed with some new values. You can choose to hardcode or to use parameters. Remember: If you set a default value, you don't need to update the template referencing it.

5. ***Check out the avm***
Hover over the resourcename: module "resourcename" 'br.. to get to the module documentation in 4.avm_modules. Do as you did in point number 3 See what you can input and just test. 

6. ***Parameter files***
 right click the main.bicep file in templateOrchestrators or which ever file you like, and choose generate a parameters file, and select all. You can test both json and bicepparam.
Drag the file over to the 5.parameters folder. Bicepparam is a lot nicer to work with, but it also requires you to download the Bicep Cli extension.
You can have less parameters in the parameter file than you need, but you cannot have more. Deployments will fail. No harm will be done. Change your default values and see that they are overridden in the deployment.

***How to deploy with a parameter file:***

With a parameter file:
New-AzResourceGroupDeployment -TemplateFile modules/storage1.bicep  -TemplateParameterFile 5.parameters/main.parameters.json (if your file is called that, or bicepparam not json). Right click the template orchestrator main file and choose "create parameter file". I recommend using bicepparam if you have bicep CLI installed, as gives you a lot more power than json files. Move the parameter file to the parameter folder. Ideally you would create a folder pr environment and have different param files pr environment. When you use a bicepparam file, this will help you send the right parameters to the main file, but it needs to know where its main file is, so update the path to main after you move it. Open the bicepparam file and see the section "using ../main.bicep", and update, such as "using ../../dev/main.bicep". Intellisense will show you if you found it.


***More guidance with the microsoft learn***

https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/4-exercise-define-resources-bicep-template?pivots=powershell 


***AVM lab***
https://github.com/Azure-Samples/avm-bicep-labs/tree/main