%title: KVM
%author: xavki


# KVM : premiere vm


* nat default

```
virsh net-list --all
virsh net-start default
virsh net-autostart default
virsh netdefine default.xml
```
