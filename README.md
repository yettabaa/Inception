# **Inception**

[![42 Badge](https://img.shields.io/badge/Score-125%2F100-brightgreen)](#)

**Inception** is a 42 School project that involves setting up a multi-container Docker environment to host a fully functional WordPress website with additional services. This project includes all mandatory requirements and bonus features, such as Redis caching, FTP support, and real-time system monitoring, delivering a comprehensive and scalable solution using Docker and Docker Compose.

---

## **Table of Contents**  
1. [Overview](#overview)  
2. [Preview](#preview)  
3. [Installation](#installation)
4. [Deep Dive](#deep-dive)
5. [Contributing](#contributing)  
6. [License](#license) 

---

## **1. Overview** 

**Date of Completion**: **29/10/2024** 

**Score Achieved**: **125/100**

**My implementation:**

![schema](https://github.com/yettabaa/Inception/blob/master/assets/schema.png)

**Goal of the Project**:  
Create a multi-container Docker-based system to host a fully operational WordPress site. The project includes using Docker Compose for orchestration and follows modern containerization best practices.

**Project Requirements**:  
- **Mandatory**:  
  - Set up multiple containers for services like Nginx, MySQL, WordPress, and PHP.
  - Configure networks and volumes for persistent storage and inter-container communication.
  - Use custom-built containers, avoiding pre-built images, and create them from scratch using base images (Debian and Alpine).
  - Implement proper security and configurations to run WordPress successfully in a Dockerized environment.

- **Bonus**:  
  - Implement a reverse proxy with Nginx for routing traffic.
  - Add Redis for caching, Adminer for database management, and Netdata for monitoring the containers.
  - Deploy a static website in a separate container.
  - Ensure the system is scalable, efficient, and easy to manage using Docker Compose.

---

## **2. Preview**

1. **Nginx, WordPress + PHP, and Database Containers**

- The Nginx container acts as a reverse proxy, handling incoming HTTP requests from users on port 443 (HTTPS). It forwards these requests to the WordPress+PHP on port 9000, which hosts the WordPress site and dynamically processes PHP content. The WordPress+PHP connects to the Database (DB) container on port 3306, where all site data is stored and retrieved. This separation of concerns ensures that each service runs in its own container, making the system modular and scalable. Nginx, WordPress, and the DB container communicate seamlessly, with Nginx routing traffic, WordPress handling content and user requests, and the DB container managing the data behind the scenes.

![wordpress](https://github.com/yettabaa/Inception/blob/master/assets/wordpress.png)

2. **FTP Container**
- The FTP container enables users to upload and manage files for the WordPress site. It operates on standard FTP ports (20, 21) and an extended passive mode range (1998-2002) for secure file transfers.
- To verify functionality, it is recommended to test the FTP connection using an FTP client like FileZilla, ensuring proper access and file management capabilities.

![FTP](https://github.com/yettabaa/Inception/blob/master/assets/ftp.png)

3. **Redis Container (Caching)**
- Redis is used to cache WordPress content, improving performance by storing frequently accessed data in memory. It communicates with both the WordPress container and the Redis container itself on port 6379.

![Redis](https://github.com/yettabaa/Inception/blob/master/assets/redis.png)

4. **Adminer Container (Database Management)**
- Adminer provides a web-based interface for managing the MySQL database. It connects to the Nginx container on port 9001, allowing users to interact with the database through a browser.

![Adminer](https://github.com/yettabaa/Inception/blob/master/assets/adminer.png)

5. **Netdata Container (Monitoring)**
- The Netdata container provides real-time monitoring and performance tracking for all containers and the host system linked to it. It offers detailed analytics and visual insights into resource usage, system health, and network activity.   
- Netdata can track metrics from services like WordPress and the database, making it a valuable tool for debugging and performance optimization.  
- To enhance accessibility, you can configure **Nginx** as a reverse proxy for Netdata. This allows accessing Netdata through a custom path on your domain (e.g., `https://yettabaa.42.fr/netdata`). Below is an example Nginx configuration:  

```nginx
location /netdata/ {
    proxy_pass http://localhost:19999/; 
}
```

![Netdata](https://github.com/yettabaa/Inception/blob/master/assets/netdata.png)

6. **Static Website Container**
- The Static Website container serves a static website (e.g., a landing page) through Nginx. This container is linked with the Nginx container via port 3000.

![Static](https://github.com/yettabaa/Inception/blob/master/assets/static.png)

---

## **3. Installation**  
Follow these steps to set up the project:  

1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/your-repo/Inception.git  
   cd Inception  
   ```  

2. **Install Docker and Docker Compose**:  
   Ensure Docker and Docker Compose are installed on your system.  

3. **Setting Up Host Volumes**:  
   ```bash
   make mkdir  
   ```  
4. **Build and Start Containers**:  
   ```bash
   make
   ```  

---

## **4. Deep Dive**  
### Docker Architecture

1. **Docker Daemon (`dockerd`)**: The core component that manages Docker containers and images.
2. **Containerd**: A high-level container runtime that interfaces with `dockerd` to create and manage containers.
3. **Runc**: A low-level container runtime responsible for running containers using Linux kernel features.
4. **Containerd-shim**: An intermediary process that manages the lifecycle of containers after they are initialized by `runc`.

### Key Concepts

- **Daemon Process**: A background process that runs independently of user control, handling tasks like web and database services.
- **Zombie Process**: A terminated process that remains in the process table because its parent has not yet read its exit status.
- **PID 1**: The first process in a container, responsible for managing the container's lifecycle.

### Best Practices

- **One Process Per Container**: Run one main service per container for simplicity and scalability.
- **Use Docker Compose**: Manage multi-container applications more effectively.

### Networking in Docker

Docker provides various networking options, such as:

- **Bridge**: Default networking for standalone containers.
- **Host**: Shares the host’s network stack.
- **Overlay**: Enables communication across multiple Docker hosts.
- **None**: Fully isolated containers.
- **Macvlan**: Assigns a MAC address to containers, integrating with existing networks.

### Storage Solutions

Docker uses layers to manage images and containers:

- **Image Layers**: Read-only layers created during the image build process.
- **Container Layers**: Writable layers added when containers are started.
- **Volumes**: Persistent storage managed by Docker, useful for databases and application data.
- **Bind Mounts**: Direct access to host machine directories.
- **tmpfs Mounts**: Fast, non-persistent memory storage.

### Dockerfile Overview

A Dockerfile is a script that automates the building of Docker images. It includes instructions such as:

- `FROM`: Specifies the base image.
- `RUN`: Executes commands to install dependencies.
- `COPY` / `ADD`: Copies files into the image.
- `CMD` / `ENTRYPOINT`: Defines the command to run when the container starts.
- `EXPOSE`: Informs Docker about the container's listening ports.

### Docker Compose Overview

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to define the services, networks, and volumes that your application will use in a single YAML file, and then easily manage them with simple commands. The key components in a `docker-compose.yml` file are:

- **`version`**: Specifies the version of the Docker Compose file format.
- **`services`**: Defines the containers that will run as part of your application, each service representing a container.
  - **`build`**: Specifies the path to the Dockerfile or build context.
  - **`image`**: Specifies a prebuilt image to use.
  - **`ports`**: Maps ports between the container and the host machine.
  - **`volumes`**: Defines persistent data storage that can be shared between containers and the host.
  - **`depends_on`**: Specifies the dependencies between services, ensuring they start in the correct order.
- **`networks`**: Defines custom networks for the services to communicate with each other.
- **`volumes`**: Defines named volumes that persist data beyond the lifetime of containers.

By using Docker Compose, you can easily set up and manage a multi-container environment with a single command (`docker-compose up`).

---

## **5. Contributing**  
Contributions are welcome! If you have suggestions for improving this project, feel free to fork the repository and submit a pull request.  

1. **Fork the Repository**  
2. **Create a Feature Branch**:  
   ```bash  
   git checkout -b feature-branch-name  
   ```  
3. **Commit Changes**:  
   ```bash  
   git commit -m "Description of changes"  
   ```  
4. **Push Changes**:  
   ```bash  
   git push origin feature-branch-name  
   ```  
5. **Open a Pull Request**  

---

## **6. License**  
This project is licensed under the [MIT License](LICENSE).  

---