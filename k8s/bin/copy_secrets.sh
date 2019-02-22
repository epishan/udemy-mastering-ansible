#!/usr/bin/env bash

set -ex

kubectl exec -it control -- bash -c "mkdir -p /root/.ssh/ && cp -L /etc/ssh-key/id_rsa /root/.ssh/"

#copy control's pub key to slave nodes
kubectl exec -it app01 -- cp -L /etc/ssh-key/authorized_keys /root/.ssh/
kubectl exec -it app02 -- cp -L /etc/ssh-key/authorized_keys /root/.ssh/
kubectl exec -it lb01 -- cp -L /etc/ssh-key/authorized_keys /root/.ssh/
kubectl exec -it db01 -- cp -L /etc/ssh-key/authorized_keys /root/.ssh/
