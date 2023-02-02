# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation

## Terraform

The following steps are how to deploy terraform code for GCP. You need to have a GCP project up and running for this.

1. `terraform init`
2. `terraform apply -var "project=<YOUR-PROJECT-ID>"` & and type 'yes'

The setup of GKE and node pools take a while so wait until they are set up.

## Helm

1. Install the chart: `helm install helm-charts/todo-app --name-template test`
2. Uninstall the chart: `helm uninstall test`
3. Upgrade an image with the chart (example of upgrading todo-app-ui image):
` helm upgrade test ./helm-charts/todo-app --set todo-app-ui.image.tag=1.0.3`

## RBAC

We have created the following three roles:

1. readonly -- A readonly role that is meant to only allow to list and view specific resources in the cluster.

2. developer -- A role meant for the developers. The developer can read and update several resources and also
read all the core API resources.

3. contract-developer -- A role meant for contract developers who only work on certain projects. The role provides
a read, create and update permissions to specific resources in a specific namespace meant for the project.