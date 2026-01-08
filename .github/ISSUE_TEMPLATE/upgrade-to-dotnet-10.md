---
name: Upgrade to .NET 10 and Modernize Infrastructure
about: Track the upgrade from .NET SDK 3.1 to 10.0 and infrastructure improvements
title: 'Upgrade to .NET SDK 10.0 and modernize Docker configuration'
labels: enhancement, infrastructure
assignees: ''

---

## Problem Statement

The current Docker image uses .NET SDK 3.1 which is outdated and approaching end-of-life. Additionally, the base Debian Buster (10) repositories are returning 404 errors and the infrastructure needs modernization.

## Issues to Address

1. **.NET SDK 3.1 is outdated**
   - .NET 3.1 reached end of support on December 13, 2022
   - No security updates or bug fixes
   - Missing modern .NET features and performance improvements

2. **Debian Buster (10) repository issues**
   - Repository URLs returning 404 errors
   - Buster is now oldoldstable
   - Missing security updates

3. **Legacy Docker practices**
   - Using deprecated ENV syntax
   - Outdated GPG key installation method
   - No automated CI/CD pipeline

4. **Missing documentation**
   - No comprehensive README
   - No changelog to track versions
   - No clear instructions for building/using the image

## Proposed Solution

### Dockerfile Updates
- [x] Upgrade to .NET SDK 10.0
- [x] Update base image to Debian Bookworm (12)
- [x] Fix Microsoft package repository configuration for Debian 12
- [x] Modernize GPG key installation using official Microsoft packages
- [x] Update ENV statements to modern `key=value` format

### Documentation
- [x] Create comprehensive README with:
  - Installation instructions
  - Usage examples
  - Environment variable documentation
  - Troubleshooting guide
- [x] Create CHANGELOG.md following Keep a Changelog format
- [x] Add MIT License

### Automation
- [x] Set up GitHub Actions workflow for automated builds
- [x] Configure automatic Docker Hub publishing on tag creation
- [x] Implement semantic versioning with multiple tags

## Expected Benefits

1. **Security**: Latest .NET runtime with current security patches
2. **Performance**: .NET 10 performance improvements
3. **Reliability**: Stable Debian Bookworm base with active support
4. **Automation**: Automated builds reduce manual errors
5. **Usability**: Clear documentation helps users get started quickly

## Testing Plan

- [ ] Build Docker image successfully with .NET 10
- [ ] Verify all dependencies install correctly
- [ ] Test Wine functionality with sample Windows executables
- [ ] Verify Inno Setup installation and operation
- [ ] Test GitHub Actions workflow with tag push
- [ ] Verify image publishes correctly to Docker Hub

## Breaking Changes

This is a major version bump (v2.0.0) due to:
- .NET SDK version change (3.1 → 10.0)
- Base OS version change (Debian 10 → 12)
- Projects targeting .NET 3.1 will need to update their target framework

## Migration Guide

Users upgrading from v1.x should:
1. Update project files to target .NET 10
2. Review breaking changes in .NET 10 release notes
3. Test applications thoroughly before deploying
4. Update CI/CD pipelines to use new image tags

## Related Links

- [.NET 10 Release Notes](https://github.com/dotnet/core/tree/main/release-notes/10.0)
- [Debian Bookworm Release Info](https://www.debian.org/releases/bookworm/)
- [Docker Hub Repository](https://hub.docker.com/r/andregoncabr/winedotnetcore)
