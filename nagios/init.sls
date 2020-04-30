install nagios:
  pkg.installed:
    - pkgs:
      - nagios
      - nagios-nrpe-plugin

ensure nagios should be running and enable it to start at boot:
  service.running:
    - name: nagios.service
    - enable: True

/etc/nagios3/htpasswd.users:
  file.managed:
    - source: salt://nagios/files/nagios3/htpasswd.users
    - user: nagios
    - group: nagios
    - mode: 644

monitored-hosts.cfg:
  file.managed:
    - user: nagios
    - group: nagios
    - mode: '0644'
    - names:
      - /etc/nagios3/conf.d/load-balancer.cfg:
        - source: salt://nagios/monitored-hosts/load-balancer.cfg
      - /etc/nagios3/conf.d/webserver1.cfg:
        - source: salt://nagios/monitored-hosts/webserver1.cfg
      - /etc/nagios3/conf.d/webserver2.cfg:
        - source: salt://nagios/monitored-hosts/webserver2.cfg
      - /etc/nagios3/conf.d/webserver3.cfg:
        - source: salt://nagios/monitored-hosts/webserver3.cfg
      - /etc/nagios3/conf.d/salt-master.cfg:
        - source: salt://nagios/monitored-hosts/saltmaster.cfg

