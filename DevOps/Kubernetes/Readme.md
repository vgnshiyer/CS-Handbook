# Kubernetes important concepts

### K8s vs docker swarm
![image](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/af2d6381-c2c6-4acf-807d-db1f4a21b098)

### How is Kubernetes related to Docker?
It’s a known fact that Docker provides the lifecycle management of containers and a Docker image builds the runtime containers. But, since these individual containers have to communicate, Kubernetes is used. So, Docker builds the containers and these containers communicate with each other via Kubernetes. So, containers running on multiple hosts can be manually linked and orchestrated using Kubernetes.

### What is Container Orchestration?
Consider a scenario where you have 5-6 microservices for an application. Now, these microservices are put in individual containers, but won’t be able to communicate without container orchestration. So, as orchestration means the amalgamation of all instruments playing together in harmony in music, similarly container orchestration means all the services in individual containers working together to fulfill the needs of a single server.![[Screenshot 2023-08-03 at 3.12.22 PM.png]]
### How do we control the resource usage of POD?
Controlling the resource usage of a Pod in Kubernetes is essential to ensure fair allocation of resources and prevent individual Pods from consuming excessive CPU and memory, which could negatively impact other Pods and the overall cluster performance. Kubernetes provides several mechanisms to control the resource usage of Pods:

1. **Resource Requests and Limits**: Kubernetes allows you to set resource requests and limits for CPU and memory on a per-container basis within a Pod.

   – Resource Requests: It specifies the minimum amount of CPU and memory required for a container to run. Kubernetes will use this information for scheduling and determining the amount of resources allocated to a Pod.
   ```
resources:
  requests:
    memory: "256Mi"
    cpu: "100m"
```
   – Resource Limits: It specifies the maximum amount of CPU and memory that a container can consume. Kubernetes enforces these limits to prevent a single container from using more resources than specified, which helps in avoiding resource contention.
   ```
resources:
  limits:
    memory: "512Mi"
    cpu: "200m"
```

1. **Resource Quotas**: Kubernetes allows you to define Resource Quotas at the namespace level to limit the total amount of CPU and memory that can be consumed by all Pods within the namespace. Resource Quotas help prevent resource hogging and ensure a fair distribution of resources among different applications.

2. **Horizontal Pod Autoscaler (HPA)**: HPA automatically adjusts the number of replicas of a Pod based on CPU utilization or custom metrics. It can scale up or down the number of replicas to maintain a target CPU utilization, helping to optimize resource usage dynamically.
3. **Vertical Pod Autoscaler (VPA)**: VPA automatically adjusts the resource requests and limits of Pods based on their actual resource usage. It can resize the resource requests and limits to optimize resource allocation based on real-time usage patterns.
4. **Quality of Service (QoS) Classes**: Kubernetes assigns QoS classes to Pods based on their resource requirements and usage. There are three classes: Guaranteed, Burstable, and BestEffort. The QoS classes help prioritize resource allocation and eviction decisions during resource contention.

Guaranteed: Pods with resource requests and limits that are the same. They are assured to get the resources they need.
Burstable: Pods with defined resource requests and limits, where requests are less than limits. They might burst beyond their requests, but not beyond the limits.
BestEffort: Pods without resource requests or limits. They get whatever resources are available on the node.

By using these mechanisms, you can effectively control the resource usage of Pods in your Kubernetes cluster, ensuring efficient resource allocation, high availability, and optimal performance for all applications running in the cluster.

### What is Kubelet?
This is an agent service which runs on each node and enables the slave to communicate with the master. So, Kubelet works on the description of containers provided to it in the PodSpec and makes sure that the containers described in the PodSpec are healthy and running.

### Why not use docker compose instead of Kubernetes?
Docker Compose is suitable for local development or small-scale deployments where you need to manage a few interconnected containers on a single host. On the other hand, Kubernetes is a more appropriate choice for managing containerized applications at scale, across multiple hosts or in a production environment where high availability, scalability, and resilience are crucial requirements.

### Explain the Kubernetes Architecture.
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

### How to get the central logs from POD?
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
### What is Ingress network, and how does it work?
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

### What is Kube-dns?
kube-dns, also known as CoreDNS, is a DNS-based service discovery and name resolution component used in a Kubernetes clusters. It's responsible for managing the DNS (Domain Name System) resolution of domain names within the cluster.

### Statefulset vs Deployment?
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

### Why do we need ingress if service component can perform load balancing?

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

### Scaling in kubernetes

Kubernetes Deployments:
A Deployment in Kubernetes provides a declarative way to manage applications. It allows you to specify the desired state of your application, and Kubernetes takes care of ensuring that the actual state matches the desired state. Deployments provide features like rolling updates and rollbacks, making it easier to manage changes to your application without downtime.

