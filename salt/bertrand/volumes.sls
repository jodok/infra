# volume id is from hetzner console 
/mnt/data:
    blockdev.formatted:
        - name: /dev/disk/by-id/scsi-0HC_Volume_104549705
    file.directory
        - user: root
        - group: root
        - mode: "0755"
    mount.mounted:
        - device: ID=scsi-0HC_Volume_104549705
        - fstype: ext4
        - mkmnt: True
        - persist: True
        - user: root
        - opts: discard,defaults
