class collectd::config(
  $path   = '/etc/collectd.conf',
  $owner  = 'root',
  $group  = 'root',
  $mode   = '0444',
) {
  include concat::setup
  concat { $path:
    owner => $owner,
    group => $group,
    mode  => $mode,
    warn  => true
  }
}
