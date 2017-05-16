.PHONY: install
install: all

all:
	@mkdir -p /etc/firewall/custom
	@echo "etc folder created"
	@install -m 755 firewall /usr/bin/firewall
	@echo "Program added to /usr/bin directory"
	@cp etc/firewall/*.conf /etc/firewall
	@cp -r etc/systemd /etc
	@systemctl daemon-reload
	@echo "The program is successfully installed."
	@echo 'Run `systemctl enable firewall` to start it automatically during system startup.'

.PHONY: uninstall
uninstall:
	@rm -rf /etc/firewall
	@echo "Removed /etc/firewall"
	@rm -f /usr/bin/firewall
	@echo "Removed /usr/bin/firewall"
	@systemctl stop firewall
	@rm /etc/systemd/system/firewall.service
	@systemctl daemon-reload
	@echo "The program is successfully uninstalled"
