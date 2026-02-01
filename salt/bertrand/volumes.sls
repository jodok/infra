# volume id is from hetzner console 
/dev/disk/by-id/scsi-0HC_Volume_104549705:
  blockdev.formatted: []

/mnt/data:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"
  mount.mounted:
    - device: /dev/disk/by-id/scsi-0HC_Volume_104549705
    - fstype: ext4
    - mkmnt: True
    - persist: True
    - user: root
    - opts: discard,defaults
    - require:
      - blockdev: /dev/disk/by-id/scsi-0HC_Volume_104549705
      - file: /mnt/data