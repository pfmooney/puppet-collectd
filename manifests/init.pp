# == Class: collectd
#
# Full description of class collectd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { collectd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class collectd(
  $baseDir = '',
  $loadPlugin = [],
  $autoLoadPlugin = '',
  $include = [],
  $pidFile = '',
  $pluginDir = '',
  $typesDB = '',
  $interval = '',
  $timeout = '',
  $readThreads = '',
  $writeThreads = '',
  $writeQueueLimitHigh = '',
  $hostname = '',
  $fqdnLookup = '',
  $preCacheChain = '',
  $postCacheChain = '',
) {
  $template_fields =  [
    'baseDir',
    'autoLoadPlugin',
    'pidFile',
    'pluginDir',
    'typesDB',
    'interval',
    'timeout',
    'readThreads',
    'writeThreads',
    'writeQueueLimitHigh',
    'hostname',
    'fqdnLookup',
    'preCacheChain',
    'postCacheChain',
  ]
  $template_rename = {
    'pidFile'    => 'PIDFile',
    'fqdnLookup' => 'FQDNLookup',
  }
  $template_tabstop = 0
  $content = template('collectd/generic_params.erb')
  if $content != '' {
    collectd::config::fragment { 'base_params':
      order   => '00params',
      content => $content
    }
  }
#"
#BaseDir Directory
#LoadPlugin
#AutoLoadPlugin false|true
#Include Path [pattern]
#PIDFile File
#PluginDir Directory
#TypesDB File [File ...]
#Interval Seconds
#Timeout Iterations
#ReadThreads Num
#WriteThreads Num
#WriteQueueLimitHigh HighNum
#Hostname Name
#FQDNLookup true|false
#PreCacheChain ChainName
#PostCacheChain ChainName
#"
}