Scaling with Kubernetes Deployments:

Kubernetes deployments make scaling your application straightforward. You can scale your application horizontally by adjusting the number of replicas. When you need more resources or want to handle increased traffic, you can increase the number of replicas. Conversely, when traffic decreases, you can scale down.

Scaling Up:
`kubectl scale deployment nginx-deployment --replicas=4`

This scales the nginx-deployment to have 4 replicas.

Scaling Down:
`kubectl scale deployment nginx-deployment --replicas=2`

This scales down the nginx-deployment to have 2 replicas.

Updating the Deployment:
`kubectl set image deployment/nginx-deployment nginx=nginx:1.19`

This updates the image of the nginx-deployment to version 1.19.

When you update a deployment's image or configuration, Kubernetes performs rolling updates by gradually replacing old pods with new ones, ensuring minimal downtime.

Rollback:
If an update causes issues, you can rollback to the previous version:

`kubectl rollout undo deployment/nginx-deployment`

Automatic Scaling:

Kubernetes also supports automatic scaling based on resource utilization using Horizontal Pod Autoscalers (HPA). For example:

`kubectl autoscale deployment nginx-deployment --min=2 --max=5 --cpu-percent=80`

This sets up autoscaling for the nginx-deployment based on CPU utilization, with a minimum of 2 replicas, a maximum of 5 replicas, and a target CPU utilization of 80%.

**maxSurge and maxUnavailable parameters**
The maxSurge and maxUnavailable parameters control how many pods can be created above the desired number of pods and how many pods can be unavailable during the update.

**maxSurge** is the maximum number of pods that can be created above the desired number of pods. It can be a number or a percentage. The default value is 25%.

**maxUnavailable** is the maximum number of pods that can be unavailable during the update. It can be a number or a percentage. The default value is 25%.

### Different types of deployments.

source: aws docs
Deployment strategies define how you want to deliver your software. Organizations follow different deployment strategies based on their business model. Some choose to deliver software that is fully tested, and others might want their users to provide feedback and let their users evaluate under development features (such as Beta releases)

1. In-place Deployment
In this strategy, the previous version of the application on each compute resource is stopped, the latest application is installed, and the new version of the application is started and validated. This allows application deployments to proceed with minimal disturbance to underlying infrastructure. With an in-place deployment, you can deploy your application without creating new infrastructure; however, the availability of your application can be affected during these deployments. This approach also minimizes infrastructure costs and management overhead associated with creating new resources.

2. Blue/Green Deployment
A blue/green deployment is a deployment strategy in which you create two separate, but identical environments. One environment (blue) is running the current application version and one environment (green) is running the new application version. Using a blue/green deployment strategy increases application availability and reduces deployment risk by simplifying the rollback process if a deployment fails. Once testing has been completed on the green environment, live application traffic is directed to the green environment and the blue environment is deprecated. Kubernetes doesn't inherently support blue-green deployments out of the box, but you can achieve this using techniques like Service and Ingress controllers in combination with Deployment or StatefulSet resources.

3. Canary Deployment (determine percentage of traffic towards new version)
Canary deployments involve gradually rolling out a new version of your application to a small subset of users or nodes before deploying it to the entire cluster. This allows you to test the new version in a controlled manner. Kubernetes supports canary deployments using the following techniques like using a service mesh (istio) to route a percentage of traffic to new version.

4. Rolling deployments
Rolling deployments are the default strategy in Kubernetes. When you update a Deployment's configuration (like the container image), Kubernetes automatically orchestrates the replacement of old pods with new ones in a controlled manner. This strategy ensures that the application remains available during the update process.

5. A/B testing
A/B testing involves running multiple versions of your application simultaneously to compare performance or user experience. It involves making newer versions of your application to a selected set of users (Beta testers). Kubernetes can support A/B testing through careful pod scheduling, custom scripting, or by using tools like Istio that offer more sophisticated traffic routing and splitting.

### Persistence on K8s

In Kubernetes, a Persistent Volume Claim (PVC) is a resource that allows you to request storage resources from a cluster. A PVC abstracts the underlying storage details and provides a way to dynamically provision and manage storage for your pods without tightly coupling them to specific storage configurations.
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce  # Access mode for the volume
  resources:
    requests:
      storage: 1Gi  # Requested storage size
```
In this example, we're creating a Persistent Volume Claim named my-pvc that requests 1GB of storage with a "ReadWriteOnce" access mode. This means the volume can be mounted as read-write by a single node.
```
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
    - name: my-container
      image: nginx
      volumeMounts:
        - name: my-volume
          mountPath: /data
  volumes:
    - name: my-volume
      persistentVolumeClaim:
        claimName: my-pvc  # Reference the PVC here
