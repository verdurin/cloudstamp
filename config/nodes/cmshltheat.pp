# cmshlt.pp: A basic image for CMS HLT Cloud

class {
  'vmbase':
    msg => "CloudStamp CMS HLT Image",
}

class {
  'cvmfs':
    squid_list => 'http://squid-proxy.cms:3128',
    cms_site => 'T2_CH_CERN_HLT',
}


class cmshlt_wn_install {

  # Install the grid certs
  file {
    '/etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3':
      ensure => present,
      source => 'puppet:///modules/wn_install/GPG-KEY-EUGridPMA-RPM-3',
  }
  yumrepo {
    'EGI-trustanchors':
      descr => 'EGI-trustanchors',
      baseurl => 'http://repository.egi.eu/sw/production/cas/1/current/',
      gpgkey => 'file:///etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3',
      gpgcheck => 1,
      enabled => 1,
      require => File['/etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3'],
  }
  package {
    'fetch-crl':
      ensure => present,
  }
  package {
    'ca-policy-egi-core':
      ensure => present,
      require => Yumrepo['EGI-trustanchors'],
  }
  # Install the actual WN stuff
  file {
    '/etc/pki/rpm-gpg/RPM-GPG-KEY-emi':
      ensure => present,
      source => 'puppet:///modules/wn_install/RPM-GPG-KEY-emi',
  }
  yumrepo {
    'emi3-base':
      descr => 'EMI 3 base',
      baseurl => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/$basearch/base',
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-emi',
      gpgcheck => 1,
      enabled => 1,
      protect => 1,
      priority => 40,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-emi'],
  }
  yumrepo {
    'emi3-updates':
      descr => 'EMI 3 updates',
      baseurl => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/$basearch/updates',
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-emi',
      gpgcheck => 1,
      enabled => 1,
      protect => 1,
      priority => 40,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-emi'],
  }
  yumrepo {
    'emi3-contribs':
      descr => 'EMI 3 contribs',
      baseurl => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/$basearch/contribs',
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-emi',
      gpgcheck => 1,
      enabled => 1,
      protect => 1,
      priority => 40,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-emi'],
  }
  yumrepo {
    'emi3-third-party':
      descr => 'EMI 3 third-party',
      baseurl => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/$basearch/third-party',
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-emi',
      gpgcheck => 1,
      enabled => 1,
      protect => 1,
      priority => 40,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-emi'],
  }
  package {
    'emi-release':
      ensure => present,
      require => [ Yumrepo['emi3-base'],
                   Yumrepo['emi3-updates'],
                   Yumrepo['emi3-contribs'],
                   Yumrepo['emi3-third-party'],
                 ],
  }
  package {
    'emi-wn':
      ensure => present,
      require => Package['emi-release'],
  }
  yumrepo {
    'HTCondor':
      descr => 'HTCondor Stable for EPEL6',
      baseurl => 'http://research.cs.wisc.edu/htcondor/yum/stable/rhel6',
      gpgcheck => 0,
      enabled => 1,
      protect => 1,
      priority => 50,
  }
  package {
    'condor':
      ensure => present,
      require => Yumrepo['HTCondor'],
  }
}

include cmshlt_wn_install
include ssh_keys
include glidein
include wlcg
#include htcondor_hlt_heat
#include proxy_hlt_heat

