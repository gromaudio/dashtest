#! /usr/bin/env python
# -*- coding: utf-8 -*-
'''
Copyright (C) 2013-2016  Diego Torres Milano
Created on 2016-06-10 by Culebra v11.5.8
                      __    __    __    __
                     /  \  /  \  /  \  /  \ 
____________________/  __\/  __\/  __\/  __\_____________________________
___________________/  /__/  /__/  /__/  /________________________________
                   | / \   / \   / \   / \   \___
                   |/   \_/   \_/   \_/   \    o \ 
                                           \_____/--<
@author: Diego Torres Milano
@author: Jennifer E. Swofford (ascii art snake)
'''


import re
import sys
import os


try:
    sys.path.insert(0, os.path.join(os.environ['ANDROID_VIEW_CLIENT_HOME'], 'src'))
except:
    pass

from com.dtmilano.android.viewclient import ViewClient

TAG = 'CULEBRA'

_s = 5
_v = '--verbose' in sys.argv


kwargs1 = {'ignoreversioncheck': False, 'verbose': False, 'ignoresecuredevice': False}
device, serialno = ViewClient.connectToDeviceOrExit(**kwargs1)
kwargs2 = {'forceviewserveruse': False, 'useuiautomatorhelper': False, 'ignoreuiautomatorkilled': True, 'autodump': False, 'startviewserver': True, 'compresseddump': True}
vc = ViewClient(device, serialno, **kwargs2)
#vc.dump(window='-1') # FIXME: seems not needed

#vc.dump(window=-1)
#vc.findViewByIdOrRaise("com.example.android.apis:id/username_edit").setText(u"hello culebra!")
#vc.sleep(_s)
vc.dump(window=-1)
vc.findViewWithTextOrRaise(u'dashlinqbetatest@gmail.com').touch()

vc.dump(window=-1)
vc.findViewWithTextOrRaise(u'OK').touch()