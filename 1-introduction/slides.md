%title: KVM
%author: xavki


# KVM : Introduction


<br>
* hyperviseur = virtualisation de machine (y compris émulation de la partie hardware)
		* à la différence des conteneurs

* KVM = Kernel-based Virtual Machine

<br>
* transform un linux en hyperviseur de type 1

* hyperviseurs :
		* type 1 : plus proche du hardware
		* type 2 : installation d'une surcouche (par ex : sur un OS)

<br>
* embarqué dans le noyau linux depuis 2.6.20 (2006)

<br>
* sous réserve de processeurs supportant :
		* virtualisation VT-x des processeur Intel
		* SVM des processeur AMD

<br>
* KVM :
		* sécurité (selinux)
		* réseau
		* stockage et prise en charge de système de stockage externe
		* gestion de la mémoire (NUMA)
		* migration à chaud (entre hosts)

----------------------------------------------------------------------------------------------

# KVM : Introduction


<br>
* répartition des couches pour utiliser la virtualisation
		* noyau = kvm
		* userspace = libvirt (notamment virsh) + qemu

<br>
* libvirt = bibliothèque de virtualisation (redhat)

* libvirt permet :
		* KVM
		* Hyperviseur Xen
		* OpenVZ
		* VMware ESX

<br>
* QEMU :
		* émulateur
		* émuler des architectures (ARM, X86...)

<br>		
* utilisation KVM :
		* gui = virtual machine manager
		* ligne de commande virsh
		* fichier descriptif xml




