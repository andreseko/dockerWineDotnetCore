# Docker Wine + .NET Core

A Docker image that combines Wine with .NET SDK 10.0, allowing you to run .NET applications and Windows executables in a containerized Linux environment. This image also includes Inno Setup for creating Windows installers.

![GitHub Release](https://img.shields.io/github/v/release/andreseko/dockerWineDotnetCore)
![GitHub License](https://img.shields.io/github/license/andreseko/dockerWineDotnetCore)

## Features

- Wine (latest version) for running Windows applications
- .NET SDK 10.0 for building and running .NET applications
- Inno Setup 5.6.1 Unicode for creating Windows installers
- Virtual X server (Xvfb) for GUI applications
- Build tools (g++, make, etc.)

## Pulling from Docker Hub

The easiest way to use this image is to pull it directly from Docker Hub:

```bash
docker pull andregoncabr/winedotnetcore:latest
```

Or pull a specific version:

```bash
docker pull andregoncabr/winedotnetcore:1.0.0
```

## Building the Image Locally

To build the Docker image locally, navigate to the project directory and run:

```bash
docker build -t andregoncabr/winedotnetcore:latest .
```

You can use a custom tag if needed:

```bash
docker build -t andregoncabr/winedotnetcore:your-tag .
```

## Automated Builds

This repository uses GitHub Actions to automatically build and push Docker images to Docker Hub when a new version tag is created.

### Creating a New Release

To trigger an automated build:

1. Tag your commit with a version number:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. The GitHub Actions workflow will automatically:
   - Build the Docker image
   - Tag it with the version number (e.g., `1.0.0`)
   - Tag it with major.minor version (e.g., `1.0`)
   - Tag it with major version (e.g., `1`)
   - Tag it as `latest`
   - Push all tags to Docker Hub

### Setting Up GitHub Secrets

For the automated pipeline to work, you need to add these secrets to your GitHub repository:

1. Go to your repository on GitHub
2. Navigate to Settings → Secrets and variables → Actions
3. Add the following secrets:
   - `DOCKER_USERNAME`: Your Docker Hub username (andregoncabr)
   - `DOCKER_PASSWORD`: Your Docker Hub access token or password

## Running the Container

### Basic Usage

Run a container from the built image:

```bash
docker run -it andregoncabr/winedotnetcore:latest /bin/bash
```

### Mounting Your Project

To work with your local .NET project inside the container:

```bash
docker run -it -v /path/to/your/project:/workspace andregoncabr/winedotnetcore:latest /bin/bash
```

Once inside the container, navigate to your mounted project:

```bash
cd /workspace
```

## Using .NET in the Container

### Check .NET Installation

```bash
dotnet --version
```

### Build a .NET Project

```bash
dotnet build
```

### Run a .NET Application

```bash
dotnet run
```

## Using Wine

To run Windows executables:

```bash
wine your-application.exe
```

For GUI applications, use the virtual X server:

```bash
wine-x11-run wine your-application.exe
```

## Environment Variables

- `WINEDEBUG`: Set to `-all,err+all` to show error information from Wine
- `DISPLAY`: Set to `:99` for the virtual X buffer

## Notes

- The container runs as user `xclient` by default (switched from root after installation)
- Scripts in the `./scripts/` directory are copied to `/opt/bin/` and made executable
- Inno Setup is pre-installed and ready to use with Wine

## Troubleshooting

If you encounter issues:

1. Ensure Docker is properly installed and running
2. Check that you have sufficient disk space for the image
3. For Wine-related issues, check the Wine logs with `WINEDEBUG` environment variable
