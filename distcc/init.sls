# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "distcc/map.jinja" import distcc with context %}

distcc-pkg:
  pkg.installed:
    - name: {{ distcc.pkg }}

hosts-config:
  file.managed:
    - name: {{ distcc.config_hosts }}
    - source: salt://distcc/files/hosts
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - context:
      config: {{ distcc }}
    - watch_in:
      - service: {{ distcc.service.name }}
