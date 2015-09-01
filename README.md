Copyright 2012-2014 Bogatkin Dmitry

email: dr.dim.pro@gmail.com

skype: dr.dim.pro


Unofficial repository for products JetBrains and EAP version and my castom  ports.


Add repository
==============

Install layman:

    # emerge -av layman

Add line to config /etc/layman.cfg (/etc/layman/layman.cfg):
change

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml

on

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://raw.github.com/drdim/layman/extended/overlay.xml


Synchronize:

    # sudo layman -S

Add repository:

    # sudo layman -a drdim-extended

Install ebuild:
    
    # sudo emerge pycharm-community
