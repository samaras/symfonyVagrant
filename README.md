This project contains all cookbooks and configuration needed for a clean setup of vagrant and chef
to use symfony2 inside the virtual machine

============================
Sgoettschkes/symfonyVagrant
============================

This cookbooks aim to set up a out of the box working server to develop symfony2 applications. It 
uses the following cookbooks authored by the guys at opscode (for more information see below):

* apache2
* build-essential
* database
* java
* mysql
* nodejs
* openssl
* php
* python
* redisio

The glue which holds them together and executes everything is the main cookbook. The config from
the vagrant file is read and put into place. It distributes it's own php.ini and apache vhost
template as needed.

------------------
Software installed
------------------

Vagrant installes a 64-bit Ubuntu Server in version 10.04 with SSL setup. It also takes care of mounting the
shared folders. Ruby is already installed.

Chef installes the following software:

* apache2 (including virtualhosts file)
* php5
* mysql (including database setup)
* sass (Ruby gem)
* python (you could either uncomment this
* java
* redis (this can be turned of, see Vagrantfile.dist)
* node.js & coffeescript (this can be turned of, see Vagrantfile.dist)

It also executes any build script which can be defined as a command executed on command line, so you can use
php, python, java (ant e.g.) or any other build script which can be executed through command line.

=====
Todos
=====

* Add installation guide and configuration guide
** Installation so vagrant and chef are running
** Configuration of VAGRANT file

==================
License and Author
==================

The cookbooks used by the main cookbook can be found here: https://github.com/opscode-cookbooks/

The main cookbook was created by

Author:: Sebastian Goettschkes (<sebastian.goettschkes@boosolution.de>)

Copyright 2012, boosolution Sebastian Goettschkes

All cookbooks except for the main were created by various people from opscode or others. Please
take care to give back something if you find this work valuable. You could for example open source your
own code if it adds value to the vagrant or chef projects.