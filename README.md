[![>>](https://circleci.com/gh/khairahscorner/UdacityMicroservicesProject.svg?style=svg)](https://app.circleci.com/pipelines/github/khairahscorner/UdacityMicroservicesProject)


# Udacity Cloud DevOps Engineer Nanodegree Project 4
My repo for the fourth nanodegree project - Operationalize a Machine Learning Microservice API.

## Summary
This project operationalises a Python flask app that serves out predictions (inference) about housing prices through API calls.

## Repo/Files Structure
It contains the following files/folders:
1. `.circleci` folder - CircleCI configuration
2. `output_txt_files` folder - Two `.txt` files with terminal results from running `run_docker.sh` and `run_kubernetes.sh`
3. `templates` folder - frontend templates for Flask app
4. `app.py` - Flask app
5. `run_docker.sh` - run Docker container locally
6. `run_kubernetes.sh` - run Docker container with Kubernetes (minikube)
7. `upload_docker` - upload Docker image to repository (DockerHub)
8. `make_prediction.sh` - run prediction POST requests
9. Others - `Dockerfile`, `Makefile`, `requirements.txt`

<br/>

## How to run (with AWS Cloud9)
1. Setup python virtual environment - run these commands:
```bash
python3 -m venv ~/.[name] # create python VE
source ~/.[name]/bin/activate #activate
```
(Replace `name` with preferred environment name)

2. Setup other requirements - Docker, Hadolint, Minikube
3. Install project dependencies and run lint checks for errors in Dockerfile
```bash
make install
make lint
```
4. Run a local container and test if app is successfully launched - ```./run_docker.sh```
5. Run prediction - ```./make_prediction.sh```
6. Upload Docker image to remote repository (DockerHub) - run script ```./upload_docker.sh```
7. Start minikube cluster - run ```minikube start```
8. Deploy container with Minikube - run script ```./run_kubernetes.sh```
9. Run prediction - ```./make_prediction.sh```
10. **(Extras)** Run puthon script alone - ```python app.py```

## How to run (Locally)
All steps as above, modify ```./run_kubernetes.sh``` script to match installed minikube configuration on your machine.

<br/>

### Built With
- [Amazon AWS](https://aws.amazon.com/) - Cloud services
- [AWS CLI](https://aws.amazon.com/cli/) - AWS Command-line tool
- [Cloud9](https://aws.amazon.com/cloud9/) - Cloud-based IDE
- [Circle CI](www.circleci.com) - Cloud-based CI/CD service
- [Docker](https://www.docker.com/) - Containerisation tool
- [Kubernetes](https://kubernetes.io/) - Container Orchestration tool
- [Minikube](https://minikube.sigs.k8s.io/docs/) - Run Kubernetes clusters locally
