# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to execute arbitrary configuration commands on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_arbitrary_commands',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # The XML to be set on the device. If working with large XML structures it is recommended to use the file() function e.g.: file(path/to/file.xml). (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'xml')
  ],
  [
    # The PANOS API XPath on which to set the `xml`. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'xpath', true)
  ],
  {
    /(?m-ix:(.*))/ => ['xpath']
  },
  true,
  false)
