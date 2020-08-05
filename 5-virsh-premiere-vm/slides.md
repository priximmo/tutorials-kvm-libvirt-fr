%title: KVM
%author: xavki


# KVM : premiere vm virsh


<br>
* liste des machines

```
virsh list --all
```

<br>
* création du disk

```
sudo truncate -s 25G /var/lib/libvirt/images/xavki20.04.iso
```

<br>
* dump du xml

```
virsh dumpxml ubuntu20.04 > create-vm.xml
```
------------------------------------------------------------------------------

# KVM : premiere vm virsh

<br>
* modification du xml

```
<name>xavki20.04</name>
<boot dev='cdrom'/>

  <disk type='file' device='disk'>
      <driver name='qemu' type='raw'/>
      <source file='/var/lib/libvirt/images/xavki20.04.iso'/>
      <target dev='vda' bus='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x00' function='0x0'/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <source file='/home/oki/Downloads/ubuntu-20.04-desktop-amd64.iso'/>
      <target dev='sda' bus='sata'/>
      <readonly/>
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
    </disk>
```

<br>
* création

```
virsh create create-vm.xml
```
