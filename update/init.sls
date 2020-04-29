{% if grains['os_family'] == 'Debian' %}

aptupdates:
  pkg.uptodate:
    - name: aptupdates
    - refresh: True
    - order: last
    - resolve_capabilities: True
{% endif %}

