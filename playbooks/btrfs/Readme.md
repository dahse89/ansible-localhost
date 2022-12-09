# Snapper + Grub BTRFS

To make sue of this you need to have the correct partitioning.
The is to create, while the installation process:

- one EFI partition
- one boot partition
- one BTRFS partition

The BTRFS partition can have multiple subvolumes and must have `/.snapshots` and `/var` subvolume.
*The `/var` is because the playbook will try to disable copy on write there (for databases etc);

`/etc/fstab` should look like this.
```
# UUID=[..] /           btrfs   defaults,x-systemd.device-timeout=0 0 0",
# UUID=[..] /.snapshots btrfs   subvol=snapshots,compress=zstd:1,x-systemd.device-timeout=0 0 0",
# UUID=[..] /home       btrfs   subvol=home,compress=zstd:1,x-systemd.device-timeout=0 0 0",
# UUID=[..] /opt        btrfs   subvol=opt,compress=zstd:1,x-systemd.device-timeout=0 0 0",
# UUID=[..] /tmp        btrfs   subvol=tmp,compress=zstd:1,x-systemd.device-timeout=0 0 0",
# UUID=[..] /usr/local  btrfs   subvol=usr-local,compress=zstd:1,x-systemd.device-timeout=0 0 0",
# UUID=[..] /var        btrfs   subvol=var,compress=zstd:1,x-systemd.device-timeout=0 0 0"
```