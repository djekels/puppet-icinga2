class { 'icinga2':
  confd     => false,
  features  => ['checker','mainlog'],
}

class { 'icinga2::feature::api':
  pki             => 'icinga2',
  ca_host         => 'icinga2-puppet3.int.netways.de',
  ticket_salt     => '5a3d695b8aef8f18452fc494593056a4',
  accept_config   => true,
  accept_commands => true,
  endpoints       => {
    'NodeName' => {},
    'icinga2-puppet3.int.netways.de' => {
      'host' => '192.168.56.103',
    }
  },
  zones           => {
    'NodeName' => {
      'endpoints' => ['NodeName'],
      'parent' => 'master',
    },
    'master' => {
      'endpoints' => ['icinga2-puppet3.int.netways.de']
    }
  }
}

icinga2::object::zone { 'global-templates':
  global => true,
}
