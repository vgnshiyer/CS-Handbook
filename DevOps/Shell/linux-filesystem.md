# Linux File system

MSDOS - earlier command line os - windows used to be installed on top of DOS..

Later Microsoft got rid of DOS. Their kernel stopped depending on DOS.

Windows has the program files dir for installing anything by default.

Linux uses FHS: Filesystem heirarchy standard.

Folder names:

`bin`: binaries, programs or applications

`sbin`: system binaries that the sysadmin would use. --> used in single user mode (admin)

`boot`: boot loaders live here

`dev`: 'devices' --> hardware (eg. disk = /dev/sda) You can find everything from webcam to keyboard --> used by applications

`etc`: etcetera --> all configs are stored (system wide configs)

`home`: each user has their own folder

`lib`: (lib32 and lib64) --> where the libraries are stored --> used by apps to performs specific functions

`/media or /mnt`: other mounted drives are found here (floppy disk, network drive, etc)

`opt`: optional folder -> manually installed software from vendors

`proc`: sudo files that contain info about system processes and resources (eg. every process will have a dir with all sorts of info)

`root`: root user's home folder --> need root permissions to access files in root

`run`: tempfs file system -> runs in RAM --> all process is gone when reboot

`srv`: service directory --> if u run a ftp server, you will store the files that will be shared here.

`sys`: way to interact with the kernel

`tmp`: temporary stored files by the application (manually delete if consuming lot of space)

`usr`: applications used by user will be installed here (/usr/bin, /usr/local/bin) with libraries stored in (/usr/lib, /usr/local/lib)

`var`: variable directory -> files that are variable and expected to grow in size

`.`: dotfiles are used to store temporary data by apps

`.config`: config files for applications will be stored here


A disk is assigned a specific number of inodes. inodes are a data structure that stores information about a file or a directory. Each inode stores attributes of the file, disk block location of the objects data. (pointers to disk blocks to store file's content.) Inodes dont store filename or file data. Filenames are linked to the inode by a separate directory listing. Each filesystem is assigned a fixed number of available inodes. You can check the available inodes using the `df -i` command.

Inodes are metadata. Each file or directory requires one inode to store its metadata. Hard links to a file refer to the same inode. Hard link is essentially another filename associated with the same inode. -> Multiple hard link do not increase indoe usage.

All inodes are used: In Unix-like operating systems, each file or directory uses an inode to store its metadata. The number of inodes is set when the filesystem is created and is fixed. If all inodes are used (i.e., the maximum number of files or directories has been reached), no new files can be created, even if there is still disk space available.

Hard links: A hard link is essentially an additional name for an existing file on linux. All hard links refer to the same physical location on the disk. deleting a file, file is still accessible via the hard link.

Soft links: A special type of file serves as a reference to another file. File that points to another file. Deleting the file causes the link to be broken.
