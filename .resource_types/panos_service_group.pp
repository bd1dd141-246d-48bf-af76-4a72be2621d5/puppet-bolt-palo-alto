# This file was automatically generated on 2020-09-22 14:34:58 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "Service Group" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_service_group',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # An array of `panos_service`, or `panos_service_group` that form this group. (a Array[String])
    Puppet::Resource::Param(Any, 'services'),

    # The Palo Alto tags to apply to this service-group. Do not confuse this with the `tag` metaparameter used to filter resource application. (a Array[String])
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The display-name of the service-group. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,63}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
