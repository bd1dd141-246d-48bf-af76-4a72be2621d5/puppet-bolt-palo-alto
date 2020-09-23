# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capabilities to manage "administrator" user accounts on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_admin',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Provide a password hash. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'password_hash'),

    # Provide an authentication profile. You can use this setting for RADIUS, TACACS+, LDAP, Kerberos, or local database authentication. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'authentication_profile'),

    # Enable this option to use client certificate authentication for web access.
    # If you select this option, a username and password are not required; the certificate is sufficient to authenticate access to the firewall.
    #  (a Boolean)
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'client_certificate_only'),

    # Provide the users public key in plain text (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ssh_key'),

    # Specify the access level for the administrator.
    # 
    # * superuser: Has full access to the firewall and can define new administrator accounts and virtual systems. You must have superuser privileges to create an administrative user with superuser privileges.
    # 
    # * superreader: Has read-only access to the firewall.
    # 
    # * deviceadmin: Has full access to all firewall settings except for defining new accounts or virtual systems.
    # 
    # * devicereader: Has read-only access to all firewall settings except password profiles (no access) and administrator accounts (only the logged in account is visible).
    #  (a Enum["superuser", "superreader", "devicereader", "deviceadmin", "custom"])
    Puppet::Resource::Param(Any, 'role'),

    # Specify the role profile for the user
    # The following built in roles are available:
    # 
    # * auditadmin: The Audit Administrator is responsible for the regular review of the firewall’s audit data.
    # 
    # * cryptoadmin: The Cryptographic Administrator is responsible for the configuration and maintenance of cryptographic elements related to the establishment of secure connections to the firewall.
    # 
    # * securityadmin: The Security Administrator is responsible for all other administrative tasks (e.g. creating the firewall’s security policy) not addressed by the other two administrative roles.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'role_profile')
  ],
  [
    # The username. (a Pattern[/^[a-zA-z0-9\-_\.]{1,31}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
