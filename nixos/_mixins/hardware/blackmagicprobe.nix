_: {
  # Black Magic Probe
  # https://raw.githubusercontent.com/blackmagic-debug/blackmagic/main/driver/99-blackmagic-plugdev.rules
  services.udev.extraRules = ''
  # Black Magic Probe
  # there are two connections, one for GDB and one for UART debugging
  # copy this to /etc/udev/rules.d/99-blackmagic.rules
  # and run sudo udevadm control -R
  ACTION!="add|change", GOTO="blackmagic_rules_end"
  SUBSYSTEM=="tty", ACTION=="add", ATTRS{interface}=="Black Magic GDB Server", SYMLINK+="ttyBmpGdb"
  SUBSYSTEM=="tty", ACTION=="add", ATTRS{interface}=="Black Magic UART Port", SYMLINK+="ttyBmpTarg"
  SUBSYSTEM=="tty", ACTION=="add", ATTRS{interface}=="Black Magic GDB Server", SYMLINK+="ttyBmpGdb%E{ID_SERIAL_SHORT}"
  SUBSYSTEM=="tty", ACTION=="add", ATTRS{interface}=="Black Magic UART Port", SYMLINK+="ttyBmpTarg%E{ID_SERIAL_SHORT}"
  SUBSYSTEM=="usb", ATTR{idVendor}=="1d50", ATTR{idProduct}=="6017", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  SUBSYSTEM=="usb", ATTR{idVendor}=="1d50", ATTR{idProduct}=="6018", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  LABEL="blackmagic_rules_end"
  '';
}
