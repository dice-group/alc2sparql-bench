#!/bin/bash

{{ target_dir }}/systems/tentris/{{ item[0] }}/tentris -s {{ target_dir }}/databases/tentris/{{ item[0] }}/{{ item[1].name }}/ load < {{ item[1].path }} | tee {{ target_dir }}/logs/load/tentris-{{ item[0] }}-{{ item[1].name }}.log
