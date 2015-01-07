node 'wbench.lab.local' {
}

node 'leaf1.lab.local' {
  include base::role::switch,
    vmware-demo::interfaces

  class { 'portsconf':
    switchtype => '40G',
    stage      => 'setup',
  }

  class { 'vmware-demo::clag':
    peer_ip => '169.254.1.2',
    peer_if => 'peerlink.4094',
    sys_mac => '44:38:39:FF:40:94',
  }
}

node 'leaf2.lab.local' {
  include base::role::switch,
    vmware-demo::interfaces

  class { 'portsconf':
    switchtype => '40G',
    stage      => 'setup',
  }

  class { 'vmware-demo::clag':
    peer_ip => '169.254.1.1',
    peer_if => 'peerlink.4094',
    sys_mac => '44:38:39:FF:40:94',
  }
}

node 'spine1.lab.local' {
}

node 'spine2.lab.local' {
}
