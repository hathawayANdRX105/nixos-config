def main [] {
  # if ($env.YAZI_ID | is-empty) {
  #   print "Error: YAZI_ID not set. reveal-in-yazi requires that you open helix from yazelix's yazi."
  #   return
  # }

  # if ($file_path | is-empty) {
  #   print "Error: Buffer name not provided"
  #   return
  # }

  # let buffer_name = $buffer_name | path expand 
  # let full_path = ($env.PWD | path join $buffer_name | path expand)
  # let dir_name = $file_path | path dirname

  # print $name
  # $name o>> ~/tmp.nu
  # ya emit-to $env.YAZI_ID cd $dir_name | complete 
  # FIX: The command line expandation in helix does not working.
  zellij action move-focus left
}