```
In this pod specification, we're referencing the my-pvc PVC in the volumes section. Inside the containers section, we're mounting the volume using the volumeMounts field. This allows the pod to access the storage provided by the PVC.

When the pod is created, Kubernetes will automatically bind the Persistent Volume Claim to an available Persistent Volume (PV) that matches the requested storage size and access mode. If no suitable PV is available, Kubernetes can dynamically provision one based on the storage class defined in the PVC.

Make sure you have a corresponding Persistent Volume provisioned in your cluster to fulfill the PVC. Here's an example of how you could define a Persistent Volume:
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 2Gi  # Storage capacity of the PV
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: standard
  hostPath:
    path: /data/my-pv  # The path on the host machine
```

In Kubernetes, a StorageClass is used to define different classes of storage with different performance characteristics, provisioning methods, and other attributes. StorageClasses allow you to dynamically provision Persistent Volumes based on Persistent Volume Claims. When you create a Persistent Volume Claim (PVC), you can reference a specific StorageClass to specify the type of storage you need.
```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-storage
provisioner: kubernetes.io/aws-ebs  # Example provisioner for AWS EBS
parameters:
  type: gp2  # Example parameter for EBS volume type
```
In this example, we're defining a StorageClass named fast-storage using the AWS EBS provisioner. The parameters section allows you to specify additional settings for the provisioner, such as the volume type (gp2 in this case).

When you create this PVC, Kubernetes will dynamically provision a Persistent Volume based on the specified StorageClass, using the corresponding provisioner and parameters. This dynamic provisioning ensures that you get the appropriate storage type and configuration without needing to create the Persistent Volume manually.

The output of the kubectl get sc command provides some useful information about the StorageClass:

PROVISIONNER what is the underlying storage provider, in this case AWS EBS (Elastic Block Storage)
RECLAIMPOLICY what will happen with the volume when the PersistentVolume resource is deleted, in this case Delete will delete the block storage.
VOLUMEBINDINGMODE specifies how to provision the actual volume, WaitForFirstConsumer will provision the actual volume object once there is a matching claim.
ALLOWVOLUMEEXPANSION defines whether a volume can be expanded in size at a later point in time.

### Pod affinity and anti-affinity

Node affinity and anti-affinity are mechanisms used to influence how pods are scheduled onto nodes based on node labels or other node attributes. 

Pod Affinity:

Pod Affinity ensures that pods are scheduled onto nodes that have other pods with specific characteristics or labels. It is used to place related or complementary pods close to each other on the same node.

Example scenarios for using Pod Affinity: Placing a web application pod on a node with a caching service pod to reduce latency.

Suppose you have nodes labeled with disk=ssd or disk=hdd, and you want to schedule pods that require SSD storage to SSD-labeled nodes. You can define a node affinity rule in a pod's YAML file like this:
```
apiVersion: v1
kind: Pod
metadata:
  name: ssd-pod
spec:
  containers:
  - name: app-container
    image: your-app-image
  nodeSelector:
    disk: ssd  # This specifies the node label requirement
```

Pod Anti-Affinity:

Pod Anti-Affinity is the opposite of Pod Affinity. It ensures that pods are not scheduled onto nodes that have other pods with specific characteristics or labels. This is useful to ensure high availability and fault tolerance by spreading pods across different nodes.

Example scenarios for using Pod Anti-Affinity:
- Preventing critical pods of the same service from running on the same node to increase resilience.
- Distributing pods of a database cluster across different nodes to avoid single points of failure.

### Configmaps and Secrets

Configmaps and secrets are a way to store information that is used by several deployments and pods in your cluster. This makes it easy to update the configuration in one place, when you want to change it.

Both configmaps and secrets are generic key-value pairs, but secrets are base64 encoded and configmaps are not.

💡 Secrets are not encrypted, they are encoded. This means that if someone gets access to the cluster, they can will be able to read the values.

This lets you change easily configuration depending on the environment (development, production, testing, etc.) and to dynamically change configuration at runtime.

A ConfigMap manifest looks like this in yaml:
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  key1: value1
  key2: value2
  key3: value3
