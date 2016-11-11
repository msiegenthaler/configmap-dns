BIND DNS Server for Kubernetes
==============================

A bind server that is configured using a configmap in Kubernetes.

It is intended for ingresses where you don't want to enter the DNS configuration elsewhere.
Mostly used for demos and tests (i.e. *.demo.mydomain.com).


Upstream DNS setup (i.e. in the DNS configuration for mydomain.com):

    NS mysubdomain               3600 IN NS    your.kubernetes.node.ip.address.
