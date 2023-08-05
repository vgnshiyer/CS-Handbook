# Docker important concepts

##### Define containerization
[Containerization](https://intellipaat.com/blog/what-is-containerization/) is a form of virtualization through which applications are run in containers (isolated user spaces) all using a shared OS. It packs or encapsulates software code and all its dependencies for it to run in a consistent and uniform manner on any infrastructure.![[Screenshot 2023-08-03 at 2.16.11 PM.png]]

What Docker does is wrap the software needed in a file system that has everything for running the code, providing the runtime and all the necessary libraries and system tools.

##### What is the benefit of using docker over a hypevisor?
Though Docker and Hypervisor might do the same job overall, there are many differences between them in terms of how they work. Docker can be thought of as lightweight since it uses very few resources and also the host kernel rather than creating it like a Hypervisor.

##### What is a docker image?
A Docker image helps in creating a Docker container. We can create the Docker image with the build command; due to this, it creates a container that starts when it begins to run. All the Docker images are stored in the Docker registry such as the public Docker registry.

##### What is a docker container? 
It is a comprehensive set of applications including all its dependencies which share the same OS kernel, along with the other containers running in separate processes within the operating system in a user space. Docker is not tied to any IT infrastructure, and thus it can run on any computer system or on the cloud. We can create a Docker container using Docker images and then run it, or we can use the images that are already created in the Docker Hub.

##### What is the use of a Dockerfile?
A Dockerfile is a set of specific instructions that we need to pass on to Docker so that the images can be built. We can think of the Dockerfile as a text document which has all the commands that are needed for creating a Docker image. We can create an automated build that lets us execute multiple command lines one after the other.

##### What is Docker Compose?
[Docker Compose](https://intellipaat.com/blog/docker-compose/) defines and runs multi-container Docker applications. With Compose, a YAML file is used to configure an application’s services. All the services from the configuration can be created and started with a single command.

##### How to use Docker Compose?
Docker Compose typically includes a three-step process:

1. Using a **dockerfile** to define the app’s environment to facilitate reproduction anywhere
2. Defining the app services in **docker-compose.yml** so that they can run in an isolated environment together
3. Running **docker-compose up**

##### What is Docker daemon?
[Docker daemon](https://intellipaat.com/blog/docker-daemon/) is a service that manages Docker containers, images, storage volumes, and the network. It constantly listens to Docker API requests and processes them. A daemon can communicate with other daemons as well for the management of Docker services.

##### What is Hypervisor?
A hypervisor is a software that makes virtualization possible. It is also called Virtual Machine Monitor. It divides the host system and allocates the resources to each divided virtual environment. You can basically have multiple OS on a single host system. There are two types of Hypervisors:

- Type 1: It’s also called Native Hypervisor or Bare metal Hypervisor. It runs directly on the underlying host system. It has direct access to your host’s system hardware and hence does not require a base server operating system.
- Type 2: This kind of hypervisor makes use of the underlying host operating system. It’s also called Hosted Hypervisor.

##### Why containerization?
Let me explain this is with an example. Usually, in the software development process, code developed on one machine might not work perfectly fine on any other machine because of the dependencies. This problem was solved by the containerization concept. So basically, an application that is being developed and deployed is bundled and wrapped together with all its configuration files and dependencies. This bundle is called a container. Now when you wish to run the application on another system, the container is deployed which will give a bug-free environment as all the dependencies and libraries are wrapped together. Most famous containerization environments are Docker and Kubernetes.

Kernel _acts as a bridge between applications and data processing performed at hardware level_ using inter-process communication and system calls.

##### Explain Docker Architecture?
Docker Architecture consists of a Docker Engine which is a client-server application with three major components:

1. A server which is a type of long-running program called a daemon process (the docker command).
2. A REST API which specifies interfaces that programs can use to talk to the daemon and instruct it what to do.
3. A command line interface (CLI) client (the docker command).
4. The CLI uses the Docker REST API to control or interact with the Docker daemon through scripting or direct CLI commands. Many other Docker applications use the underlying API and CLI.

##### Will you lose your data, when a docker container exists?
No, you won’t lose any data when Docker container exits. Any data that your application writes to the container gets preserved on the disk until you explicitly delete the container. The file system for the container persists even after the container halts.

You cannot remove a paused container. The container has to be in the stopped state before it can be removed.

##### Is it a good practice to run stateful applications on Docker?
The concept behind stateful applications is that they store their data onto the local file system. You need to decide to move the application to another machine, retrieving data becomes painful. I honestly would not prefer running stateful applications on Docker.

##### Suppose you have an application that has many dependant services. Will docker compose wait for the current container to be ready to move to the running of the next service?
The answer is yes. Docker compose always runs in the dependency order. These dependencies are specifications like depends_on, links, volumes_from, etc.

