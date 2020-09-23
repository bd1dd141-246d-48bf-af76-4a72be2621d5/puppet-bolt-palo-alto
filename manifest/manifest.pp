panos_address { 'newaddressrange':
    ensure => 'absent',
    description => 'This address range is for demo purposes',
    ip_range => '10.0.0.1-10.0.0.5',
    tags => [],
}

panos_admin { 'default admin account':
    ensure => 'absent',
    name => 'admin',
}