```
There are three ways to create ConfigMaps using the kubectl create configmap command.

Use the contents of an entire directory with kubectl create configmap my-config --from-file=./my/dir/path/
Use the contents of a file or specific set of files with kubectl create configmap my-config --from-file=./my/file.properties
💡 More info
Env-files contain a list of environment variables. These syntax rules apply:

Each line in an env file has to be in VAR=VAL format.
Lines beginning with # (i.e. comments) are ignored.
Blank lines are ignored.
There is no special handling of quotation marks (i.e. they will be part of the ConfigMap value).
```
enemies=aliens
lives=3
allowed="true"
```
Will be rendered as:
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  enemies: aliens
  lives: "3"
  allowed: "true"
```
Use literal key-value pairs defined on the command line with kubectl create configmap my-config --from-literal=key1=value1 --from-literal=key2=value2
💡 remember the --dry-run=client -o yaml trick to see what the yaml file will look like before you apply it.

secrets are used for storing configuration that is considered sensitive, and well ... secret.

When you create a secret Kubernetes will go out of it's way to not print the actual values of secret object, to things like logs or command output.

You should use secrets to store things like passwords for databases, API keys, certificates, etc.

Rather than hardcode this sensitive information and commit it to git for all the world to see, we source these values from environment variables.

secrets function for the most part identically to configmaps, but with the difference that the actual values are base64 encoded. base64 encoded means that the values are obscured, but can be trivially decoded. When values from a secret are used, Kubernetes handles the decoding for you.

To use a configmap or secret in a deployment, you can either mount it in as a volume, or use it directly as an environment variable.

This will inject all key-value pairs from a configmap as environment variables in a container. The keys will be the name of variables, and the values will be values of the variables.
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  ...
    spec:
    containers:
      - name: my-app
        image: my-app:latest
        ports:
          - containerPort: 8080
        envFrom:
          - configMapRef: # this is the configmap that we want to use
              name: my-config # the name of the configmap we want to use
```

### Readiness Probe:
A readiness probe is used to determine if a pod is ready to accept incoming network traffic. If a pod fails its readiness probe, it is removed from service and will not receive any traffic until it becomes ready again. This is particularly useful during rolling updates or when pods need time to initialize before serving traffic.
```
apiVersion: v1
kind: Pod
metadata:
  name: web-app
spec:
  containers:
  - name: app-container
    image: web-app-image
    readinessProbe:
      httpGet:
        path: /health
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 10
```

### Liveness probe
A liveness probe checks whether a pod is still running as expected. If a pod fails its liveness probe, Kubernetes will automatically restart it. Liveness probes are important for detecting and recovering from situations where a pod becomes unresponsive or hangs.
```
apiVersion: v1
kind: Pod
metadata:
  name: critical-app
spec:
  containers:
  - name: app-container
    image: critical-app-image
    livenessProbe:
      exec:
        command:
        - check-script.sh
      initialDelaySeconds: 10
      periodSeconds: 15
```


### Some more info

1. 
How to list all the Pods with the label "app=web"?
How to list all objects labeled as "env=staging"?
How to list all deployments from "env=prod" and "type=web"?

`k get po -l app=web k get all -l env=staging k get deploy -l env=prod,type=web`

2.
Apply the label "hw=max" on one of the nodes in your cluster
Create and run a Pod called some-pod with the image redis and configure it to use the selector hw=max
Explain why node selectors might be limited

`kubectl label nodes some-node hw=max`
```
kubectl run some-pod --image=redis --dry-run=client -o yaml > pod.yaml

vi pod.yaml

spec:
  nodeSelector:
    hw: max

kubectl apply -f pod.yaml
```

3.
Check if one of the nodes in the cluster has taints (doesn't matter which node)
Create a taint on one of the nodes in your cluster with key of "app" and value of "web" and effect of "NoSchedule"
Explain what it does exactly
Verify it was applied
Run a Pod that will be able to run on the node on which you applied the taint

Node affinity is a property of Pods that attracts them to a set of nodes (either as a preference or a hard requirement). Taints are the opposite -- they allow a node to repel a set of pods.

Tolerations are applied to pods. Tolerations allow the scheduler to schedule pods with matching taints. Tolerations allow scheduling but don't guarantee scheduling: the scheduler also evaluates other parameters as part of its function.

Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes. One or more taints are applied to a node; this marks that the node should not accept any pods that do not tolerate the taints.

```
kubectl describe no minikube | grep -i taints
kubectl taint node minikube app=web:NoSchedule

kubectl describe no minikube | grep -i taints
kubectl run some-pod --image=redis
kubectl edit po some-pod
 tolerations:
 - key: "key1"
   operator: "Equal"
   value: "value1"
   effect: "NoSchedule"
Save and exit. The Pod should be running.
```

**Kustomize** makes it easy to customize configuration files without rewriting yaml files across different environments. It makes it easier to apply patches to deployments, generate configmaps, secrets without modifying the base deployment YAML file.
