# rookmultisite
rook multisites PoC

#Enable debig log

The debug can be enabled for rook-ceph-operator by adding the ROOK_LOG_LEVEL: DEBUG in the rook-ceph-operator-config configmap.

$ oc edit cm rook-ceph-operator-config

...

data:
 
 ROOK_LOG_LEVEL: DEBUG
  

# Site A

oc patch OCSInitialization ocsinit -n openshift-storage --type json --patch  '[{ "op": "replace", "path": "/spec/enableCephTools", "value": true }]'

oc project openshift-storage

oc create -f object-multisite-openshift.yaml

oc get CephObjectRealm

oc get services 

oc expose service rook-ceph-rgw-multisite-store

oc get routes

radosgw-admin zone modify zone-onprem --endpoints="http://rook-ceph-rgw-multisite-store-openshift-storage.apps.cluster-022d.022d.sandbox1648.opentlc.com"

$ oc rsh rook-ceph-tools-798b4968cc-s2pr6

sh-4.4$ radosgw-admin zone modify zone-onprem --endpoints="http://rook-ceph-rgw-multisite-store-openshift-storage.apps.cluster-022d.022d.sandbox1648.opentlc.com"

sh-4.4$ radosgw-admin zonegroup get

................

"endpoints": [

"http://rook-ceph-rgw-multisite-store-openshift-storage.apps.cluster-022d.022d.sandbox1648.opentlc.com"

],

......

sh-4.4$ radosgw-admin zone get

oc get secret realm-jccm-keys -o yaml > realm-jccm-keys.yaml

-----------

cat realm-jccm-keys.yaml 

apiVersion: v1

data:

access-key: VVQ1UVJ6cDdkelphYWk5dVFFQT0=

secret-key: WGp0RFFHeEFTWFpaWW5kYVhqZHJNaXd1S2xGbVNGVmJma01qSlE9PQ==

kind: Secret
metadata:
  name: realm-jccm-keys
  namespace: openshift-storage
type: kubernetes.io/rook

------- 
