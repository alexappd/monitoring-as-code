# Cluster Agent Helm Chart

### 1 - Add AppDynamics helm repo
```bash
helm repo add appdynamics-charts https://appdynamics.github.io/appdynamics-charts
```

### 2 - Create values yaml to override default ones
```yaml
imageInfo:
  agentImage: docker.io/appdynamics/cluster-agent
  agentTag: 20.7.0
  operatorImage: docker.io/appdynamics/cluster-agent-operator
  operatorTag: latest
  imagePullPolicy: Always                             

controllerInfo:
  url: <controller-url>
  account: <controller-account>
  username: <controller-username>
  password: <controller-password>
  accessKey: <controller-accesskey>

agentServiceAccount: appdynamics-cluster-agent
operatorServiceAccount: appdynamics-operator
```

#### Note:
For more details and config options please visit official documentation
[here](https://docs.appdynamics.com/display/PRO45/Deploy+the+Cluster+Agent+with+Helm+Charts).

### 3 - Install cluster agent using helm chart

Apply multiple value files and set access-key secret:
`helm install --set controllerInfo.accessKey="c5c7e458-MY-CONTROLLER-KEY-099868f11869" --set clusterAgent.appName="auto-instrumentation-label"  cluster-agent appdynamics-charts/cluster-agent -f 1-values-master.yaml -f 2-values-secrets.yaml -f 3-values-controller-prod.yaml -f 4-values-master-auto-instr.yaml  --namespace appdynamics-helm`

### 4 - Additional commands 

#### Update values
`helm upgrade cluster-agent appdynamics-charts/cluster-agent -f values.yaml --namespace appdynamics-helm`

#### Delete chart
`helm delete cluster-agent --namespace appdynamics-helm`


