# This file was automatically generated on 2020-09-22 14:34:58 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides Puppet with the capilities to manage "Security Policy Rules" on Palo Alto devices.
Puppet::Resource::ResourceType3.new(
  'panos_security_policy_rule',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Specifies whether the rule applies to traffic within a zone, between zones, or both:
    # 
    # * universal: Applies the rule to all matching interzone and intrazone traffic in the specified source and destination zones.
    # For example, if you create a universal role with source zones A and B and destination zones A and B, the rule would apply to
    # all traffic within zone A, all traffic within zone B, and all traffic from zone A to zone B and all traffic from zone B to zone A.
    # 
    # * intrazone: Applies the rule to all matching traffic within the specified source zones (you cannot specify a destination zone for
    # intrazone rules). For example, if you set the source zone to A and B, the rule would apply to all traffic within zone A and all
    # traffic within zone B, but not to traffic between zones A and B.
    # 
    # * interzone: Applies the rule to all matching traffic between the specified source and destination zones. For example, if you set
    # the source zone to A, B, and C and the destination zone to A and B, the rule would apply to traffic from zone A to zone B, from zone B
    # to zone A, from zone C to zone A, and from zone C to zone B, but not traffic within zones A, B, or C.
    #  (a Enum["universal", "interzone", "intrazone"])
    Puppet::Resource::Param(Any, 'rule_type'),

    # Provide a description of the service. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'description'),

    # A policy tag is a keyword or phrase that allows you to sort or filter policies. This is useful when you have defined many policies and want to
    # view those that are tagged with a particular keyword.For example, you may want to tag certain rules with specific words like Decrypt and No-decrypt,
    # or use the name of a specific data center for policies associated with that location.
    #  (a Optional[Array[String]])
    Puppet::Resource::Param(Any, 'tags'),

    # Zones must be of the same type (Layer 2, Layer 3, or virtual wire).
    # 
    # Multiple zones can be used to simplify management. For example, if you have three different internal zones (Marketing, Sales, and Public Relations)
    # that are all directed to the untrusted destination zone, you can create one rule that covers all cases.
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'source_zones'),

    # The list of source addresses, address groups, or regions (a Array[String])
    Puppet::Resource::Param(Any, 'source_address'),

    # Matches on the reverse of the `source_address` value. (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'negate_source'),

    # The following source values are supported:
    # 
    # * ['any']: Include any traffic regardless of user data.
    # 
    # * ['pre-logon']: Include remote users that are connected to the network using GlobalProtect, but are not logged into their system.
    # When the Pre-logon option is configured on the Portal for GlobalProtect clients, any user who is not currently logged into their machine
    # will be identified with the username pre-logon. You can then create policies for pre-logon users and although the user is not logged in directly,
    # their machines are authenticated on the domain as if they were fully logged in.
    # 
    # * ['known-user']: Includes all authenticated users, which means any IP with user data mapped. This option is equivalent to the domain users group on a domain.
    # 
    # * ['unknown']: Includes all unauthenticated users, which means IP addresses that are not mapped to a user. For example, you could use unknown for guest
    # level access to something because they will have an IP on your network but will not be authenticated to the domain and will not have IP
    # to user mapping information on the firewall.
    # 
    # * Or provide a list of specific users. E.g. ['admin','john.doe','jane.doe']
    # 
    # Note: If you are using a RADIUS server and not the User-ID agent, the list of users does not display; you must enter user information manually.
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'source_users'),

    # Specifiy one or more HIP profiles. A HIP enables you to collect information about the security status of your end hosts, such as whether they have the latest
    # security patches and antivirus definitions installed. Using host information profiles for policy enforcement enables granular security that ensures that the
    # remote hosts accessing your critical resources are adequately maintained and in adherence with your security standards before they are allowed access to your
    # network resources.
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'hip_profiles'),

    # Specify one or more destination zones. Zones must be of the same type (Layer 2, Layer 3, or virtual wire). To define new zones, refer to “Defining Security Zones”.
    # Multiple zones can be used to simplify management. For example, if you have three different internal zones (Marketing, Sales, and Public Relations) that are all
    # directed to the untrusted destination zone, you can create one rule that covers all cases.
    # 
    # Note: On intrazone rules, you cannot define a Destination Zone because these types of rules only match traffic with a source and a destination within the same zone.
    # To specify the zones that match an intrazone rule you only need to set the Source Zone.
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'destination_zones'),

    # Specify one or more destination addresses, address groups or regions (a Array[String])
    Puppet::Resource::Param(Any, 'destination_address'),

    # Matches on the reverse of the `destination_address` value. (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'negate_destination'),

    # Select specific applications for the security rule. If an application has multiple functions, you can select the overall application or individual functions.
    # If you select the overall application, all functions are included and the application definition is automatically updated as future functions are added.
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'applications'),

    # Select services to limit to specific TCP and/or UDP port numbers. The following values are valid:
    # 
    # * ['any']: The selected applications are allowed or denied on any protocol or port.
    # 
    # * ['application-default']: The selected applications are allowed or denied only on their default ports defined by Palo Alto Networks®.
    # This option is recommended for allow policies because it prevents applications from running on unusual ports and protocol which, if not
    # intentional, can be a sign of undesired application behavior and usage.
    # 
    # Note that when you use this option, the firewall still checks for all applications on all ports but, with this configuration, applications are only allowed on their default ports and protocols.
    # 
    # * A list of services. E.g. ['service-http', 'service-https', 'my_custom_service']
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'services'),

    # The destination URL categories. The following values are valid:
    # 
    # * ['any']: Allow or deny all sessions regardless of the URL category.
    # 
    # * A list of specific categories or custom categories. E.g ['gambling','malware','my_custom_category']
    #  (a Array[String])
    Puppet::Resource::Param(Any, 'categories'),

    # To specify the action for traffic that matches the attributes defined in a rule, select from the following actions:
    # 
    # * allow: Allows the traffic.
    # 
    # * deny: Blocks traffic, and enforces the default Deny Action defined for the application that is being denied. To view the deny action defined by default for an application,
    # view the application details in Objects > Applications. Because the default deny action varies by application, the firewall could block the session and send a reset for one
    # application, while it could drop the session silently for another application.
    # 
    # * drop: Silently drops the application. A TCP reset is not sent to the host/application, unless `ICMP Unreachable` is set to true.
    # 
    # * reset-client: Sends a TCP reset to the client-side device.
    # 
    # * reset-server: Sends a TCP reset to the server-side device.
    # 
    # * reset-both: Sends a TCP reset to both the client-side and server-side devices.
    #  (a Enum["deny", "allow", "drop", "reset-client", "reset-server", "reset-both"])
    Puppet::Resource::Param(Any, 'action'),

    # Only available for Layer 3 interfaces. When you configure security policy to drop traffic or to reset the connection, the traffic does not reach the destination host.
    # In such cases, for all UDP traffic and for TCP traffic that is dropped, you can enable the firewall to send an ICMP Unreachable response to the source IP address from
    # where the traffic originated. Enabling this setting allows the source to gracefully close or clear the session and prevents applications from breaking.
    #  (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'icmp_unreachable'),

    # Generates a traffic log entry for the start of a session  (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_start'),

    # Generates a traffic log entry for the end of a session (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_end'),

    # To forward the local traffic log and threat log entries to remote destinations, such as Panorama and syslog servers, specifiy which log forwarding profile should be used.
    # Note that the generation of threat log entries is determined by the security profiles.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'log_setting'),

    # Specify which type of profile will be used. (a Optional[Enum["profiles", "group", "none"]])
    Puppet::Resource::Param(Any, 'profile_type'),

    # Specify the group profile, can only be set when `profile_type` is `group`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'group_profile'),

    # Specify the anti-virus profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'anti_virus_profile'),

    # Specify the URL filtering profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'url_filtering_profile'),

    # Specify the data filtering profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'data_filtering_profile'),

    # Specify the file blocking profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'file_blocking_profile'),

    # Specify the spyware profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'spyware_profile'),

    # Specify the vulnerability profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'vulnerability_profile'),

    # Specify the wildfire analysis profile, can only be set when `profile_type` is `profiles`. To unset specify `none`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'wildfire_analysis_profile'),

    # Specify the schedule profile to limit the days and times when the rule is in effect (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'schedule_profile'),

    # Specify which QoS profile should be used to change the Quality of Service setting on packets matching the rule. (a Optional[Enum["follow-c2s-flow", "ip-precedence", "ip-dscp", "none"]])
    Puppet::Resource::Param(Any, 'qos_type'),

    # Specify the IP DSCP QoS marking setting, only if `qos_type` is `ip-dscp`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ip_dscp'),

    # Specify the IP Precedence QoS marking setting, only if `qos_type` is `ip-precedence`. (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ip_precedence'),

    # To disable packet inspection from the server to the client, enable this option. This option may be useful under heavy server load conditions. (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'disable_server_response_inspection'),

    # Specify if the security policy rule should be disabled. (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'disable'),

    # Specifies where the rule should be inserted.
    # 
    # * If specified with an empty string, the rule will be inserted at the TOP.
    #   NOTE: Only one rule should be set to top
    # * If a rule name is specified, the rule will be inserted after the given rule.
    # * If this attribute is omitted, the rule will be added at the bottom.
    #   NOTE: Rules cannot be moved to the bottom once created. Instead specify the rule name to insert after.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'insert_after')
  ],
  [
    # The display-name of the security-policy-rule. Restricted to 31 characters on PAN-OS version 7.1.0. (a Pattern[/^[a-zA-z0-9\-_\s\.]{1,63}$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
