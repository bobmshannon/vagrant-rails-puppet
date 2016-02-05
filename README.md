# vagrant-rails-puppet
A ready to use Ruby on Rails development environment based on CentOS 6.6 using Vagrant and Puppet.

Includes the following:
* Ruby v2.3.0 installed and enabled by default via rvm
* Ruby v1.9.3 (enable by running `rvm use 1.9.3`)
* NodeJS v5.5.0
* Nginx/Phusion Passenger
* PostgreSQL
* SQLite

To get started, first install [Vagrant](https://www.vagrantup.com/downloads.html) and then run the following commands:

```
git clone git@github.com:bobmshannon/vagrant-rails-puppet.git
cd vagrant-rails-puppet
vagrant up
```

Once the VM has booted, you can then access the Rails app via [http://localhost:8080/](http://localhost:8080/).
