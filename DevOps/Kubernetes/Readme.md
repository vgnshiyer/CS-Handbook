# Kubernetes important concepts

##### K8s vs docker swarm
![[Screenshot 2023-08-03 at 3.07.14 PM.png]]

##### How is Kubernetes related to Docker?
It’s a known fact that Docker provides the lifecycle management of containers and a Docker image builds the runtime containers. But, since these individual containers have to communicate, Kubernetes is used. So, Docker builds the containers and these containers communicate with each other via Kubernetes. So, containers running on multiple hosts can be manually linked and orchestrated using Kubernetes.

##### What is Container Orchestration?
Consider a scenario where you have 5-6 microservices for an application. Now, these microservices are put in individual containers, but won’t be able to communicate without container orchestration. So, as orchestration means the amalgamation of all instruments playing together in harmony in music, similarly container orchestration means all the services in individual containers working together to fulfill the needs of a single server.![[Screenshot 2023-08-03 at 3.12.22 PM.png]]
##### How do we control the resource usage of POD?
Controlling the resource usage of a Pod in Kubernetes is essential to ensure fair allocation of resources and prevent individual Pods from consuming excessive CPU and memory, which could negatively impact other Pods and the overall cluster performance. Kubernetes provides several mechanisms to control the resource usage of Pods:

1. **Resource Requests and Limits**: Kubernetes allows you to set resource requests and limits for CPU and memory on a per-container basis within a Pod.

   – Resource Requests: It specifies the minimum amount of CPU and memory required for a container to run. Kubernetes will use this information for scheduling and determining the amount of resources allocated to a Pod.

   – Resource Limits: It specifies the maximum amount of CPU and memory that a container can consume. Kubernetes enforces these limits to prevent a single container from using more resources than specified, which helps in avoiding resource contention.

1. **Resource Quotas**: Kubernetes allows you to define Resource Quotas at the namespace level to limit the total amount of CPU and memory that can be consumed by all Pods within the namespace. Resource Quotas help prevent resource hogging and ensure a fair distribution of resources among different applications.

2. **Horizontal Pod Autoscaler (HPA)**: HPA automatically adjusts the number of replicas of a Pod based on CPU utilization or custom metrics. It can scale up or down the number of replicas to maintain a target CPU utilization, helping to optimize resource usage dynamically.
3. **Vertical Pod Autoscaler (VPA)**: VPA automatically adjusts the resource requests and limits of Pods based on their actual resource usage. It can resize the resource requests and limits to optimize resource allocation based on real-time usage patterns.
4. **Quality of Service (QoS) Classes**: Kubernetes assigns QoS classes to Pods based on their resource requirements and usage. There are three classes: Guaranteed, Burstable, and BestEffort. The QoS classes help prioritize resource allocation and eviction decisions during resource contention.

By using these mechanisms, you can effectively control the resource usage of Pods in your Kubernetes cluster, ensuring efficient resource allocation, high availability, and optimal performance for all applications running in the cluster.

##### What is Kubelet?
This is an agent service which runs on each node and enables the slave to communicate with the master. So, Kubelet works on the description of containers provided to it in the PodSpec and makes sure that the containers described in the PodSpec are healthy and running.

##### Why not use docker compose instead of Kubernetes?
Docker Compose is suitable for local development or small-scale deployments where you need to manage a few interconnected containers on a single host. On the other hand, Kubernetes is a more appropriate choice for managing containerized applications at scale, across multiple hosts or in a production environment where high availability, scalability, and resilience are crucial requirements.

##### Explain the Kubernetes Architecture.
Kubernetes is a powerful container orchestration platform that automates the deployment, scaling, and management of containerized applications. Its architecture is designed to be highly scalable, fault-tolerant, and flexible. At a high level, Kubernetes architecture consists of the following main components:
![image](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/8455b1fb-d40f-4c62-baa3-682e2e74d998)

1. **Master Node:** The Master Node is the control plane of Kubernetes and manages the entire cluster. It includes several key components:
    
    - **API Server:** This component exposes the Kubernetes API, which serves as the front-end for the Kubernetes control plane. Clients interact with the API server to manage the cluster's resources and schedule containers.
        
    - **Etcd:** Etcd is a distributed key-value store that stores the cluster's configuration data and the desired state of the resources. It acts as Kubernetes' persistent storage for critical data, ensuring consistency and high availability.
        
    - **Controller Manager:** The Controller Manager runs various control loops responsible for monitoring the cluster's desired state and taking corrective actions to ensure the actual state matches the desired state. Examples of controllers include the Node Controller(manages state of nodes), Replication Controller(manages number of replicas of pods), and Deployment Controller.
        
    - **Scheduler:** The Scheduler is responsible for placing newly created pods (a group of one or more containers) onto available worker nodes based on resource requirements, quality of service, and other user-defined policies.
        
