# nodejs-projects
# All node JS projects exits inside

# Azure-Session-22.1(Hands-on) How Azure Pipeline Works ?

Step-1: Install NodeJS on Windows Laptop

Step-2: Go to NodeJS Project via Git Bash

Check NodeJS Version:
---------------------------------
$ node -v
v18.17.1

Step-3: Run Command "npm start"

Issue:
---------
'lite-server' is not recognized as an internal or external command,
operable program or batch file.

Solution:
-------------
$ npm install lite-server -g

added 156 packages in 13s

8 packages are looking for funding
  run `npm fund` for details


$ npm fund
simpleNodeProj@1.0.0

Step-4: Re-run  "npm start" command on Git Bash

Step-5: Run Project as Docker Container


NodeJS Project with ACR(Azure Container Registry)
-----------------------------------------------------------------------
Step-1: Open Azure Cloud Shell and Run Command

$ az create group --name myResourceGroup --location eastus

$ az acr create --resource-group myResourceGroup --name shadabcontainerregistry --sku Basic

$ az acr update -n shadabcontainerregistry --admin-enable true

$ az acr credential show --name shadabcontainerregistry

Create New Pipeline and Edit YAML:
---------------------------------------------------
pool:
  name: Hosted Ubuntu 1604
  demands: npm

steps:
- task: NPM@1
  displayName: 'npm install'
  inputs:
    workingDir: .
    verbose: false

- script:
     docker build --rm -f Dockerfile -t simplenodeproject:latest
     docker image ls -a
     docker tag simplenodeproject:latest shadabcontainerregistry.azureecr.io/$(Build.Repository.Name):latest
     docker image ls -a
     docker login -u shadabcontainerregistry -p vhLRtTWNSqGgHcMsuFUvZ7+y6XqIuJUt+PZR+Pzc9r+ACRD9wu3H shadabcontainerregistry.azurecr.io
     docker push shadabcontainerregistry.azurecr.io/simplenodeproject:latest
  displayName: 'Docker Build and Push'

