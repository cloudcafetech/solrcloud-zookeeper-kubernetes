#!/bin/bash
# SolrCloud Setup on K8s

kubectl create configmap solr-config --from-env-file=solr-config.properties 
kubectl create configmap zookeeper-config --from-env-file=zookeeper-config.properties 

kubectl get configmap

kubectl apply -f storageclass-solrcluster.yml
kubectl apply -f storageclass-zkensemble.yml

kubectl apply -f statefulset-zookeeper.yml

sleep 5

kubectl apply -f service-zookeeper.yml

kubectl apply -f statefulset-solr.yml

sleep 5

kubectl apply -f service-solr.yml

kubectl get pod
kubectl get deployment
kubectl get service

echo "created solr and zookeeper statefulsets"
echo "created solr and zookeeper services"
echo ""
