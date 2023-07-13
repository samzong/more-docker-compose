#!/bin/bash


# add chart repo
#helm repo add ghippo-release https://release.daocloud.io/chartrepo/ghippo

export DCE_PROXY="https://10.211.55.101:32088"
#export DCE_PROXY="https://192.168.31.33:32088"

export GHIPPO_VALUES_BAK="ghippo-values-bak.yaml"
export GHIPPO_HELM_VERSION=$(helm get notes ghippo -n ghippo-system | grep "Chart Version" | awk -F ': ' '{ print $2 }')

helm get values ghippo -n ghippo-system -o yaml > ${GHIPPO_VALUES_BAK}

yq -i ".global.reverseProxy = \"${DCE_PROXY}\"" ${GHIPPO_VALUES_BAK}

helm upgrade ghippo ghippo-release/ghippo \
  -n ghippo-system \
  -f ${GHIPPO_VALUES_BAK} \
  --version ${GHIPPO_HELM_VERSION}


kubectl rollout restart deploy/ghippo-apiserver -n ghippo-system
kubectl rollout restart statefulset/ghippo-keycloakx -n ghippo-system

rm -f $GHIPPO_VALUES_BAK
