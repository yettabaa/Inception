# Inception

## Overview

This project utilizes Docker to create a lightweight, portable, and isolated environment for running applications. The Docker architecture includes components such as `dockerd`, `containerd`, `runc`, and `containerd-shim`, which work together to manage container lifecycles efficiently.

## Docker Architecture

1. **Docker Daemon (`dockerd`)**: The core component that manages Docker containers and images.
2. **Containerd**: A high-level container runtime that interfaces with `dockerd` to create and manage containers.
3. **Runc**: A low-level container runtime responsible for running containers using Linux kernel features.
4. **Containerd-shim**: An intermediary process that manages the lifecycle of containers after they are initialized by `runc`.

## Key Concepts

- **Daemon Process**: A background process that runs independently of user control, handling tasks like web and database services.
- **Zombie Process**: A terminated process that remains in the process table because its parent has not yet read its exit status.
- **PID 1**: The first process in a container, responsible for managing the container's lifecycle.

## Best Practices

- **One Process Per Container**: Run one main service per container for simplicity and scalability.
- **Use Docker Compose**: Manage multi-container applications more effectively.

## Networking in Docker

Docker provides various networking options, such as:

- **Bridge**: Default networking for standalone containers.
- **Host**: Shares the host’s network stack.
- **Overlay**: Enables communication across multiple Docker hosts.
- **None**: Fully isolated containers.
- **Macvlan**: Assigns a MAC address to containers, integrating with existing networks.

## Storage Solutions

Docker uses layers to manage images and containers:

- **Image Layers**: Read-only layers created during the image build process.
- **Container Layers**: Writable layers added when containers are started.
- **Volumes**: Persistent storage managed by Docker, useful for databases and application data.
- **Bind Mounts**: Direct access to host machine directories.
- **tmpfs Mounts**: Fast, non-persistent memory storage.

## Dockerfile Overview

A Dockerfile is a script that automates the building of Docker images. It includes instructions such as:

- `FROM`: Specifies the base image.
- `RUN`: Executes commands to install dependencies.
- `COPY` / `ADD`: Copies files into the image.
- `CMD` / `ENTRYPOINT`: Defines the command to run when the container starts.
- `EXPOSE`: Informs Docker about the container's listening ports.

