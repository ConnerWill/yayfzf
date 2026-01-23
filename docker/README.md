# yayfzf Docker

<!--toc:start-->
- [yayfzf Docker](#yayfzf-docker)
  - [Build](#build)
  - [Run](#run)
    - [Interactive Shell](#interactive-shell)
    - [Run Directly](#run-directly)
  - [Testing AUR Package](#testing-aur-package)
<!--toc:end-->

## Build

Build docker image from root of the repo

```bash
cd $(git rev-parse --show-toplevel)
docker build --tag yayfzf --file docker/Dockerfile .
```

## Run

### Interactive Shell

Run docker image from root of the repo

```bash
cd $(git rev-parse --show-toplevel)
docker run --rm --interactive --tty \
  --volume "${PWD}:/workspace"      \
  yayfzf
```

Inside of container

```bash
yayfzf
```

### Run Directly

```bash
cd $(git rev-parse --show-toplevel)
docker run --rm --interactive --tty \
  --volume "${PWD}:/workspace"      \
  yayfzf yayfzf
```

## Testing AUR Package

Test building package with `PKGBUILD` inside the container:

```bash
cd $(git rev-parse --show-toplevel)
docker run --rm --interactive --tty \
  --volume "${PWD}:/workspace"      \
  yayfzf 'cd AUR/yayfzf ; makepkg -si'
```
