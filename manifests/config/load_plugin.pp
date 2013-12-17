define collectd::config::load_plugin(
  $globals  = '',
  $interval = '',
  $order    = '20load_plugin'
) {
  $template_fields = ['globals', 'interval']
  $params = template('collectd/generic_params.erb')

  if $params == '' {
    $content = "LoadPlugin ${title}\n"
  } else {
    $content = "<LoadPlugin ${title}>\n${params}</LoadPlugin>\n"
  }
  collectd::config::fragment { "load_plugin::${title}":
    order   => $order,
    content => $content
  }
}
