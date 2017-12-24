# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "distcc/map.jinja" import distcc with context %}

include:
  - distcc

{%- for compiler_pkg in distcc.server.compiler_pkgs %}

compiler_pkg_{{ compiler_pkg }}:
  pkg.installed:
    - name: {{ compiler_pkg }}

{%- endfor %}

{%- for compiler_symlink in distcc.server.compiler_symlinks %}

compiler_symlink_{{ loop.index }}:
  file.symlink:
    - name: {{ compiler_symlink.name }}
    - target: {{ compiler_symlink.target }}

{%- endfor %}

server-config:
  file.managed:
    - name: {{ distcc.config_server }}
    - source: salt://distcc/files/distcc
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - context:
      config: {{ distcc.server }}
    - watch_in:
      - service: {{ distcc.service.name }}

distcc-service:
  service.running:
    - name: {{ distcc.service.name }}
    - enable: True
