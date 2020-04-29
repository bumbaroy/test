{% if grains['os_family'] == 'Debian' %}
include: 
  - updates/blacklist

aptupdates:
  pkg.uptodate:
    - name: aptupdates
    - refresh: True
    - order: last
    - resolve_capabilities: True
{% endif %}

