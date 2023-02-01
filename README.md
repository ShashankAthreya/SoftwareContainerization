# Software Containerisation
This repository is contains the code and images for the assignment of Software Containerisation

## Deployment

`helm install helm-charts/todo-app --generate-name`

## RBAC

We have created the following three roles:

1. readonly -- A readonly role that is meant to only allow to list and view specific resources in the cluster.

2. developer -- A role meant for the developers. The developer can read and update several resources and also
read all the core API resources.

3. contract-developer -- A role meant for contract developers who only work on certain projects. The role provides
a read, create and update permissions to specific resources in a specific namespace meant for the project.