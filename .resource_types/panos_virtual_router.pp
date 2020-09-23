# This file was automatically generated on 2020-09-22 14:34:58 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "virtual router" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_virtual_router',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # The color of the tag (a Optional[Array[String]])
    Puppet::Resource::Param(Any, 'interfaces'),

    # Static IPv4 Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_static'),

    # Static IPv6 Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_static_ipv6'),

    # OSPF Interface Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ospf_int'),

    # OSPF External Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ospf_ext'),

    # OSPFv3 External Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ospfv3_int'),

    # OSPFv3 Interface Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ospfv3_ext'),

    # IBGP Administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ibgp'),

    # EBGP administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_ebgp'),

    # RIP administrative distance. Range is 10-240. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ad_rip')
  ],
  [
    # The display-name of the tag. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,31}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
