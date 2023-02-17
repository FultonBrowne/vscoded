# Variables
SCRIPT_NAME=vscoded.sh
UNIT_FILE=my_vscoded.service
INSTALL_DIR=/usr/local/bin
SYSTEMD_DIR=/etc/systemd/system

# Default target
all: install

# Install target
install: install_script install_unit
    @echo "Installation complete."

# Install the script to the specified directory
install_script:
    @echo "Installing script to $(INSTALL_DIR) ..."
    install -m 755 $(SCRIPT_NAME) $(INSTALL_DIR)

# Install the systemd unit file to the specified directory
install_unit:
    @echo "Installing systemd unit file to $(SYSTEMD_DIR) ..."
    install -m 644 $(UNIT_FILE) $(SYSTEMD_DIR)

# Uninstall target
uninstall:
    @echo "Uninstalling script and systemd unit file..."
    rm -f $(INSTALL_DIR)/$(SCRIPT_NAME)
    rm -f $(SYSTEMD_DIR)/$(UNIT_FILE)

# Reload systemd daemon after making changes
reload_systemd:
    systemctl daemon-reload

# Enable the systemd service to run at boot time
enable_systemd:
    systemctl enable $(UNIT_FILE)

# Disable the systemd service from running at boot time
disable_systemd:
    systemctl disable $(UNIT_FILE)