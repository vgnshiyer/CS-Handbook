![Screenshot 2023-08-14 at 10 21 35 AM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/ab42fc41-941d-47ff-bdbf-283e3b431b74)

##### CI vs CD ?

Continuous Integration (CI):
CI is the practice of frequently integrating code changes from multiple developers into a shared repository. The main goal of CI is to detect integration issues early by automatically building and testing the code whenever a change is committed to the repository. CI ensures that changes made by different developers do not conflict and that the application remains in a working state at all times.

Continuous Deployment (CD):
CD extends the principles of CI to the delivery and deployment stages. It's about automating the entire process of getting software changes from development to production, ensuring that software updates are consistently and reliably deployed to the production environment. CD aims to minimize manual intervention and reduce the risk of deployment-related errors.

##### Why not Jenkins ?
- plugin based
  - need to configure dependency at UI level. In concourse, we dont need to do that. Can easily plug resources from the pipeline.
- No strict isolation
  - multiple tasks run in a worker (master-slave architecture).
  - In concourse, every task runs in an isolated container.
- builds need to be run from ui. Concourse allows u to run directly from file-system.

##### Features

- configure pipeline from code.
![Screenshot 2023-08-14 at 10 32 06 AM](https://github.com/vgnshiyer/CS-Handbook/assets/39982819/5ccc1407-a39c-4647-bef4-ba9e9b505b69)
- visualize to verify
- Can go inside a pipeline container using the `fly intercept` command.
- Test your pipeline on your local machine.

##### Architecture

ATC is the heart of concourse. It runs the web UI, API and is responsible for all pipeline scheduling. It connects to PostgreSQL which is the pipeline datastore (build logs, etc).

Multiple ATCs can be running as one cluster. They synchronize using locking mechanisms and spread work across the cluster. 
The main components of ATC are:
1. checker: continuously check versions of resources
2. scheduler: schedule builds
3. build tracker: running scheduled builds
4. garbage collector: cleanup mechanism for removing unused or outdated objects.

##### Fly cli

CLI tool helps you to communicate with the concourse tool.

##### Pipeline

A pipeline is the result of configuring jobs and resources together. A pipline takes life of its own to continuously detect resource versions and automatically queue new builds for jobs as they have new available inputs.

**resources:** all external inputs to and outputs of jobs in pipeline.

**jobs:** actions of your pipeline.

**task:** smallest configurable unit in a pipeline.

##### Ideal stages of a code from CI to CD

CI: 
1. source control: pull latest code from git
2. code compilation
3. unit tests
4. linting and quality check
5. code coverage and static analysis (find vulnerabilities)
6. artifact generation (bins, jar files, etc)

CD:
1. integration testing
2. containerization: build docker container
3. push image to repository
4. deployments to infrastructure
5. smoke test: ensure deployed version is operational
