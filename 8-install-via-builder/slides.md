%title: KVM
%author: xavki


# KVM : Installation via le Builder



<br>
* outil de build de VM = virt-builder

* builder > qcow2 (image) > run (VM)

Documentation: https://libguestfs.org/virt-builder.1.html

<br>
* liste des images disponibles

```
virt-builder --list
```

<br>
* détail sur une image

```
virt-builder --note ubuntu-18.04
```

<br>
* build d'un qcow2 (image disk)

```
sudo virt-builder ubuntu-18.04 --size=20G --format qcow2 -o /var/lib/libvirt/images/ubuntu-1804.qcow2 --hostname ubuntu --network --timezone Europe/Paris
```

<br>
* installation de la VM

```
sudo virt-install --import --name ubuntu1804 --ram 2048 --vcpus 2 --disk /var/lib/libvirt/images/ubuntu-1804.qcow2,format=qcow2 --os-variant ubuntu18.04 --network default --noautoconsole
```

Remarque pour trouver le nom de l'os :

```
osinfo-query os | grep ubuntu
```
