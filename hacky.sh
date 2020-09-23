#!/bin/bash
# v1.7.32: change in operation
# v1.7.33: chart api server vpn sidecar split podnetwork
# v1.7.34: controllermanager chart add node cidr ipv6
# v1.7.35: chart shoot-core vpn-shoot, podcidr split
# v1.7.36: add svc dual net
# v1.7.37: chart proxy configmap add podnetwork
# v1.7.38: chart vpn-shoot/apisrv, svccidr split
# v1.7.39: fix typo in service network shoot-core chart
# v1.7.40: changed validation of nodeip from ipv4 to ipv4,ipv6
# v1.7.41: set ipFamily of node exporter service to ipv4
# v1.7.42: more changes to dualstack also in mcm and os provider
# v1.7.43: changed dualStack feature gate field
# v1.7.44: added featureGate field to shoot v1beta1
# v1.7.45: changed from pointer to direct reference
# v1.7.46: added json definition
# v1.7.47: executed make generate
# v1.7.48: executed make generate v2
# v1.7.49: added split for node cidrs
# v1.7.50: changed ingress dns prefix to i
# v1.7.51: updated validation
# v1.7.52: lil fix
# v1.7.53: updated kube-controller-manager chart that it wont crash on empty featureGates
# v1.7.54: "
# v1.7.55: "
# v1.7.56: "
# v1.7.57: changed IngressPrefix
# v1.7.58: rebuild
# v1.7.59: introduced validation change for seed cidrs
# v1.10.2: rebased to v1.10.1

EFFECTIVE_VERSION=v1.7.58
REGISTRY=registry.alpha.ske.eu01.stackit.cloud/gardener-ds
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
