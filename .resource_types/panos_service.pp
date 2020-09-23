# This file was automatically generated on 2020-09-22 14:34:58 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "service" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_service',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Provide a description of this service. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'description'),

    # Specify the protocol used by the service (a Enum["tcp", "udp"])
    Puppet::Resource::Param(Any, 'protocol'),

    # Port can be a single port number, a range `1-65535`, or comma separated values  `80, 8080, 443` (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'port'),

    # Port can be a single port number, a range `1-65535`, or comma separated values  `80, 8080, 443` (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'src_port'),

    # The Palo Alto tags to apply to this address-group. Do not confuse this with the `tag` metaparameter used to filter resource application. (a Array[String])
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The display-name of the service. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,63}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
