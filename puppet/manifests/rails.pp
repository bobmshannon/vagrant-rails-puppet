node default {
  # Ruby (managed via RVM)
  class { '::rvm': }
  rvm::system_user { vagrant: ; }
  rvm_system_ruby {
    'ruby-2.3.0':
      ensure      => 'present',
      default_use => true;
    'ruby-1.9.3':
      ensure      => 'present',
      default_use => false;
  }
  rvm_gem {
    'bundler':
      name         => 'bundler',
      ruby_version => 'ruby-2.3.0',
      ensure       => latest;
    'rails':
      name         => 'rails',
      ruby_version => 'ruby-2.3.0',
      ensure       => latest;
  }
  # NodeJS (managed via NVM)
  class { 'nvm':
    user => 'vagrant',
    install_node => '5.5.0'
  }
  # Nginx
  class { 'nginx': 
    http_cfg_append => {
      passenger_root          => '/usr/lib/ruby/1.8/phusion_passenger/locations.ini',
      passenger_ruby          =>  '/usr/local/rvm/gems/ruby-2.3.0/wrappers/ruby',
      passenger_instance_registry_dir => '/var/run/passenger-instreg'
    }
  }
  nginx::resource::vhost { 'default_server':
    www_root => '/vagrant/public',
    vhost_cfg_append => {
      'passenger_enabled' => 'on',
      'passenger_app_env'    => 'development',
    }
  }
  # SQLite
  class { 'sqlite': }
  # PostgreSQL
  class { 'postgresql::server':
    postgres_password          => 'changeme'
  }
  # Phusion Passenger
  class { 'passenger': }
  # Developer Utilities
  class { 'utils': }
  # Firewall Rules
  class { 'firewall': }
  # Update MOTD
  class { 'motd':
    content => "Welcome to your Rails development VM. To get started, access http://localhost:8080/ in your web browser.\n"
  } 
  # Generate Rails App
  class { 'railsapp': }
} 
class passenger {
  # Install Phusion Passenger + Nginx
  # If nginx is already installed, then it will be re-compiled with support for Phusion.
  exec { 'passenger::install':
    command => 'yum -y install epel-release pygpgme curl; sudo curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo; yum -y install nginx passenger',
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
  }
}
class utils {
  # Install frequently used tools and utilites to ease the development process.
  # Feel free to append more packages accordingly.
  exec { 'utils::install':
    command => 'yum -y install nano git',
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
  }
}
class firewall {
  # Set firewall rules using iptables.
  exec { 'firewall::apply_rules':
    command => 'iptables -I INPUT -p tcp --dport 80 -j ACCEPT',
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
  }
}
class railsapp {
  # Generate a new rails app.
  exec { 'railsapp::generate':
    command => 'cd /vagrant; rails new tmp/; cd tmp/; mv * ../; cd ..; rm -rf tmp/',
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'    
  }
}