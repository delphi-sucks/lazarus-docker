# lazarus-docker

[![Build Status](https://drone.delphi-sucks.de/api/badges/Sebastian/lazarus-docker/status.svg)](https://drone.delphi-sucks.de/Sebastian/lazarus-docker)

Lazarus/FreePascal build environment for Continous Integration (CI).

## Usage

Use the command `lazbuild` to compile your project:

```bash
lazbuild path/to/project.lpi 
```

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