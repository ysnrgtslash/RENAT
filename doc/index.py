""" 
Document for RENAT framework

All in one pdf renat.pdf_

#########
Libraries
#########


RENAT includes following libraries:

Common_:
    Common library of RENAT

VChannel_:
    Library controls connection to targets (servers, routers, ...)

Logger_:
    Library provides enhanced loggging keywords
Optical_: 
    Library provides keywords for controlling L1 Switch(Calient)
Router_:
    Library provides keywords to control routers, includes mod_juniper_ mod , mod_cisco_ mod and mod_gr_ mod
Tester_:
    Library provieds keywors to control testers, includes mod_ixnet_ and mod_ixload_
WebApp_:
    Common library for web application, includes 2 child libraries: Samurai_ and Arbor_

|

######
Others
######


Readme_:
    Release information

Choose each libraries for detail infomration and samples about keywords.

.. _renat.pdf:   ./renat.pdf
.. _Common:     ./Common.html
.. _VChannel:   ./VChannel.html
.. _Logger:     ./Logger.html
.. _Optical:    ./OpticalSwitch.html
.. _Router:     ./Router.html
.. _Tester:     ./Tester.html
.. _WebApp:     ./WebApp.html
.. _mod_juniper:    ./router_mod_juniper.html
.. _mod_cisco:      ./router_mod_cisco.html
.. _mod_gr:         ./router_mod_gr.html
.. _mod_ixnet:      ./tester_mod_ixnet.html
.. _mod_ixload:     ./tester_mod_ixload.html
.. _Samurai:        ./Samurai.html   
.. _Arbor:          ./Arbor.html   
.. _Readme:         ./Readme.html   

"""
ROBOT_LIBRARY_DOC_FORMAT = 'reST'
import Common

ROBOT_LIBRARY_VERSION = Common.version()

