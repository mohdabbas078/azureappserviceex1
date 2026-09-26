# Build image locally

docker build -t first-app:latest .

# Run container locally

docker run -d -p 5000:5000 --name first-app first-app:latest

# Push to Azure Container Registry (ACR)
# 1) Log in to Azure
az login
az account set --subscription "<your-subscription-name-or-id>"

# 2) Log in to ACR
az acr login --name <acr-name>

# 3) Tag image for ACR

docker tag first-app:latest mywebappcontainerregistry.azurecr.io/first-app:latest

docker tag first-app:latest testcontainerinstanceregistry.azurecr.io/first-app:latest

# 4) Push image to ACR

docker push mywebappcontainerregistry.azurecr.io/first-app:latest

# Push to Docker Hub
# 1) Log in to Docker Hub

docker login

az acr login --name testcontainerinstanceregistry.azurecr.io

# 2) Tag image for Docker Hub

docker tag first-app:latest <dockerhub-username>/first-app:latest

# 3) Push image to Docker Hub

docker push <dockerhub-username>/first-app:latest

# Optional: view running containers

docker ps

# Optional: remove old containers/images if needed
# docker rm -f first-app
# docker rmi first-app:latest






az containerapp env show --resource-group my-rg --name managedEnvironment-myrg-b4e7

az containerapp env delete --resource-group my-rg --name managedEnvironment-myrg-b4e7 --yes

az containerapp env storage list --resource-group my-rg --name managedEnvironment-myrg-b4e7

az rest --method delete --url "https://azure.com/f9d7f95d-2d51-4ede-8b25-a258f7c01c30/resourceGroups/my-rg/providers/Microsoft.App/managedEnvironments/managedEnvironment-myrg-b4e7?api-version=2024-03-01"

az rest --method delete --url "https://azure.com"

### Forcefully delete the managed environment using the REST API
# 1. Save the Resource ID into a variable
RESOURCE_ID=$(az containerapp env show --resource-group my-rg --name managedEnvironment-myrg-b4e7 --query id --output tsv)

# 2. Run the rest delete command using that variable
az rest --method delete --url "https://management.azure.com${RESOURCE_ID}?api-version=2024-03-01"