2. **Worker Nodes (Minions):** Worker Nodes are the compute nodes responsible for running containers. Each node is managed by the Master Node and runs the following components:
    
    - **Kubelet:** Kubelet is the primary node agent that communicates with the Master Node and ensures that the containers described in the pod specifications are running and healthy.
        
    - **Container Runtime:** Kubernetes supports different container runtimes, such as Docker, containerd, and CRI-O. The container runtime is responsible for pulling container images and running containers on the node.
        
    - **Kube-Proxy:** Kube-Proxy is a network proxy that runs on each node and handles networking operations required to implement Kubernetes services. It enables communication between different pods and external traffic routing.
        
3. **Networking:** Kubernetes requires a robust networking solution to allow communication between pods across different nodes and enable external access to services. Networking plugins like Calico, Flannel, Weave, or Cilium provide the necessary networking capabilities.
    
4. **Persistent Storage:** Kubernetes supports different storage options, such as Persistent Volumes (PVs) and Persistent Volume Claims (PVCs), to provide persistent storage to applications. Storage plugins like NFS, GlusterFS, or cloud-specific storage solutions are used to provide these capabilities.
    
5. **Add-ons:** Kubernetes offers various optional add-ons to extend its functionality and provide additional features like logging, monitoring, and load balancing. Examples include the Kubernetes Dashboard, Heapster (for monitoring), and Ingress controllers.

##### How to get the central logs from POD?
To collect central logs from Pods running in a Kubernetes cluster, you can use a centralized logging solution. One popular approach is to use the ELK Stack, which consists of three main components: Elasticsearch, Logstash (or Fluentd), and Kibana. Here’s how you can set up central logging using the ELK Stack:

1. Install Elasticsearch: Deploy Elasticsearch as a central log storage and indexing solution. Elasticsearch will store and index the logs collected from various Pods.
2. Install Logstash or Fluentd: Choose either Logstash or Fluentd as the log collector and forwarder. Both tools can collect logs from different sources, including application logs from Pods, and send them to Elasticsearch.

   – If using Logstash: Install and configure Logstash on a separate node or container. Create Logstash pipelines to process and forward logs to Elasticsearch.

  – If using Fluentd: Deploy Fluentd as a DaemonSet on each node in the Kubernetes cluster. Fluentd will collect logs from containers running on each node and send them to Elasticsearch.

3. Configure Application Logs: Inside your Kubernetes Pods, ensure that your applications are configured to log to the standard output and standard error streams. Kubernetes will collect these logs by default.
4. Install Kibana: Set up Kibana as a web-based user interface to visualize and query the logs stored in Elasticsearch. Kibana allows you to create custom dashboards and perform complex searches on your log data.
5. Configure Log Forwarding: Configure Logstash or Fluentd to forward logs from the Kubernetes Pods to Elasticsearch. This may involve defining log collection rules, filters, and log parsing configurations.
6. View Logs in Kibana: Access Kibana using its web interface and connect it to the Elasticsearch backend. Once connected, you can create visualizations, search logs, and analyze log data from your Kubernetes Pods.

![[Screenshot 2023-08-03 at 3.39.01 PM.png]]
##### What is Ingress network, and how does it work?
Ingress network is a collection of rules that acts as an entry point to the Kubernetes cluster. This allows inbound connections, which can be configured to give services externally through reachable URLs, load balance traffic, or by offering name-based virtual hosting. So, Ingress is an API object that manages external access to the services in a cluster, usually by HTTP and is the most powerful way of exposing service.

1. **ReplicaSet:** A ReplicaSet ensures a specified number of identical replicas (pods) are running at all times. It is a higher-level abstraction over the concept of pods and provides declarative scaling and fault tolerance. ReplicaSets are useful when you want to maintain a certain number of replicas of a pod to ensure high availability and distribute the workload across nodes.
    
2. **Pod:** A pod is the smallest deployable unit in Kubernetes. It represents a single instance of a running process in the cluster. A pod can contain one or more closely related containers, such as an application container and a sidecar container. Containers within the same pod share the same network namespace, allowing them to communicate with each other using `localhost`.
    
3. **Deployment:** A Deployment is a higher-level abstraction that manages ReplicaSets. It allows you to declaratively define the desired state of your application, including the number of replicas, container images, and update strategies. Deployments support rolling updates, making it easy to update the application without downtime.
    
4. **Service:** A Service is an abstraction that exposes pods running on the cluster as a network service. It provides a stable, virtual IP address and DNS name for other pods to access the pods running in the Service. Services enable load balancing and allow pods to communicate with each other without needing to know their specific IP addresses.
    
