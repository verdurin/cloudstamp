# cmsopendata.pp: A basic image for CMS Open Data

class {
  'vmbase':
    msg => "CloudStamp CMS Open Data Image",
}

class {
  'cvmfs':
    squid_list => 'http://lt2cache00.grid.hep.ph.ic.ac.uk:3128',
    cms_site => 'T2_UK_London_IC',
}

include ssh_keys
include wlcg
include wn_install

