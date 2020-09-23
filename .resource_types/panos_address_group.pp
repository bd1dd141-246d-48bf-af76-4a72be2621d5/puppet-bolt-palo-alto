# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "address_groups" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_address_group',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Provide a description of this address-group. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'description'),

    # A `static` or `dynamic` address-group. (a Enum["static", "dynamic"])
    Puppet::Resource::Param(Any, 'type'),

    # One or more `panos_address` or `panos_address_group` that form this group. Used only when type is static. (a Optional[Array[String]])
    Puppet::Resource::Param(Any, 'static_members'),

    # To create a dynamic address group, use the match criteria to assemble the members to be included in the group.
    # Define the Match criteria using the AND or OR operators.
    #   example: 'tag1' and 'tag2' or 'tag3'
    # Used only when type is dynamic.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'dynamic_filter'),

    # The Palo Alto tags to apply to this address-group. Do not confuse this with the `tag` metaparameter used to filter resource application. (a Array[String])
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The display-name of the address-group. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,63}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
