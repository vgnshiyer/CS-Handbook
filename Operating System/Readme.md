### Operating System fundamentals

Click [here](https://github.com/vgnshiyer/CS-Handbook/blob/main/Operating%20System/OperatingSystem_notes.pdf) for notes in PDF format.

### Some more information:

##### What is the /proc folder on linux?

The /proc directory in Linux is a virtual filesystem that provides a way to interact with and obtain information about processes and the kernel. It doesn't actually contain physical files on the disk; rather, it dynamically generates information based on the current state of the running system. This directory is used as an interface to access and manipulate various kernel and process-related information.

Inside the /proc directory, you'll find a series of numbered subdirectories, each corresponding to a process ID (PID). Within these subdirectories, you'll find files and subdirectories that represent various aspects of the corresponding process or kernel information.

Some common uses of the /proc directory include:

Process Information: You can access information about each running process by navigating into the corresponding PID directory. Information such as process status, environment variables, command-line arguments, file descriptors, and more can be found here.

Kernel Information: The /proc directory provides a wealth of information about the running Linux kernel, including parameters, statistics, and configurations. This information can be useful for debugging and tuning the kernel.

System Information: Information about the system as a whole can be found in files like /proc/meminfo (memory usage statistics), /proc/cpuinfo (CPU information), and /proc/version (kernel version).

Network Information: The /proc/net directory contains information about various network protocols and connections.

Hardware Information: The /proc/driver directory contains information about different device drivers in use by the system.

Virtual Files: Some files in the /proc directory are virtual and can be used to change kernel parameters, interact with devices, and perform various system-related actions.

Keep in mind that the content and structure of the /proc directory can vary depending on the Linux distribution and kernel version you're using. It's a powerful tool for system administrators, developers, and users who need to gather information about processes and the kernel without delving into complex kernel internals.

**/lib Directory:**

The /lib directory contains essential shared libraries (also known as dynamic link libraries) that are required by programs and system utilities.
Shared libraries contain code that multiple programs can use simultaneously, saving memory and storage space.
These libraries provide functions and routines that programs can use to perform common tasks, such as I/O operations, memory management, and more.
Examples of shared libraries include libc, which is the C library, and other libraries that various applications depend on.
The contents of the /lib directory are crucial for the proper functioning of the system and its applications.

**/tmp Directory:**

The /tmp directory is used as a temporary storage location for files and data that are only needed temporarily.
It's typically a place where programs can create temporary files during their execution.
Files stored in /tmp are not intended to persist across system reboots, and the system may periodically clean up its contents.
Users and programs can write to the /tmp directory to quickly share data or store intermediate files.
However, because files in /tmp are generally short-lived, it's important to ensure that important data isn't stored there, as it might get deleted during cleanup processes.
Both /lib and /tmp serve important roles in the Linux filesystem hierarchy, contributing to the proper functioning of the system and providing convenient storage for temporary data.

**/etc/resolv.conf**

This file is used by the Domain Name Server to resolve a domain to IP address. It consists of a list of domain names that the DNS can use to resolve a domain name entered by the user. User might enter just one word, the DNS will append all the available search strings from the resolv.conf to resolve the domain name to the IP address of the servers.

kill -15 sends a TERM signal, which attempts to gracefully stop a process. It is the default.
kill -1 sends a HUP signal, which reloads a process.
kill -9 sends a KILL signal, which kills a process.
