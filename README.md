# Sean's Homelab

<!-- ANCHOR: introduction -->

[![license](https://img.shields.io/github/license/khuedoan/homelab?style=flat-square&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)

A rebuild of my homelab with some changes due to crazy domain price hikes and networking changes out of my control that bricked access to the nodes.

This project is built on top of [Khuedoan's homelab](https://github.com/khuedoan/homelab).


## Acknowledgements
- [Khuedoan's awesome homelab](https://github.com/khuedoan/homelab)

## Post Installation
Rocky linux gives available diskspace to /home, leaving root (/) with only 70GB of storage. As my nodes have a much larger disk size I manually resized the volumes to limit /home to 5GB and give all additional disk space to root.

'''
#Install  xfsdump and backup /home
yum -y install xfsdump
xfsdump -f /tmp/home.dump /home

#Unmount /home and remove the volume
umount /home
lvremove /dev/mapper/<vg name>-home

#Create a new volume for home, limited to 5GB, and restore the backup to it
lvcreate -L 5G -n home <vg name>
mkfs.xfs /dev/mapper/<vg name>-home
mount -a
xfsrestore -f /tmp/home.dump /home

#Extend the root volume to use the newly available space
lvextend -l +100%FREE /dev/<vg name>/root
xfs_growfs /dev/mapper/<vg name>-root
'''
