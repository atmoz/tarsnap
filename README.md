# tarsnap [![Docker Build Status](http://hubstatus.container42.com/atmoz/tarsnap)](https://registry.hub.docker.com/u/atmoz/tarsnap)

Tarsnap Docker image

## What is Tarsnap?

*Online backups for the truly paranoid*

Tarsnap is a secure online backup service for BSD, Linux, OS X, Minix,
OpenIndiana, Cygwin, and probably many other UNIX-like operating systems. The
Tarsnap client code provides a flexible and powerful command-line interface
which can be used directly or via shell scripts.

[http://www.tarsnap.com/](http://www.tarsnap.com/)

## Usage

- Mount your key file as /tarsnap/key.
- Mount your backup directory as /backup.
- Run tarsnap commands.

## Example

```
docker run \
    -v /host/key:/tarsnap/key:ro \
    -v /host/backup:/backup:ro \
    --rm tarsnap -c -f mybackup /backup
```
