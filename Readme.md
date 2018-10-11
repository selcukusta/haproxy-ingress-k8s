# HAProxy Ingress Controller for Kubernetes (Sample)

## Play
> Run `k8s/init.sh`.

> Look for `nodePort` field next to `port: 80`.

> Run `minikube status` and get ip address. *(kubectl: Correctly Configured: pointing to minikube-vm at `192.168.99.104`)*

> Run `kubectl --namespace=ingress-controller get pods -w` and wait for all pods will be started.

> Run `curl -i (IP_ADDRESS):(PORT)`. You will see  *`default backend - 404`*.

> Run `curl -i (IP_ADDRESS):(PORT) -H 'Host: foo.bar'`. You will see *`service-sample-1`*.

## Resources
[HAProxy Ingress Controller for Kubernetes](https://www.haproxy.com/blog/haproxy_ingress_controller_for_kubernetes/)

[HAProxy-Ingress (Github Repository)](https://github.com/jcmoraisjr/haproxy-ingress)