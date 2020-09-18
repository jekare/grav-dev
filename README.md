# grav-dev
Grav development setup in a Docker container based on ubuntu 20.04

This is my first public github repository!

Looking for an easy way to setup a [Grav](https://getgrav.org/) development environment I decided this would be a nice project to start learning [Docker](https://www.docker.com/). So here you have it, perhaps more people might be interested in this set up.

There are a few simple steps involved in using this environment:
* create a directory and clone this repository into that directory
```
mkdir my-grav-dir && cd my-grav-dir
```
* add your user to the www-data group:
  * 'sudo usermod -aG www-data $USER'
  * if the www-data group does not exist yet create it first: sudo groupadd www-data
