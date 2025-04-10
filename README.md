# S5-QuickProxy



## Features

- **One-command deployment**: Set up a fully functional SOCKS5 proxy server in seconds
- **Automatic network detection**: Automatically detects your server's network interface
- **Secure authentication**: Configures username/password authentication out of the box
- **Customizable credentials**: Easily set custom passwords via command-line arguments
- **System integration**: Properly sets up system service for automatic startup
- **Low footprint**: Minimal resource usage suitable for even small VPS instances

## Installation

```bash
git clone https://github.com/yourusername/S5-QuickProxy.git
cd S5-QuickProxy
chmod +x setup.sh
sudo ./setup.sh
```

## Usage

Basic installation with default settings:

```bash
sudo ./setup.sh
```

Customize the SOCKS5 password:

```bash
sudo ./setup.sh -s5pass YourCustomPassword
```

Customize both SOCKS5 and root passwords:

```bash
sudo ./setup.sh -s5pass YourCustomPassword -rootpass YourRootPassword
```

## After Installation

Once installed, your SOCKS5 proxy will be:
- Running on port 80
- Accessible using username: admin
- Password as specified (or default if not specified)
- Automatically started on system boot

## Security Considerations

- The script runs Dante on port 80 by default for maximum compatibility
- Consider using a firewall to restrict access if needed
- Regularly update your passwords for enhanced security

## Requirements

- Debian/Ubuntu-based Linux distribution
- Root privileges for installation
- Internet connection for package download

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

This tool is designed for legitimate use cases such as secure remote access, privacy enhancement, or network testing. Please ensure compliance with all applicable laws and regulations when using proxy servers.
