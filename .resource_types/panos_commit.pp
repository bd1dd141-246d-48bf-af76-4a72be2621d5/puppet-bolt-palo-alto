# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# @summary When evaluated, this resource commits all outstanding changes in the target device's configuration to the active configuration.
# 
# @note It is automatically scheduled after all other PANOS resources.
Puppet::Resource::ResourceType3.new(
  'panos_commit',
  [
    # Whether a commit should happen (a Boolean)
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'commit')
  ],
  [
    # The name of the resource you want to manage. Can only be "commit". (a Enum["commit"])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
