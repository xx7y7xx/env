#!/bin/bash

sudo mount -t davfs 192.168.0.60:8080 ~/Mount/0.60dav
sudo mount -t davfs 192.168.0.61:8080 ~/Mount/0.61dav
sudo mount -t davfs 192.168.2.176:8080 ~/Mount/2.176dav

curlftpfs ftp://apache:apache@192.168.0.60 ~/Mount/0.60ftp
curlftpfs ftp://apache:apache@192.168.0.61 ~/Mount/0.61ftp
curlftpfs ftp://apache:apache@192.168.2.176 ~/Mount/2.176ftp
