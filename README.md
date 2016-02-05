# vagrant-rails-puppet
A ready to use [Ruby on Rails](http://guides.rubyonrails.org/getting_started.html) development environment running under [CentOS](https://www.centos.org/) 6.6 using [Vagrant](https://www.vagrantup.com/downloads.html) and [Puppet](https://puppetlabs.com).

Includes the following:
* Ruby v2.3.0 installed and enabled by default via `rvm`
* Ruby v1.9.3 (enable by running `rvm use 1.9.3`)
* NodeJS v5.5.0 installed and enabled by default via `nvm`
* Nginx/Phusion Passenger
* PostgreSQL
* SQLite

To get started, first install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Afterward, run the following commands:

```
git clone git@github.com:bobmshannon/vagrant-rails-puppet.git
cd vagrant-rails-puppet
vagrant up
```

Once the VM has booted you will be able to access the Rails app via [http://localhost:8080/](http://localhost:8080/). You will also be able login to the VM at anytime by running `vagrant ssh`.
