# S5-QuickProxy

**Project Description:**

S5-QuickProxy is a lightweight, secure SOCKS5 proxy deployment tool that allows you to quickly set up a reliable proxy server on any Debian/Ubuntu-based Linux system. This bash script automates the installation and configuration of the Dante SOCKS server with username/password authentication, making it ideal for secure internet access, bypassing network restrictions, or enhancing privacy.

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

### Basic Installation Options

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

### Quick One-Line Installation

For quick deployment on a fresh server, you can use this one-line command:

```bash
sudo apt install curl -y && sudo curl -O https://raw.githubusercontent.com/bunjmuwqot/S5-QuickProxy/refs/heads/main/setup.sh && sudo chmod +x setup.sh && sudo ./setup.sh -s5pass <Enter your password here>
```

This command will:
1. Install curl if not already installed
2. Download the setup script directly from the GitHub repository
3. Make the script executable
4. Run the installation with a custom SOCKS5 password

### Connecting to Your Proxy

After installation, you can connect to your SOCKS5 proxy using any SOCKS5-compatible client with these settings:
- **Server**: Your server's IP address
- **Port**: 80
- **Username**: admin
- **Password**: Your specified password (or the default if not specified)

## After Installation

Once installed, your SOCKS5 proxy will be:
- Running on port 80
- Accessible using username: admin
- Password as specified (or default if not specified)
- Automatically started on system boot

## Verification

To verify your proxy is working correctly, you can use:

```bash
systemctl status danted
```

To check the logs:

```bash
tail -f /var/log/danted.log
```

## Security Considerations

- The script runs Dante on port 80 by default for maximum compatibility
- Consider using a firewall to restrict access if needed
- Regularly update your passwords for enhanced security
- For production environments, consider changing the default port

## Requirements

- Debian/Ubuntu-based Linux distribution
- Root privileges for installation
- Internet connection for package download

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

This tool is designed for legitimate use cases such as secure remote access, privacy enhancement, or network testing. Please ensure compliance with all applicable laws and regulations when using proxy servers.
