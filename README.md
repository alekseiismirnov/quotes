## Additional info

- `info/TODO.md` - Functional spec

## Development environment setup

Requirements: podman v. 4.4.1 +, podman-compose
Clone project, in project folder run

```
podman-compose up --build-arg USERNAME=$(id -un) --build-arg GROUPNAME=$(id -gn) --build-arg USERID=$(id -u) --build-arg GROUPID=$(id -g)
```
