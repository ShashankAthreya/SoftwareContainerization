# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation

## Terraform

We use Terraform to create the GKE cluster, node pool for the cluster and a static IP for the ingress to use.

The following steps are how to deploy terraform code for GCP. You need to have a GCP project up and running for this.
Make sure you are first authenticated properly with the gcloud auth (`gcloud auth login`).

1. `terraform init`
2. `terraform apply -var "project=<YOUR-PROJECT-ID>"`

The setup of GKE and node pools take a while so wait until they are set up.

### Cleanup

Run `terraform destroy -var "project=<YOUR-PROJECT-ID>` to destroy all the created cloud resources.

## Helm

1. Install the chart: `helm install helm-charts/todo-app --name-template demo`
2. Uninstall the chart: `helm uninstall demo`
3. Upgrade an image with the chart (example of upgrading todo-app-ui image):
`helm upgrade demo ./helm-charts/todo-app --set todo-app-ui.image.tag=1.0.3`

When installing the chart to a GKE cluster, do note that the ingress set up takes a couple of minutes.

## GKE

Run the following command to fetch the credentials for the GKE cluster:
`gcloud container clusters get-credentials vu-sc --region europe-west4-a `

## TLS/SSL Certificate

We create it using openssl in ./certs/.
1. `openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 5 -nodes -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=VU/OU=Education/CN=<INSTANCE-IP>/emailAddress=<EMAIL>"`


## RBAC

We have created the following three roles:

1. readonly -- A readonly role that is meant to only allow to list and view specific resources in the cluster.

2. developer -- A role meant for the developers. The developer can read and update several resources and also
read all the core API resources.

3. contract-developer -- A role meant for contract developers who only work on certain projects. The role provides
a read, create and update permissions to specific resources in a specific namespace meant for the project.

   
## Presentation guides

### Show how to deploy the application for the first time

### Show how to scale the application horizontally

### Show how to uninstall the application

### Re-building the application after a source code change

1. Build and push a new version of the image: `docker build --push -t andersnou/todo-app-ui:2.0.0 .`
   1.  For M1 CPU: `docker buildx build --platform linux/amd64 --push -t andersnou/todo-app-ui:2.0.0 .`
2. Upgrade the helm chart: `helm upgrade demo ./helm-charts/todo-app --set todo-app-ui.image.tag=2.0.0 -n todo-app`


### Upgrade application - Deployment rollout

1. Change the version of the image -- either by modifying the `values.yaml` or passing as a parameter.
   1. Pass the value: `helm upgrade demo ./helm-charts/todo-app -n todo-app --set todo-app-api.image.tag=2.0.0`
   2. Or by changing the file: `helm upgrade demo ./helm-charts/todo-app -n todo-app`

### Upgrade application - Canary update

Deploys X/2 number of canary pods where X is the number of pod replicas for the application. E.g.
X=4, then 4 pods are deployed for the application and 2 canary pods are deployed during deployment. Meaning that
33% of the traffic is routed to canary pods.

1. Deploy the canary pods: `helm upgrade demo ./helm-charts/todo-app -n todo-app --set todo-app-ui.canary.create=true --set todo-app-ui.canary.tag=2.0.0`
2. Validate that the new version is working
3. Change the image version of the UI to 2.0.0 in the `values.yaml`
4. Delete the canary pods: `helm upgrade demo ./helm-charts/todo-app -n todo-app --set todo-app-ui.canary.create=false`