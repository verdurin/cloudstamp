# glideinwms.pp: A basic image for glideinWMS

class {
  'vmbase':
    msg => "CloudStamp GridPP CMS Image",
}

class {
  'cvmfs':
    squid_list => 'http://lt2cache00.grid.hep.ph.ic.ac.uk:3128',
    cms_site => 'T2_UK_London_IC',
}

class {
  'wn_install':
    site_name => 'UKI-LT2-IC-HEP',
    close_se => 'gfe02.grid.hep.ph.ic.ac.uk',
    top_bdii => 'localbdii.grid.hep.ph.ic.ac.uk:2170',
}

include ssh_keys
include glidein
include wlcg
include glexec
include rte

