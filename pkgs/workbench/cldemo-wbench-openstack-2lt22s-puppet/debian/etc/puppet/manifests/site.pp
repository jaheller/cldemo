node openstack_host {

    # server NICs
    file { "/etc/network/interfaces":
        source => "puppet:///files/interfaces_$hostname",
        mode => 644
    }
    exec { "/sbin/ifdown --exclude=lo -a && /sbin/ifup --exclude=lo -a":
        subscribe => File["/etc/network/interfaces"],
        refreshonly => true
    }
}


node "server1.lab.local" inherits openstack_host {
    include ::openstack::role::allinone
}

node "server2.lab.local" inherits openstack_host {

}
