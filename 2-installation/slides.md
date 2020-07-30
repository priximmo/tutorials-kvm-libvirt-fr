%title: KVM
%author: xavki


# KVM : Installation


<br>
* check de compatibilité

```
grep -E -c "vmx|svm" /proc/cpuinfo
sudo apt install -y cpu-checker
kvm-ok
```

<br>
* installation

```
sudo apt install -y qemu qemu-kvm libvirt-daemon bridge-utils virt-manager virtinst
```

* check module kernel

```
lsmod | grep -i kvm
```

<br>
* start libvirtd

```
sudo systemctl start libvirtd
sudo systemctl enable libvirtd --now
