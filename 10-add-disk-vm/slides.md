%title: KVM
%author: xavki


# KVM : Ajouter un disk


<br>


* sur la VM petits checks :

```
sudo fdisk -l
lsblk
```

<br>


* sur le host - création d'un disk à attacher :

```
cd /var/lib/libvirt/images
sudo qemu-img create -f raw ubuntu-2004-disk1-5G 5G
```

Rq : raw ou qcow2 (raw = universel ou qcow = snapshot etc)

<br>


* sur le host - attacher le disk à la VM :

```
virsh attach-disk ubuntu20.04 --source /var/lib/libvirt/images/ubuntu-2004-disk1-5G --target vdb --persistent
```

----------------------------------------------------------------------------------------------

# KVM : Ajouter un disk

<br>


* sur la VM - patitioning du disk :

```
sudo fdisk -l
sudo fdisk /dev/vdb
n > p ...
```

Rq : changement de type de partition si nécessaire

<br>


* création du file système (possibilité d'étendre le FS existant avec LVM - PV > VG > LV)

```
sudo mkfs.ext4 /dev/vdb1
sudo mkdir /data
#sudo mount -t ext4 /dev/vdb1 /data
```

<br>


* écriture dans le fstab - en dur : 

```
vim /etc/fstab
/dev/vdb1       /data   ext4    defaults        0       0
```
