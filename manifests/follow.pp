define logentries::follow($log_file = $title, $log_name) {
  exec { "le_follow_${log_file}":
    command => "/usr/bin/le follow ${log_file} --name=${log_name}",
    unless => "/usr/bin/le followed ${log_file}",
    require => [ Package['logentries'], Exec['le_register'] ],
    notify  => Service['logentries'],
  }
}