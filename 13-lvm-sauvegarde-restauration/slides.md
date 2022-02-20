%title: KVM
%author: xavki


# KVM : LVM Snapshot Restauration


<br>

* snapshot

```
lvcreate -s -n <snapshot_name> -L <size> <logical_volume>
```

<br>

* restauration

```
lvconvert --mergesnapshot <snapshot_logical_volume>
```
