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

class {
  'wn_install':
    site_name => 'UKI-LT2-IC-HEP',
    close_se => 'gfe02.grid.hep.ph.ic.ac.uk',
    top_bdii => 'localbdii.grid.hep.ph.ic.ac.uk:2170',
}

include ssh_keys
include glidein
include wlcg

