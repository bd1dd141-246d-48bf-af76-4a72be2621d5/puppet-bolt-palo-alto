# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "address" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_address',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Provide a description of this address. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'description'),

    # Provide an IP address or a network using the slash notation (Ex. 192.168.80.150 or 192.168.80.0/24).
    # You can also provide an IPv6 address or an IPv6 address with its prefix (Ex. 2001:db8:123:1::1 or 2001:db8:123:1::/64).
    # You need to provide exactly one of ip_netmask, ip_range, or fqdn.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ip_netmask'),

    # Provide an IP address range (Ex. 10.0.0.1-10.0.0.4).
    # Each of the IP addresses in the range can also be in an IPv6 form (Ex. 2001:db8:123:1::1-2001:db8:123:1::11).
    # You need to provide exactly one of ip_netmask, ip_range, or fqdn.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ip_range'),

    # Provide a fully qualified domain name. You need to provide exactly one of ip_netmask, ip_range, or fqdn.
    # The FQDN initially resolves at commit time. Entries are subsequently refreshed when the firewall performs a check every 30 minutes; all changes in the IP address for the entries are picked up at the refresh cycle
    # The FQDN is resolved by the system DNS server or a DNS proxy object, if a proxy is configured.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'fqdn'),

    # The Palo Alto tags to apply to this address. Do not confuse this with the `tag` metaparameter used to filter resource application. (a Array[String])
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The display-name of the address. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,63}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
