# This file was automatically generated on 2020-09-22 14:34:57 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# @summary This type provides Puppet with the capabilities to manage IPv4 Path Monitors on Palo Alto devices.
# 
# @note Can only be configured on PAN-OS 8.1.0 devices.
Puppet::Resource::ResourceType3.new(
  'panos_path_monitor',
  [
    # Whether this resource should be present or absent on the target system. (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # Specify the IP address that the firewall will use as the source in the ICMP ping to the monitored destination:
    # 
    #  * If the interface has multiple IP addresses, select one.
    #  * If you specify an interface, the firewall uses the first IP address assigned to the interface by default.
    #  * If you specify `DHCP` (Use DHCP Client address), the firewall uses the address that DHCP assigned to the interface. To see the DHCP address, select NetworkInterfacesEthernet and in the row for the Ethernet interface, click on Dynamic DHCP Client. The IP Address appears in the Dynamic IP Interface Status window.
    # (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'source'),

    # Specify a robust, stable IP address or address object for which the firewall will monitor the path. The monitored destination and the static route destination must use the same address family (IPv4 or IPv6)
    # (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'destination'),

    # Specify the ICMP ping interval in seconds to determine how frequently the firewall monitors the path (pings the monitored destination; range is 1-60; default is 3).
    # (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'interval'),

    # Specify the number of consecutive ICMP ping packets that do not return from the monitored destination before the firewall considers the link down. Based on the Any or All failure condition, if path monitoring is in failed state, the firewall removes the static route from the RIB (range is 3-10; default is 5).
    # 
    # For example, a Ping Interval of 3 seconds and Ping Count of 5 missed pings (the firewall receives no ping in the last 15 seconds) means path monitoring detects a link failure. If path monitoring is in failed state and the firewall receives a ping after 15 seconds, the link is deemed up; based on the Any or All failure condition, path monitoring to Any or All monitored destinations can be deemed up, and the Preemptive Hold Time starts.
    #  (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'count'),

    # Select to enable path monitoring of this specific destination for the static route; the firewall sends ICMP pings to this destination.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'enable')
  ],
  [
    # The name to identify the path monitor with. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'path', true),

    # A name to identify the static route which is usually the virtual router name followed by a forward slash. (a String)
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'route', true)
  ],
  {
    /^(?<route>[^\/]*\/[^\/]*)\/(?<path>.*)$/ => ['route', 'path']
  },
  true,
  false)
