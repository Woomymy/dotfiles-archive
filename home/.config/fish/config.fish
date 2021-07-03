set -gx GPG_TTY (tty) # Fixes "inapropriate Ioctl for device" errors
set -gx PATH $PATH ~/.cargo/bin # Add cargo binaries to path

