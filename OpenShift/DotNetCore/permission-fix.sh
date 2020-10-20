## There is a known issue with the CA image 20.6 and 20.7. 
## You either need to give the service account anyuid SCC or change the uid range for the project (appdynamics) to include 1001

oc adm policy add-scc-to-user anyuid -z <namespace>

# for example:
oc adm policy add-scc-to-user anyuid -z appd-dotnet-project