5. **Ingress:** An Ingress is an API object that allows you to expose HTTP and HTTPS routes from outside the cluster to services within the cluster. It acts as an entry point for external traffic to reach the services and can handle SSL termination, load balancing, and path-based routing.
    
6. **ConfigMap:** A ConfigMap is an API object that allows you to store configuration data separately from the application code. It provides a way to decouple configuration from the container images, making it easier to manage and update configurations without modifying the application itself.
    
7. **Secret:** A Secret is similar to ConfigMap but specifically designed for storing sensitive data, such as passwords, tokens, or private keys. Secrets are base64 encoded and can be mounted into pods as files or exposed as environment variables.
    
8. **PersistentVolume (PV) and PersistentVolumeClaim (PVC):** PVs and PVCs provide a way to attach persistent storage to pods. PVs represent physical storage resources, and PVCs request a specific amount and type of storage. PVCs bind to available PVs, allowing pods to access and use the requested storage.
    
9. **Namespace:** Namespaces provide a way to divide a Kubernetes cluster into multiple virtual clusters. They are used to organize and isolate resources, making it easier to manage large and complex deployments.
    

These are some of the essential components in Kubernetes. Understanding how they interact and work together is fundamental to effectively managing and deploying applications on Kubernetes.

##### What is Kube-dns?
kube-dns, also known as CoreDNS, is a DNS-based service discovery and name resolution component used in a Kubernetes clusters. It's responsible for managing the DNS (Domain Name System) resolution of domain names within the cluster.

##### Statefulset vs Deployment?
StatefulSet and Deployment are both controllers in Kubernetes that manage the deployment and scaling of pods, but they are designed for different use cases and have different behaviors.

Deployment:

Deployment is the most common controller used in Kubernetes for managing stateless applications.
It ensures that a specified number of replicas of a pod are running at all times, and it allows for scaling, rolling updates, and rollbacks.
It provides declarative updates to applications, meaning you describe the desired state, and Kubernetes takes care of updating the actual state.
The pod replicas in a Deployment are typically interchangeable and can be scaled up or down without impacting the application's behavior.
It's suitable for stateless applications, where each pod is identical and can be replaced without causing data loss or disruptions.
StatefulSet:

StatefulSet is designed for managing stateful applications that require stable, unique network identities and stable storage.
It maintains a sticky identity for each pod, even during rescheduling or scaling events. The pods are created in a predictable order and have stable hostnames.
It's commonly used for databases, distributed file systems, and other applications that require unique identities and persistent storage.
Unlike Deployment, scaling up or down in a StatefulSet can involve more complexity due to the need to handle unique identities and data persistence.
It's suited for applications that need to maintain some level of state and cannot be treated as interchangeable replicas.
In summary, use Deployment for stateless applications where pod replicas are interchangeable, and use StatefulSet for stateful applications that require stable identities and persistent storage. While both controllers manage pod deployment and scaling, their distinct behaviors cater to different application requirements.

##### Why do we need ingress if service component can perform load balancing?

While Kubernetes Services provide basic load balancing and routing capabilities, Ingress is a more advanced and flexible resource that is designed specifically for managing external access to services within a Kubernetes cluster. Ingress serves as a powerful tool for routing and controlling traffic to different services based on various rules, paths, and hostnames.

Here are some reasons why you might want to use Ingress in Kubernetes, even though Services offer basic load balancing:

Path and Host-Based Routing: Ingress allows you to route traffic based on URL paths and hostnames. With Services alone, you can't route different paths to different services using a single IP address.

Single Entry Point: Ingress provides a single entry point to your cluster for external traffic. This is especially useful when you have multiple services that you want to expose externally without exposing each service's individual ClusterIP.

HTTP and HTTPS: Ingress supports both HTTP and HTTPS traffic. It can terminate SSL/TLS and provide secure connections to your services.

URL Rewriting and Redirection: Ingress can perform URL rewriting and redirection. For example, you can redirect HTTP traffic to HTTPS, or you can rewrite URLs to match your service's internal paths.

Load Balancing Algorithms: While Services use a basic round-robin load balancing algorithm, Ingress can provide more advanced load balancing algorithms, such as least connections or IP hashing.

Layer 7 Features: Ingress operates at the application layer (Layer 7) of the OSI model, which means it can inspect and route traffic based on application-specific information, such as headers.

Integration with External Services: Ingress can be integrated with external services, such as content delivery networks (CDNs), caching, or web application firewalls (WAFs).

Resource Consolidation: Ingress consolidates routing rules and configurations in a single resource, making it easier to manage and monitor compared to setting up multiple Services and NodePorts.

Ingress controllers (like NGINX Ingress Controller or Traefik) are responsible for implementing Ingress rules and handling the traffic according to your specifications. They offer more advanced capabilities than basic load balancing by Services.

