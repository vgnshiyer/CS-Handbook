### Operating System fundamentals

Click [here](https://github.com/vgnshiyer/CS-Handbook/blob/main/Operating%20System/OperatingSystem_notes.pdf) for notes in PDF format.

Some more information:

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
