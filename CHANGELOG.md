# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-01-08

### Added
- GitHub Actions workflow for automated Docker image builds and publishing to Docker Hub
- Comprehensive README with installation, usage, and development instructions
- Support for automated multi-tag versioning (semver, latest)

### Changed
- Upgraded from .NET SDK 3.1 to .NET SDK 10.0
- Updated base image to use Debian Bookworm (was using Buster)
- Updated Microsoft package repository configuration to Debian 12
- Improved GPG key installation using official Microsoft packages method
- Enhanced Dockerfile with better package management and cleanup

## [1.0.0] - 2020-09-25

### Added
- Initial release with Wine and .NET SDK support
- Inno Setup 5.6.1 Unicode pre-installed
- Virtual X server (Xvfb) for GUI applications
- Build tools (g++, make, tar, gzip, etc.)
- ExifTool for image metadata processing
- Custom scripts directory support (`/opt/bin/`)

### Features
- Wine (latest) for running Windows applications
- .NET SDK 10.0 for building and running .NET applications
- Docker image optimized for CI/CD pipelines
- User `xclient` for running non-root processes

---

## Version History Format

### Added
- New features or capabilities

### Changed
- Changes to existing functionality

### Deprecated
- Features that will be removed in upcoming releases

### Removed
- Features that have been removed

### Fixed
- Bug fixes

### Security
- Security-related changes or fixes
