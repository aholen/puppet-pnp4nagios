
class pnp4nagios::config {

  #  include pnp4nagios::params
  $monitoring_type = $pnp4nagios::params::monitoring_type
  $use_url_rewriting = $pnp4nagios::params::use_url_rewriting
  $nagios_base = $pnp4nagios::params::nagios_base
  $log_type = $pnp4nagios::params::log_type
  $debug_lvl = $pnp4nagios::params::debug_lvl

  file { 'npcdcfg':
    name => '/etc/pnp4nagios/npcd.cfg',
    owner => root,
    group => root,
    mode => 644,
    notify => Class[pnp4nagios::service],
    content => template('pnp4nagios/npcd.cfg.erb'),
  }

  file { 'php_config':
    name => '/etc/pnp4nagios/config.php',
    owner => root,
    group => root,
    mode => 644,
    notify => Class[pnp4nagios::service],
    content => template('pnp4nagios/config.php.erb'),
  }

  file { '/var/log/pnp4nagios':
    ensure => directory,
    owner => $monitoring_type,
    group => $monitoring_type,
    mode => 775,
  }

  file { '/var/log/pnp4nagios/kohana':
    ensure => directory,
    owner => $monitoring_type,
    group => $monitoring_type,
    mode => 775,
  }

  file { '/var/log/pnp4nagios/stats':
    ensure => directory,
    owner => $monitoring_type,
    group => $monitoring_type,
    mode => 775,
  }

  file { '/var/lib/pnp4nagios':
    ensure => directory,
    owner => $monitoring_type,
    group => $monitoring_type,
    mode => 775,
  }

  file { '/var/spool/pnp4nagios':
    ensure => directory,
    owner => $monitoring_type,
    group => $monitoring_type,
    mode => 755,
  }

}

