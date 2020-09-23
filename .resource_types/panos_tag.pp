# This file was automatically generated on 2020-09-22 14:34:58 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "tags" objects on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_tag',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # The color of the tag (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'color'),

    # Add a label or description to remind you what the tag is used for. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'comments')
  ],
  [
    # The display-name of the tag. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,127}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
