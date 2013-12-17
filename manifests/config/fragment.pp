define collectd::config::fragment(
  $order,
  $content = undef,
  $source = undef,
) {
  include collectd::config
  concat::fragment { "collectd::${title}":
    target  => $collectd::config::path,
    order   => $order,
    content => $content,
    source  => $source
  }
}
