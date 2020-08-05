%title: KVM
%author: xavki


# KVM : premiere vm virt install


virt-install -n ubuntu20-04 --description "xavki vm" --ram=10960 --vcpus=1 --disk path=/var/lib/libvirt/images/ubuntu-server.qcow2,bus=virtio,size=20 --network bridge=virbr0  --location /home/oki/Downloads/ubuntu-20.04-desktop-amd64.iso --vnc --noautoconsole --extra-args console=ttyS0
