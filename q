# DOCUMENTATION
# https://www.debian.org/releases/stretch/i386/apbs04.html.fr
# https://www.debian.org/releases/squeeze/example-preseed.txt


### Set hostname and domain ###
d-i netcfg/get_hostname string xavkihost
d-i netcfg/get_domain string local

### Set mirror ###
d-i mirror/country string manual
d-i mirror/http/hostname string http.us.debian.org
d-i mirror/http/directory string /debian
d-i mirror/http/proxy string

### Clock ###
d-i clock-setup/utc boolean true
d-i time/zone string Europe/Paris

### Locales ####
d-i debian-installer/locale select en_US
d-i console-setup/ask_detect boolean false
d-i keyboard-configuration/xkb-keymap select fr(latin9)

### Users ###
d-i passwd/root-login boolean false
d-i passwd/user-fullname string Xavki User
d-i passwd/username string xavki
d-i passwd/user-password password xavki
d-i passwd/user-password-again password xavki
d-i user-setup/allow-password-weak boolean true

### Partitioning ###

partman-auto partman-auto/disk string /dev/[sv]da
partman-auto partman-auto/method string lvm
#partman-auto partman-auto/choose_recipe select recettelvm
#partman-auto-lvm partman-auto-lvm/vg_xavki string bulbe

partman-auto partman-auto/expert_recipe string \
		boot-root :: \
		128 256 256 ext4\
		$defaultignore{ }\
		method{ format }\
		format{ }\
		use_filesystem{ }\
		filesystem{ ext4 }\
		mountpoint{ /boot }\
		.\
		1024 1024 1024 swap \
		$defaultignore{ } \
		$lvmok{ } \
		format{ } \
		lv_name{ swap } \
		method{ swap } \
		. \
		2056 10240 10240 ext4\
		$defaultignore{ } \
		$lvmok{ } \
		lv_name{ root } \
		method{ format } \
		format{ } \
		use_filesystem{ } \
		filesystem{ ext4 } \
		mountpoint{ / } \
		. \
		4096 10240 100% ext4\
		$defaultignore{ } \
		$lvmok{ } \
		lv_name{ var } \
		method{ format } \
		format{ } \
		use_filesystem{ } \
		filesystem{ ext4 } \
		mountpoint{ /var } \
                .

### Confirm partitioning ###
#partman-auto/disk string /dev/vda
#partman-auto/method string lvm
#partman-auto/purge_lvm_from_device  boolean true

#partman-lvm/device_remove_lvm boolean true
#partman-lvm/device_remove_lvm_span boolean true


d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true
d-i partman-auto-lvm/guided_size string max

#partman/confirm_write_new_label boolean true
#partman-partitioning/confirm_write_new_label boolean true

d-i partman/choose_partition select Finish partitioning and write changes to disk
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true


### Grub ###
d-i grub-installer/only_debian boolean false
d-i grub-installer/bootdev string /dev/vda

### Kernel command ###
d-i debian-installer/add-kernel-opts string console=ttyS0,115200n8 serial
d-i finish-install/keep-consoles boolean true


### Mode ###
tasksel tasksel/first multiselect standard ssh-server

popularity-contest popularity-contest/participate boolean false
d-i finish-install/reboot_in_progress note
