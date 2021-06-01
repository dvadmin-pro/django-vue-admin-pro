from django.test import TestCase

import re

str = "roleIdToMenu/(?P<pk>.*?)/"
line = "roleIdToMenu/456b688c-8ad5-46de-bc2e-d41d8047bd42/"
matchObj = re.match( r'roleIdToMenu/(?P<pk>.*?)/', line, re.M|re.I)
if matchObj:
   print ( matchObj.group())
else:
   print ("No match!!")