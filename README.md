# Intro
This is a wordpress app running with Mysql database. This project is used as example.

## Configurations
Below are the details about applications

### Database
It's a Mysql deploy, using an external volume, the storage class can be editable in a real scenario, always using the faster type, normally a ssd type.
It's using a high availability statefulset, to update replicas is just add more replicas on `3-statefulset.yaml` in the field `replicas=0`.
The doc based it's [here](https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/).
This stateful set have:
  - Replica
  - Backups
  - Read-only
  - High Availability
  - Fixed Mysql version


### Wordpress
There are no secrets here, it's been following this [doc](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/).
It was configured an auto-scaling rule based on CPU usage. The app are going to scale when cpu is higher than 50 percent, with 10 pods as limit.
The app is using a extra volume to save docs.

# Running
## Local
### Pre-requirements
  - kubectl
  - kind or minikube
  - kustomize

### Steps
Clone this repository
`git clone git@github.com:juliocesarback/basic-app.git`

Go to directory
` cd basicwordpress`

Start a local cluster
  - Kind
  `kind create cluster my-cluster`
  - Minikube
  `minikube start`

Run a kustomize app
  `kubectl apply -k ./`

This command will create some kubernetes manifests, all in the same namespace.

## Google Cloud Platform
### Pre-requisites
  - Google Cloud SDK
  - terraform cli (at least 13.5)
  - Create a new service account with full permission on project
  - Enable compute, container api's

### Steps
To run, it's just necessary login with your google account and exec default terraform commands
```
terraform init
terraform validate (optional)
terraform plan (put a valid project id)
terraform apply (put a valid project id)
```

## Terraform
The terraform scripts are configured to be simple. In the future, this script can be separated by environments and maybe using a backend file on bucket in Google Storage.

# Future improvements

## Database
  - [ ] Random secret
  - [ ] Secret storaged on Google Secret Manager
  - [ ] Monitoring with grafana

## App
  - [ ] Istio as service mesh
  - [ ] Monitoring with Prometheus and Grafana
  - [ ] APM and Error tracking with Sentry

## Terraform
  - [ ] Run in Azure
  - [ ] Run in AWS
  - [ ] Add input files
  - [ ] Remote backend

