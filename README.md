# grav-dev
Grav development setup in a Docker container based on Ubuntu

Looking for an easy way to setup a [Grav](https://getgrav.org/) development environment I decided this would be a nice project to start learning [Docker](https://www.docker.com/). So here you have it, perhaps more people might be interested in this set up.

# remarks
* Based on Ubuntu 20.04 LTS
* Webserver Apache v2.4.41
* PHP v7.4.3
* Grav v1.6.27
* including the Admin plugin v1.9.16

# Setup
* create a directory and clone this repository into that directory
```
mkdir my-grav-dir && cd my-grav-dir
git clone https://github.com/jekare/grav-dev.git
```
* if the www-data group does not exist yet then create it
```
sudo groupadd www-data
```
* add your user to the www-data group
```
sudo usermod -aG www-data $USER
```
* make sure the grav directory and everything in it are read/write enabled for the www-data group
```
sudo chown -Rf www-data:www-data grav
```
* log out and log in again to activate the new group rights
* now build and start the container, alwys make sure to start from the right directory
```
cd my-grav-dir
docker-compose up -d
```
* open a browser and go to [localhost](http://localhost)
* if all went well you are greeted with the admin user setup screen

![image][Screenshot from 2020-09-17 15-43-09.png]
