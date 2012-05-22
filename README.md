This project contains all cookbooks and configuration needed for a clean setup of vagrant and chef
to use symfony2 inside the virtual machine

============================
Sgoettschkes/sf2ChefCookbook
============================

This cookbooks aim to set up a out of the box working server to develop symfony2 applications. It 
uses the following cookbooks authored by the guys at opscode (for more information see below):

openssl
apache2
php
mysql
database

The glue which holds them together and executes everything is the main cookbook. The config from
the vagrant file is read and put into place. It distributes it's own php.ini and apache vhost
template as needed.

=====
Todos
=====

* Add installation guide and configuration guide
** Installation so vagrant and chef are running
** Configuration of VAGRANT file
* Add Java for assetics
* running build scripts
* Adding default values (default.rb)

==================
License and Author
==================

The cookbooks used by the main cookbook can be found here: https://github.com/opscode-cookbooks/

The main cookbook was created by

Author:: Sebastian Goettschkes (<sebastian.goettschkes@boosolution.de>)

Copyright 2012, boosolution Sebastian Goettschkes

All cookbooks except for the main were created by

Author:: Adam Jacob (<adam@opscode.com>)
Author:: Joshua Timberman (<joshua@opscode.com>)
Author:: AJ Christensen (<aj@opscode.com>)
Author:: Seth Chisamore (<schisamo@opscode.com>)
Author:: Lamont Granquist (<lamont@opscode.com>)

Copyright 2009-2011, Opscode, Inc.

The whole software is licenced as followed:

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.