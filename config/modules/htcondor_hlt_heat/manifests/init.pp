class htcondor_hlt_heat

{

  file {
    '/etc/condor/condor.config':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/condor.config',
      require => Package['condor.x86_64'],
  }

  file {
    '/etc/condor/certs/condor_mapfile':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/certs/condor_mapfile',
      require => Package['condor.x86_64'],
  }

  file {
    '/etc/condor/config.d/01_HLT_Global':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/config.d/01_HLT_Global',
      require => Package['condor.x86_64'],
  }
 
  file {
    '/etc/condor/config.d/02_HLT_Worker_Defaults':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/config.d/02_HLT_Worker_Defaults',
      require => Package['condor.x86_64'],
  }

  file {
    '/etc/condor/config.d/03_HLT_Partitionable_Slots':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/config.d/03_HLT_Partitionable_Slots',
      require => Package['condor.x86_64'],
  }

  file {
    '/etc/condor/config.d/04_HLT_Security':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/config.d/04_HLT_Security',
      require => Package['condor.x86_64'],
  }

  file {
    '/etc/condor/config.d/90_HLT_DebugSettings':
      ensure => present,
      source => 'puppet:///modules/htcondor_hlt_heat/config.d/90_HLT_DebugSettings',
      require => Package['condor.x86_64'],
  }


}
