#!/usr/bin/env python
from socket import gethostname

def function():
    host = gethostname()
    grains = {}
    if "webserver1" in host:
        grains['updates'] = "firstwave"
    elif "webserver2" in host:
        grains['updates'] = "firstwave"
    elif "webserver3" in host:
        grains['updates'] = "firstwave"
    elif "load-balancer" in host:
        grains['updates'] = "secondwave"
    elif "nagios" in host:
        grains['updates'] = "secondwave"
    elif "salt-master" in host:
        grains['updates'] = "secondwave"
    else:
        grains['updates'] = "finalwave"
    return grains

