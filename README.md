# grav-dev
Grav development setup in a Docker container based on Ubuntu

Looking for an easy way to setup a [Grav](https://getgrav.org/) development environment I decided this would be a nice project to start learning [Docker](https://www.docker.com/). So here you have it, perhaps more people might be interested in this set up.

# Remarks
* Based on Ubuntu 20.04 LTS
* Webserver Apache v2.4.41
* PHP v7.4.3
* Grav v1.6.27 including the Admin plugin v1.9.16

# Setup
* clone this repository to your own system and enter the grav-dev directory
```
mkdir ~/my-dev-dir && cd ~/my-dev-dir
git clone https://github.com/jekare/grav-dev.git
cd grav-dev
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
* now build and start the container, always make sure to start from the right directory
```
cd ~/my-grav-dir/grav-dev
docker-compose up -d
```
* open a browser and go to [localhost](http://localhost)
* if all went well you are greeted with the default grav welcome page:

![Screenshot from 2020-09-19 13-57-06](https://user-images.githubusercontent.com/7894742/93666649-1a2aec80-fa80-11ea-9bc1-e7ca40662988.png)

* go to [localhost/admin](http://localhost/admin) to open the following page where you can enter your details to create an admin account:

![grav-admin-setup](https://user-images.githubusercontent.com/7894742/93665165-9e777280-fa74-11ea-8b7e-8ce678fbfd76.png)

* and that is it! Now you have a default Grav setup at your disposal.

# Technical Details

The included Dockerfile is responsible for building the container, by changing it you can i.e. change the Ubuntu version or use another PHP version. Here you can also see that ports 80 en 443 are exposed to the host.

The docker-compose.yml file is responsible for running the container once it is build and in it you can see that:
* it only use port 80. To start using port 443 just add - 443:443 to the ports section and add a certificate.
* the a2conf/apache2.conf file is linked to /etc/apache2/apache2.conf in the container giving you the possibility to change the webserver configuration.
* the grav directory is linked to /var/www/html in the container thereby enabling the development in grav.

You can start developing by changing and adding files to the grav directory, normally you would use the grav/user directory for this.


