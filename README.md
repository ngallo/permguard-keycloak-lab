# Permguard Integration with Keycloak

This repository provides a **lab environment** demonstrating how to integrate **Permguard** with **Keycloak** for authentication and authorization experiments.  
It is intended as a reference for developers exploring policy-based access control with Permguard, backed by Keycloak identity management.  

## Prerequisites

Before running this lab environment, make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/)  
- [Permguard CLI](https://github.com/permguard/permguard) installed locally and available in your `$PATH`

## Project Structure

```md
permguard-keycloak-lab/  
├── docs/                # Documentation and diagrams  
├── keycloak/            # Keycloak configuration  
│   └── ...  
├── permguard/           # Permguard configuration  
│   └── ...  
└── workspace/           # Permguard Workspace
    ├── policies/  
    └── ...  
```

- **keycloak/** → contains Keycloak configuration
- **permguard/** → contains Permguard configuration  
- **workspace/** → workspace for Permguard

## Run Locally

Clone the repository and start the environment with Docker Compose:

```bash
git clone git@github.com:ngallo/permguard-keycloak-lab.gi
cd permguard-keycloak-lab
make up
```
