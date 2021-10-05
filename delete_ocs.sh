  oc get pods -n openshift-storage | grep -i cleanup
  for i in $(oc get node -l cluster.ocs.openshift.io/openshift-storage= -o jsonpath='{ .items[*].metadata.name }'); do oc debug node/${i} -- chroot /host  ls -l /var/lib/rook; done
  oc project default
  #oc delete project openshift-storage --wait=true --timeout=5m
  oc get project openshift-storage
  oc get pods -n openshift-storage | grep -i cleanup
  for i in $(oc get node -l cluster.ocs.openshift.io/openshift-storage= -o jsonpath='{ .items[*].metadata.name }'); do oc debug node/${i} -- chroot /host  ls -l /var/lib/rook; done
  oc project default
  
  oc get project openshift-storage
  oc delete crd backingstores.noobaa.io bucketclasses.noobaa.io cephblockpools.ceph.rook.io cephclusters.ceph.rook.io cephfilesystems.ceph.rook.io cephnfses.ceph.rook.io cephobjectstores.ceph.rook.io cephobjectstoreusers.ceph.rook.io noobaas.noobaa.io ocsinitializations.ocs.openshift.io  storageclusterinitializations.ocs.openshift.io storageclusters.ocs.openshift.io cephclients.ceph.rook.io cephobjectrealms.ceph.rook.io cephobjectzonegroups.ceph.rook.io cephobjectzones.ceph.rook.io cephrbdmirrors.ceph.rook.io --wait=true --timeout=5m
  oc delete project openshift-storage --wait=true --timeout=5m
  echo " You need to delete resourcess associated to openshift-storage as below"
# You need to delete resourcess associated to openshift-storage as below
# oc project openshift-storage
# oc get all
# oc api-resources --verbs=list --cached --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n openshift-storage
# oc patch -n openshift-storage storagecluster.ocs.openshift.io/ocs-storagecluster --type=merge -p '{"metadata": {"finalizers":null}}'
# oc api-resources --verbs=list --cached --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n openshift-storage
# oc patch -n openshift-storage cephcluster.ceph.rook.io/ocs-storagecluster-cephcluster --type=merge -p '{"metadata": {"finalizers":null}}'
# oc patch -n openshift-storage cephblockpool.ceph.rook.io/ocs-storagecluster-cephblockpool --type=merge -p '{"metadata": {"finalizers":null}}'
# oc api-resources --verbs=list --cached --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n openshift-storage
# oc patch -n openshift-storage backingstore.noobaa.io/noobaa-default-backing-store --type=merge -p '{"metadata": {"finalizers":null}}'
