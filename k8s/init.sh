#!/usr/bin/env bash
openssl req \
    -x509 -newkey rsa:2048 -nodes -days 365 \
    -keyout tls.key -out tls.crt -subj '/CN=localhost'
kubectl create secret tls tls-secret --cert=tls.crt --key=tls.key
rm -v tls.crt tls.key
kubectl create -f 1-ingress-controller-rbac.yml
kubectl create -f apps/2-default-app.yml
kubectl create -f apps/3-basic-app.yml
kubectl --namespace=ingress-controller create configmap haproxy-ingress
kubectl create -f 4-haproxy-ingress.yml
kubectl --namespace=ingress-controller expose deploy/haproxy-ingress --type=NodePort
kubectl create -f 5-ingress.yml
kubectl --namespace=ingress-controller get svc/haproxy-ingress -oyaml