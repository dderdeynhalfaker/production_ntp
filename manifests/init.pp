# Manage NTP
class production_ntp {
  ensure_packages(['ntpd'])

  file { '/etc/ntp.conf':
    source  => 'puppet:///modules/production_ntp/ntp.conf',
    notify  => Service['ntpd'],
    require => Package['ntpd'],
  }

  service { 'ntpd':
    ensure => running,
    enable => true,
  }
}
