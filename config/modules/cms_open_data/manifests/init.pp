
class cms_open_data
{
  # Various packages needed for the CMS Open Data image
  # 
  # 

  package {
	'git':
	ensure => present,
  }

  package {
	'firefox':
	ensure => present,
  }

  # Hack to deal with lack of yum groupinstall
  exec { 'yum Group Install':
  	unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
  	command => '/usr/bin/yum -y groupinstall "Development tools"',
  }

  exec { 'yum Group Install':
  	unless  => '/usr/bin/yum grouplist "Desktop" | /bin/grep "^Installed Groups"',
  	command => '/usr/bin/yum -y groupinstall "Desktop"',
  }
   
  exec { 'yum Group Install':
  	unless  => '/usr/bin/yum grouplist "Finnish support" | /bin/grep "^Installed Groups"',
  	command => '/usr/bin/yum -y groupinstall "Desktop"',
  }

}

