%title: KVM
%author: xavki


# KVM : Réseau NAT et DHCP


<br>
* NAT : Network Administration Translation

* Pas d'accès direct > encapsulation supplémentaire pour router les paquets

* possibilité de fixer les ip via le DHCP

<br>
* liste des réseaux

```
virsh net-list --all
```

<br>
* dump d'un réseau

```
virsh net-dumpxml default
```

-----------------------------------------------------------------------------------

# KVM : Réseau NAT


<br>
* configuration d'un réseau

```
<network>
  <name>xavki</name>
  <forward mode='nat'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <bridge name='virbr1' stp='on' delay='0'/>
  <mac address='52:54:00:0a:cd:22'/>
  <ip address='192.168.123.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.123.2' end='192.168.123.254'/>
      <host mac='52:54:00:62:B1:22' name='myvm' ip='192.168.123.2'/>
    </dhcp>
  </ip>
  <dns enable='yes' />
</network>
```

-----------------------------------------------------------------------------------

# KVM : Réseau NAT


<br>
* création du nat

```
virsh net-define net-xavki.xml

virsh net-edit xavki

virsh net-list
virsh net-start xavki
virsh net-autostart xavki
```

<br>
* ajout ou suppression de machines (dhcp leases)

```
virsh net-update xavki add ip-dhcp-host "<host mac='52:54:00:62:b1:23' name='myvm2' ip='192.168.123.3' />" --live --config

virsh net-update xavki delete ip-dhcp-host "<host mac='52:54:00:62:b1:23' name='myvm2' ip='192.168.123.3' />" --live --config
```

<br>
```
virsh net-dhcp-lease xavki
ls /var/lib/libvirt/dnsmasq/
```
