# cmsopendatacern.pp: A basic image for CMS Open Data running on CERN Private Cloud

class {
  'vmbase':
    msg => "CloudStamp CMS Open Data Image",
}

class {
  'cvmfs':
    squid_list => 'http://ca-proxy.cern.ch:3128;http://lxbrb1413.cern.ch:3128|http://lxbrb1414.cern.ch:3128',
    cms_site => 'T2_CH_CERN_AI',
}

include ssh_keys
include wlcg
include wn_install
include cms_open_data
