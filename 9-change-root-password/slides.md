%title: KVM
%author: xavki


# KVM : Installation via le Builder


<br>

* première méthode via guestfish

shutdown

guestfish --rw -a /var/lib/libvirt/images/ubuntu-1804.qcow2

openssl passwd -1 ubuntu

fs > launch
fs > list-filesystems
fs > mount /dev/sda1 /
fs > vi /etc/shadow
fs > quit


<br>
* sinon via virt-customize

virt-customize -a /var/lib/libvirt/images/debian9-vm1.qcow2 --root-password password:ubuntu2 --uninstall cloud-init
