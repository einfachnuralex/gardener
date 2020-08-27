#!/bin/bash
# v1.7.32: change in operation
# v1.7.33: chart api server vpn sidecar split podnetwork
# v1.7.34: controllermanager chart add node cidr ipv6
# v1.7.35: chart shoot-core vpn-shoot, podcidr split
# v1.7.36: add svc dual net
# v1.7.37: chart proxy configmap add podnetwork
# v1.7.38: chart vpn-shoot/apisrv, svccidr split
# v1.7.39: fix typo in servicenetwork shoot-core chart

EFFECTIVE_VERSION=v1.7.39
REGISTRY=einfachnuralex
APISERVER_IMAGE_REPOSITORY=$REGISTRY/apiserver
CONROLLER_MANAGER_IMAGE_REPOSITORY=$REGISTRY/controller-manager
SCHEDULER_IMAGE_REPOSITORY=$REGISTRY/scheduler
SEED_ADMISSION_IMAGE_REPOSITORY=$REGISTRY/seed-admission-controller
GARDENLET_IMAGE_REPOSITORY=$REGISTRY/gardenlet

docker build --build-arg EFFECTIVE_VERSION=$EFFECTIVE_VERSION -t $APISERVER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         -f Dockerfile --target apiserver .
docker build --build-arg EFFECTIVE_VERSION=$EFFECTIVE_VERSION -t $CONROLLER_MANAGER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION -f Dockerfile --target controller-manager .
docker build --build-arg EFFECTIVE_VERSION=$EFFECTIVE_VERSION -t $SCHEDULER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         -f Dockerfile --target scheduler .
docker build --build-arg EFFECTIVE_VERSION=$EFFECTIVE_VERSION -t $SEED_ADMISSION_IMAGE_REPOSITORY:$EFFECTIVE_VERSION    -f Dockerfile --target seed-admission-controller .
docker build --build-arg EFFECTIVE_VERSION=$EFFECTIVE_VERSION -t $GARDENLET_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         -f Dockerfile --target gardenlet .

docker push $APISERVER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         
docker push $CONROLLER_MANAGER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION 
docker push $SCHEDULER_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         
docker push $SEED_ADMISSION_IMAGE_REPOSITORY:$EFFECTIVE_VERSION    
docker push $GARDENLET_IMAGE_REPOSITORY:$EFFECTIVE_VERSION         
