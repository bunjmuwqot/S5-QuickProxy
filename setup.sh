#!/bin/bash

# Default passwords
ROOT_PASS=""
S5_PASS="Bmp0xZoxrs0FpsIQ"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -rootpass)
      ROOT_PASS="$2"
      shift 2
      ;;
    -s5pass)
      S5_PASS="$2"
      shift 2
      ;;
    *)
      echo "Unknown parameter: $1"
      echo "Usage: $0 [-rootpass ROOT_PASSWORD] [-s5pass SOCKS5_PASSWORD]"
      exit 1
      ;;
  esac
done

# Install Dante Server
apt-get update
apt-get install -y dante-server

# Auto-detect network interface name
EXTERNAL_INTERFACE=$(ip route get 8.8.8.8 | awk -- '{print $5}' | head -n 1)

# Configure Dante Server
cat <<EOF > /etc/danted.conf
logoutput: /var/log/danted.log
internal: 0.0.0.0 port = 80
external: $EXTERNAL_INTERFACE
socksmethod: username
user.privileged: root
user.unprivileged: nobody

client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: connect disconnect error
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    command: bind connect udpassociate
    log: connect disconnect error
}

socks block {
    from: 0.0.0.0/0 to: lo
    log: connect disconnect error
}
EOF

# Add user
useradd --shell /usr/sbin/nologin admin 2>/dev/null || echo "User admin already exists"
echo "admin:$S5_PASS" | chpasswd

# If root password is provided, update it
if [ -n "$ROOT_PASS" ]; then
    echo "root:$ROOT_PASS" | chpasswd
    echo "Root password updated"
fi

# Create log file
touch /var/log/danted.log
chown nobody:nogroup /var/log/danted.log

# Restart Dante Server
systemctl restart danted
systemctl enable danted

echo "Socks5 proxy setup complete."
echo "Socks5 username: admin"
echo "Socks5 password: $S5_PASS"
if [ -n "$ROOT_PASS" ]; then
    echo "Root password has been updated"
fi
