# lazarus-docker

[![Build Status](https://drone.delphi-sucks.de/api/badges/Sebastian/lazarus-docker/status.svg?ref=refs/heads/2.0.10)](https://drone.delphi-sucks.de/Sebastian/lazarus-docker)

Lazarus/FreePascal build environment for Continous Integration (CI) with cross-compile support for Windows and Linux.

## Usage

Use the command `lazbuild` to compile your project:

```bash
lazbuild path/to/project.lpi 
```

## Supports

* Linux 64-Bit
* Windows 32-Bit
* Windows 64-Bit

## Example

### Drone CI

```yaml
kind: pipeline
type: docker
name: default

platform:
  os: linux
  arch: amd64

steps:
- name: compile
  image: delphisucks/lazarus:latest
  commands:
  - lazbuild path/to/project.lpi
```
