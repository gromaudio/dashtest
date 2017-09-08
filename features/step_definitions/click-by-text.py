#! /usr/bin/env python
'''
Copyright (C) 2012  Diego Torres Milano
Created on May 5, 2012

@author: diego
'''

import sys
import os
import time

try:
    sys.path.append(os.path.join(os.environ['ANDROID_VIEW_CLIENT_HOME'], 'src'))
except:
    pass

from com.dtmilano.android.viewclient import ViewClient

vc = ViewClient(*ViewClient.connectToDeviceOrExit())
bt = sys.argv[2]
b = vc.findViewWithText(bt)
if b:
    (x, y) = b.getXY()
    b.touch()
    sys.exit(0)
else:
    sys.exit(1)

