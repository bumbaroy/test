#!/usr/bin/env python
from socket import gethostname

def function():
    host = gethostname()
    grains = {}
    if "webserver1" in host:
        grains['update'] = "firstwave"
    elif "webserver2" in host:
        grains['update'] = "firstwave"
    elif "webserver3" in host:
        grains['update'] = "firstwave"
    elif "load-balancer" in host:
        grains['update'] = "secondwave"
    elif "nagios" in host:
        grains['update'] = "secondwave"
    elif "salt-master" in host:
        grains['update'] = "secondwave"
    else:
        grains['update'] = "finalwave"
    return grains

