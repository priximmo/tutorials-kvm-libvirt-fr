%title: KVM
%author: xavki


# KVM : Accès remote


<br>

Image utilisée : debian-11.2.0-amd64-netinst.iso

Etapes :

		* installation du kvm

		* ajout de SSH

		* intégration dans virt-manager

-------------------------------------------------------------------

# KVM : Accès remote


<br>

* vérification

```
grep -E -c "vmx|svm" /proc/cpuinfo
sudo apt install -y cpu-checker
kvm-ok
```

-------------------------------------------------------------------

# KVM : Accès remote

<br>

* installation

```
sudo apt install -y qemu qemu-kvm libvirt-daemon bridge-utils virt-manager virtinst
```

-------------------------------------------------------------------

# KVM : Accès remote

<br>

* check du module

```
lsmod | grep -i kvm
```


<br>

* start libvirtd

```
sudo systemctl start libvirtd
sudo systemctl enable libvirtd --now
```

-------------------------------------------------------------------

# KVM : Accès remote

<br>

* ajout de sudo + nopassword

<br>

* ajout d'une clef ssh

<br>

* intégration à virt-manager

```
sudo usermod -aG libvirt xavki
```
