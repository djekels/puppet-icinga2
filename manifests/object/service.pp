# == Defined type: icinga2::object::service
#  
# This is a defined type for Icinga 2 service objects.
# See the following Icinga 2 doc page for more info:
# http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/configuring-icinga2#objecttype-service
#
# === Parameters
#
# See the inline comments.
#

define icinga2::object::service (
  $object_servicename = $name,
  $template_to_import = 'generic-service',
  $display_name = $name,
  $host_name = $fqdn,
  $groups = [],
  $vars = {},
  $check_command = undef,
  $max_check_attempts = undef,
  $check_period = undef,
  $check_interval = undef,
  $retry_interval = undef,
  $enable_notifications = undef,
  $enable_active_checks = undef,
  #Parameters to add:
  # * enable_passive_checks
  # * enable_event_handler
  # * enable_flap_detection
  # * enable_perfdata
  # * event_command
  # * flapping_threshold
  # * volatile
  # * notes
  # * notes_url
  # * action_url
  # * icon_image
  # * icon_image_alt  
  $target_dir        = '/etc/icinga2/conf.d',
  $target_file_name  = "${name}.conf",
  $target_file_owner = 'root',
  $target_file_group = 'root',
  $target_file_mode  = '644'
) {

  file {"${target_dir}/${target_file_name}":
    ensure => file,
    owner   => $target_file_owner,
    group   => $target_file_group,
    mode    => $target_file_mode,
    content => template('icinga2/object_service.conf.erb'),
    notify => Service['icinga2'],
  }

}